//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MCTaskHandler.h"

@class MFEWSAccount;

@interface MFEWSPersistenceTaskHandler : MCTaskHandler
{
    MFEWSAccount *_account;
}

@property(readonly) __weak MFEWSAccount *account; // @synthesize account=_account;
- (void).cxx_destruct;
- (id)init;
- (id)initWithAccount:(id)arg1;

@end
