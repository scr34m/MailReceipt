//
//  ComposeBackEnd+MailReceiptPlugin.h
//  MailReceipt
//
//  Created by Gyorvari Gabor on 2016. 09. 17..
//  Copyright © 2016. Gyorvari Gabor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComposeBackEnd_MailReceiptPlugin : NSObject
- (id)MPP_newOutgoingMessageUsingWriter:(id)writer contents:(id)contents headers:(id)headers isDraft:(BOOL)isDraft;
@end
