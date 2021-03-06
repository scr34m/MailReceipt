//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Oct 25 2017 03:49:04).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

#import <Mail/EFCancelable-Protocol.h>
#import <Mail/EFLoggable-Protocol.h>
#import <Mail/MFSearchableIndexQueryResultCollectorBuilder-Protocol.h>
#import <Mail/MFSearchableIndexQueryResultProcessorDelegate-Protocol.h>
#import <Mail/MFSearchableIndexQueryResultProvider-Protocol.h>

@class EFFuture, EFPromise, EMSearchableIndexQuery, EMSearchableIndexQueryExpression, MFMessageCriterion, NSString;
@protocol MFMessageConsumer, MFSearchableIndexQueryResultProcessor;

@interface MFSearchableIndexQueryResultCollector : NSObject <EFLoggable, MFSearchableIndexQueryResultProcessorDelegate, MFSearchableIndexQueryResultCollectorBuilder, EFCancelable, MFSearchableIndexQueryResultProvider>
{
    BOOL _live;
    unsigned int _options;
    MFMessageCriterion *_criterion;
    id <MFMessageConsumer> _target;
    NSString *_logIdentifier;
    EMSearchableIndexQueryExpression *_expression;
    id <MFSearchableIndexQueryResultProcessor> _processor;
    EMSearchableIndexQueryExpression *_originalExpression;
    CDUnknownBlockType _recoveryBlock;
    EMSearchableIndexQuery *_query;
    EFPromise *_gatheredPromise;
}

+ (id)queryResultCollectorWithExpression:(id)arg1 processor:(id)arg2 builder:(CDUnknownBlockType)arg3;
+ (id)log;
@property(retain, nonatomic) EFPromise *gatheredPromise; // @synthesize gatheredPromise=_gatheredPromise;
@property(retain, nonatomic) EMSearchableIndexQuery *query; // @synthesize query=_query;
@property(copy, nonatomic) CDUnknownBlockType recoveryBlock; // @synthesize recoveryBlock=_recoveryBlock;
@property(nonatomic) BOOL live; // @synthesize live=_live;
@property(retain, nonatomic) EMSearchableIndexQueryExpression *originalExpression; // @synthesize originalExpression=_originalExpression;
@property(retain, nonatomic) id <MFSearchableIndexQueryResultProcessor> processor; // @synthesize processor=_processor;
@property(retain, nonatomic) EMSearchableIndexQueryExpression *expression; // @synthesize expression=_expression;
@property(copy, nonatomic) NSString *logIdentifier; // @synthesize logIdentifier=_logIdentifier;
@property(retain, nonatomic) id <MFMessageConsumer> target; // @synthesize target=_target;
@property(nonatomic) unsigned int options; // @synthesize options=_options;
@property(retain, nonatomic) MFMessageCriterion *criterion; // @synthesize criterion=_criterion;
- (void).cxx_destruct;
- (void)_processRemovedIdentifiers:(id)arg1;
- (void)_processSearchableItems:(id)arg1;
- (id)_persistentIDIfValidFromItemIdentifier:(id)arg1;
- (BOOL)hasFinishedGatheringForSearchableIndexQueryResultProcessor:(id)arg1;
@property(readonly, nonatomic) EFFuture *gatheredFuture;
- (id)criterionForSearchableIndexQueryResultProcessor:(id)arg1;
- (id)messageConsumerForSearchableIndexQueryResultProcessor:(id)arg1;
@property(readonly, nonatomic, getter=isCancelled) BOOL cancelled;
- (void)cancel;
- (void)start;
- (id)initWithExpression:(id)arg1 processor:(id)arg2 builder:(CDUnknownBlockType)arg3;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

