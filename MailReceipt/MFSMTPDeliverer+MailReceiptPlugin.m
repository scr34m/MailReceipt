//
//  MFSMTPDeliverer+MailReceiptPlugin.m
//  MailReceipt
//
//  Created by Gyorvari Gabor on 2017. 03. 01..
//  Copyright © 2017. Gyorvari Gabor. All rights reserved.
//

#import "MFSMTPDeliverer+MailReceiptPlugin.h"

@implementation MFSMTPDeliverer_MailReceiptPlugin

- (long long)MPPDeliverMessageHeaderData:(NSMutableData *)arg1 bodyData:(NSData *)arg2 toRecipients:(NSMutableArray *)arg3 {

    // check for disposition notification header, if found mark recipents addresses
    NSString *s = [[NSString alloc] initWithData:arg1 encoding:NSUTF8StringEncoding];
    if ([s rangeOfString:@"Return-Receipt-To: "].location != NSNotFound) {
        for(int i = 0; i < arg3.count; i++)
        {
            [arg3 replaceObjectAtIndex:i withObject:[@"[NOTIFY]" stringByAppendingString:[arg3 objectAtIndex:i]]];
        }
    }

    return [self MPPDeliverMessageHeaderData:arg1 bodyData:arg2 toRecipients:arg3];
}

@end
