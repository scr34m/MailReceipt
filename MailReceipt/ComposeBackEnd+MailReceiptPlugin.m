//
//  ComposeBackEnd+MailReceiptPlugin.m
//  MailReceipt
//
//  Created by Gyorvari Gabor on 2016. 09. 17..
//  Copyright © 2016. Gyorvari Gabor. All rights reserved.
//

#import "ComposeBackEnd+MailReceiptPlugin.h"
#import "MCMutableMessageHeaders.h"
#import "ComposeBackEnd.h"
#import "NSObject+LPDynamicIvars.h"
#import "MailReceiptPlugin.h"

@implementation ComposeBackEnd_MailReceiptPlugin

- (id)MPP_newOutgoingMessageUsingWriter:(id)writer contents:(id)contents headers:(id)headers isDraft:(BOOL)isDraft {
    ComposeBackEnd *backEnd = (ComposeBackEnd *)self;
    
    NSString *senderEmail = [MailReceiptPlugin extractEmailAddress:backEnd.sender];

    if ([[backEnd getIvar:@"readReceipt"] boolValue]) {
        [headers setHeader:senderEmail forKey:@"Disposition-Notification-To"];
    }
    
    if ([[backEnd getIvar:@"deliveryReceipt"] boolValue]) {
        [headers setHeader:senderEmail forKey:@"Return-Receipt-To"];
    }
    
    return [self MPP_newOutgoingMessageUsingWriter:writer contents:contents headers:headers isDraft:isDraft];
}

@end
