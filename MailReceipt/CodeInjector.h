//
//  CodeInjector.h
//  MailReceipt
//
//  Created by Gyorvari Gabor on 2016. 09. 16..
//  Copyright © 2016. Gyorvari Gabor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodeInjector : NSObject
+ (void)injectUsingMethodPrefix:(NSString *)prefix;
+ (void)injectUsingMethodPrefix:(NSString *)prefix hooks:(NSDictionary*)hooks;
+ (NSDictionary *)hooks;
@end
