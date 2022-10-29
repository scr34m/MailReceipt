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

package:
	pkgbuild --install-location /private/tmp/MailReceipt-Installation-Temp --scripts Packaging --identifier hu.deeb.MailReceipt --root $(VPATH) --filter ".pkg|.dSYM|.zip" $(VPATH)/$(TARGET)-unsigned.pkg
	productsign --sign "Developer ID Installer: Deeb-IT Kft (DRRDUBQ4YF)" $(VPATH)/$(TARGET)-unsigned.pkg $(VPATH)/$(TARGET).pkg
	xcrun notarytool submit $(VPATH)/$(TARGET).pkg --keychain-profile "xcrun" --wait
	xcrun stapler staple $(VPATH)/$(TARGET).pkg

clean:
	rm -rf "./build"