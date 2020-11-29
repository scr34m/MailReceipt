.PHONY: build

PROJECT = MailReceipt
TARGET = MailReceipt
PRODUCT = MailReceipt.mailbundle
VPATH = build/Release

build:
	@xcodebuild -project $(PROJECT).xcodeproj -target $(TARGET) build $(XCCONFIG)
	zip -r -9 $(VPATH)/$(PRODUCT).zip $(VPATH)/$(PRODUCT)
	# Fix for notarize error: The signature does not include a secure timestamp.
	codesign -s "Developer ID Application: Deeb-IT Kft (DRRDUBQ4YF)" --options=runtime --force $(VPATH)/$(PRODUCT)/Contents/MacOS/$(TARGET)

notarize:
	mkdir $(VPATH)/notarize/
	cp -r $(VPATH)/$(PRODUCT) $(VPATH)/notarize/
	hdiutil create -volname MailReceipt -srcfolder $(VPATH)/notarize/ -ov -format UDBZ $(VPATH)/$(TARGET).dmg
	codesign -s "Developer ID Application: Deeb-IT Kft (DRRDUBQ4YF)" --timestamp $(VPATH)/$(TARGET).dmg
	xcrun altool --notarize-app --primary-bundle-id "hu.deeb.MailReceipt" -u "scr34m@frontember.hu" -p "@keychain:AppPassword" -t osx -f $(VPATH)/$(TARGET).dmg --team-id DRRDUBQ4YF

package:
	pkgbuild --install-location /private/tmp/MailReceipt-Installation-Temp --scripts Packaging --identifier hu.deeb.MailReceipt --root $(VPATH) --filter ".pkg|.dSYM|.zip" $(VPATH)/$(TARGET)-unsigned.pkg
	productsign --sign "Developer ID Installer: Deeb-IT Kft (DRRDUBQ4YF)" $(VPATH)/$(TARGET)-unsigned.pkg $(VPATH)/$(TARGET).pkg
	xcrun altool --notarize-app --primary-bundle-id "hu.deeb.MailReceipt" -u "scr34m@frontember.hu" -p "@keychain:AppPassword" -f $(VPATH)/$(TARGET).pkg --team-id DRRDUBQ4YF

clean:
	rm -rf "./build"