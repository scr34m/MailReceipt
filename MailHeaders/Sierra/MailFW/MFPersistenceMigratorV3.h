//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@interface MFPersistenceMigratorV3 : NSObject
{
    id <MFPersistenceMigratorV3Delegate> _delegate;
}

@property(nonatomic) __weak id <MFPersistenceMigratorV3Delegate> delegate; // @synthesize delegate=_delegate;
- (void).cxx_destruct;
- (void)_migrateDefaults;
- (id)_fixSmartMailboxCriteria:(id)arg1;
- (id)_updateSmartMailboxes:(id)arg1;
- (id)_fixCriteria:(id)arg1;
- (id)_updateRules:(id)arg1;
- (void)_migratePlistsContainingPaths;
- (void)_moveAccountsPlistFromV3BackToV2;
- (void)migrate;

@end

