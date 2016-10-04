//
//  MailReceiptPlugin.h
//  MailReceipt
//
//  Created by Gyorvari Gabor on 2016. 09. 16..
//  Copyright © 2016. Gyorvari Gabor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MailReceiptPlugin : NSObject
+ (BOOL)isElCapitan;
+ (NSString *) extractEmailAddress:(NSString *)address;
@end

@interface MailReceiptPlugin (NoImplementation)
+ (id)sharedInstance;
@end
 