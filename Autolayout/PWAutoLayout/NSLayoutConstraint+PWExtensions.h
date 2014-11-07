//
//  NSLayoutConstraint-PWExtensions.h
//
//  Created by Frank Illenberger on 05.11.12.
//

#import "PWViewAliases.h"

@protocol PWViewHidingSlave;

@interface NSLayoutConstraint (PWExtensions) <PWViewHidingSlave>

#if TARGET_OS_IPHONE
@property (nonatomic, readwrite, unsafe_unretained) IBOutlet UIView *PWHidingMasterView;
#else
@property (nonatomic, readwrite, unsafe_unretained) IBOutlet NSView *PWHidingMasterView;
#endif

@end
