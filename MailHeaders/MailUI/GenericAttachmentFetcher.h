//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Oct 25 2017 03:49:04).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

#import "MCActivityTarget-Protocol.h"

@class NSArray, NSMutableSet, NSString;

@interface GenericAttachmentFetcher : NSObject <MCActivityTarget>
{
    NSMutableSet *_attachmentsBeingDownloaded;
    NSArray *_attachmentViewControllers;
    GenericAttachmentFetcher *_me;
}

@property(retain, nonatomic) GenericAttachmentFetcher *me; // @synthesize me=_me;
@property(copy, nonatomic) NSArray *attachmentViewControllers; // @synthesize attachmentViewControllers=_attachmentViewControllers;
- (void).cxx_destruct;
@property(readonly, nonatomic) double temporaryFolderTimeout;
- (void)didSaveAttachment:(id)arg1 toPath:(id)arg2;
- (void)didSaveAttachments:(id)arg1 paths:(id)arg2;
- (void)downloadedAllAttachments;
- (void)didFinishBackgroundLoadOfAttachment:(id)arg1;
- (void)beginSaveOfAttachments:(id)arg1 toTemporaryFolderWithName:(id)arg2 taskName:(id)arg3;
- (void)_saveAttachments:(id)arg1 itemManager:(id)arg2;
@property(readonly, copy, nonatomic) NSArray *downloadedAttachments;
- (void)cancelBackgroundLoad;
- (void)beginBackgroundLoad;
- (void)_downloadCompleted:(id)arg1;
- (id)init;
- (id)initWithAttachmentViewControllers:(id)arg1;
- (void)dealloc;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly, copy, nonatomic) NSString *displayName;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end
