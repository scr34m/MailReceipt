//
//  MFSMTPConnection+MailReceiptPlugin.m
//  MailReceipt
//
//  Created by Gyorvari Gabor on 2017. 03. 01..
//  Copyright © 2017. Gyorvari Gabor. All rights reserved.
//

#import "MFSMTPConnection+MailReceiptPlugin.h"

@implementation MFSMTPConnection_MailReceiptPlugin

- (long long)MPP_sendCommand:(const char *)arg1 length:(unsigned long long)arg2 argument:(NSString *)arg3 dontLogArgumentRange:(struct _NSRange)arg4 trailer:(unsigned char)arg5 {

    // check for rcpt to command
    if (arg2 && strcmp(arg1, "RCPT TO:<") == 0) {
        // check for mark in the address, if found it will be expanded with domain by Mail.app
        // ex.: [NOTIFY]scr34m@frontember.hu@frontember.hu
        if ([arg3 rangeOfString:@"[NOTIFY]"].location != NSNotFound) {
            // 8 is the length of our mark [NOTIFY]
            NSRange finalRange = NSMakeRange(8, arg3.length - 8);
            // add extra ESMTP command for DSN
            arg3 = [NSString stringWithFormat: @"%@> NOTIFY=SUCCESS,FAILURE", [arg3 substringWithRange:finalRange]];
            arg5 = 0;
        }
    }

    return [self MPP_sendCommand:arg1 length:arg2 argument:arg3 dontLogArgumentRange:arg4 trailer:arg5];
}

@end
