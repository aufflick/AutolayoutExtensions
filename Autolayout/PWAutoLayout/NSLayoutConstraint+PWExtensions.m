//
//  NSLayoutConstraint-PWExtensions.m
//
//  Created by Frank Illenberger on 05.11.12.
//

#import "PWView+PWExtensions.h"
#import "NSLayoutConstraint+PWExtensions.h"
#import <objc/runtime.h>

#if TARGET_OS_IPHONE
@compatibility_alias PWView UIView;
#else
@compatibility_alias PWView NSView;
#endif

@implementation NSLayoutConstraint (PWExtensions)

#pragma mark - Hiding Master View

static NSString *const PWHidingMasterViewKey = @"net.projectwizards.net.hidingMasterView";

- (PWView *)PWHidingMasterView
{
    return objc_getAssociatedObject(self, (__bridge const void*)PWHidingMasterViewKey);
}

- (void)setPWHidingMasterView:(PWView*)master
{
    PWView* previousMaster = self.PWHidingMasterView;
    if (master != previousMaster)
    {
        [previousMaster PWUnregisterHidingSlave:self];
        objc_setAssociatedObject(self, (__bridge const void*)PWHidingMasterViewKey, master, OBJC_ASSOCIATION_ASSIGN);
        [master PWRegisterHidingSlave:self];
    }
}

#pragma mark - Original Constant

static NSString *const PWOriginalConstantKey = @"net.projectwizards.net.PWOriginalConstant";

- (NSNumber *)PWOriginalConstant
{
    return objc_getAssociatedObject(self, (__bridge const void*)PWOriginalConstantKey);
}

- (void)setPWOriginalConstant:(NSNumber*)constant
{
    objc_setAssociatedObject(self, (__bridge const void*)PWOriginalConstantKey, constant, OBJC_ASSOCIATION_COPY);
}

#pragma mark - PWHidingSlave protocol

- (void)setPWHidden:(BOOL)hidden
{
    if (hidden != self.isPWHidden)
    {
        if (hidden)
        {
            // Remember constant for later unhiding of constraint
            self.PWOriginalConstant = @(self.constant);
            self.constant = 0.0;
        }
        else
        {
            NSAssert(self.PWOriginalConstant, nil);
            self.constant = self.PWOriginalConstant.doubleValue;
            self.PWOriginalConstant = nil;
        }
    }
}

- (BOOL)isPWHidden
{
    return self.PWOriginalConstant != nil;
}

@end