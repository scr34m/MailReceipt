//
//  MailReceiptPlugin.m
//  MailReceipt
//
//  Created by Gyorvari Gabor on 2016. 09. 16..
//  Copyright © 2016. Gyorvari Gabor. All rights reserved.
//

#import <AppKit/AppKit.h>
#import <objc/objc-runtime.h>
#import "MailReceiptPlugin.h"
#import "CodeInjector.h"
#import "HeadersEditor+MailReceiptPlugin.h"
#import "MVMailBundle.h"

int LoggingLevel = 0;

@implementation MailReceiptPlugin

+ (void)initialize {
    // Make sure the initializer is only run once.
    // Usually is run, for every class inheriting from
    // GPGMailBundle.
    if(self != [MailReceiptPlugin class])
        return;
    
    Class mvMailBundleClass = NSClassFromString(@"MVMailBundle");
    // If this class is not available that means Mail.app
    // doesn't allow plugins anymore. Fingers crossed that this
    // never happens!
    if(!mvMailBundleClass)
        return;
    
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated"
    class_setSuperclass([self class], mvMailBundleClass);
#pragma GCC diagnostic pop
    
    // Initialize the bundle by swizzling methods, loading keys, ...
    MailReceiptPlugin *instance = [MailReceiptPlugin sharedInstance];
    
    [[((MVMailBundle *)self) class] registerBundle];             // To force registering composeAccessoryView and preferences
}

+ (BOOL)isElCapitan {
    NSProcessInfo *info = [NSProcessInfo processInfo];
    if(![info respondsToSelector:@selector(isOperatingSystemAtLeastVersion:)])
        return NO;
    
    NSOperatingSystemVersion requiredVersion = {10,11,0};
    return [info isOperatingSystemAtLeastVersion:requiredVersion];
}

- (NSString *)version {
    return @"0.4.0";
}

- (id)init {
    if (self = [super init]) {
        NSLog(@"Loaded MailReceiptPlugin %@", [self version]);
        [CodeInjector injectUsingMethodPrefix:@"MPP"];
    }
    return self;
}

// extract e-mail address from RFC822 email address format ex.: Jon Doe <jon@example.com>
+ (NSString *) extractEmailAddress: (NSString *)address
{
    NSRange r = [address rangeOfString:@"<" options:NSBackwardsSearch];
    NSString *senderEmail = [address substringFromIndex:r.location + 1];
    r = [senderEmail rangeOfString:@">" options:NSBackwardsSearch];
    return [senderEmail substringToIndex:r.location];
}
@end
