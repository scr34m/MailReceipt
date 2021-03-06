//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Oct 25 2017 03:49:04).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

#import "MarkupDrawingControllerDelegate-Protocol.h"
#import "NSSharingServiceDelegate-Protocol.h"
#import "NSSharingServicePickerDelegate-Protocol.h"

@class EditableWebMessageDocument, MarkupDrawingController, NSString, NSView;
@protocol AttachmentManagerDelegate, EditingWebMessageControllerDelegate;

@interface EditingWebMessageController : NSObject <MarkupDrawingControllerDelegate, NSSharingServiceDelegate, NSSharingServicePickerDelegate>
{
    NSView *_webView;
    MarkupDrawingController *_drawingController;
    EditableWebMessageDocument *_document;
    BOOL _isForURLSharing;
    id <AttachmentManagerDelegate> _attachmentDelegate;
    id <EditingWebMessageControllerDelegate> _editingDelegate;
    struct CGRect _frameOfItemToShare;
}

@property(nonatomic) BOOL isForURLSharing; // @synthesize isForURLSharing=_isForURLSharing;
@property(nonatomic) struct CGRect frameOfItemToShare; // @synthesize frameOfItemToShare=_frameOfItemToShare;
@property(nonatomic) __weak id <EditingWebMessageControllerDelegate> editingDelegate; // @synthesize editingDelegate=_editingDelegate;
@property(nonatomic) __weak id <AttachmentManagerDelegate> attachmentDelegate; // @synthesize attachmentDelegate=_attachmentDelegate;
@property(readonly, nonatomic) NSView *webView; // @synthesize webView=_webView;
@property(readonly, nonatomic) EditableWebMessageDocument *document; // @synthesize document=_document;
- (void).cxx_destruct;
- (void)_adjustSpellingAndGrammarMenuItems:(id)arg1 checkSpellingWhileTypingTag:(long long)arg2 checkGrammarWithSpellingTag:(long long)arg3;
- (id)destinationPathForDownloadWithSuggestedFilename:(id)arg1;
- (void)addOpenLinkMenuItemsIfNeededWithURL:(id)arg1 toArray:(id)arg2;
- (void)addPasteAndQuoteLevelMenuItemsToArray:(id)arg1;
- (BOOL)openURL:(id)arg1 keepAppFocus:(BOOL)arg2;
- (BOOL)_isInternalURL:(id)arg1;
- (id)sharingService:(id)arg1 sourceWindowForShareItems:(id)arg2 sharingContentScope:(long long *)arg3;
- (id)sharingService:(id)arg1 transitionImageForShareItem:(id)arg2 contentRect:(struct CGRect *)arg3;
- (struct CGRect)sharingService:(id)arg1 sourceFrameOnScreenForShareItem:(id)arg2;
- (id)sharingServicePicker:(id)arg1 delegateForSharingService:(id)arg2;
- (void)sharingService:(id)arg1 didShareItems:(id)arg2;
- (id)sharingServicePicker:(id)arg1 sharingServicesForItems:(id)arg2 proposedSharingServices:(id)arg3;
- (void)markupDrawingController:(id)arg1 didCancelWithError:(id)arg2;
- (void)markupDrawingController:(id)arg1 didCreateDrawingWithURL:(id)arg2;
- (void)_openLinkBehind:(id)arg1;
- (void)_openLink:(id)arg1;
- (id)init;
- (id)initWithDocument:(id)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

