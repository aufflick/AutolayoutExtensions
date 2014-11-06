//
//  NSLayoutConstraint-PWExtensions.h
//
//  Created by Frank Illenberger on 05.11.12.
//

#if TARGET_OS_IPHONE
#import "UIView+PWExtensions.h"
#else
#import "NSView+PWExtensions.h"
#endif

@interface NSLayoutConstraint (PWExtensions) <PWViewHidingSlave>

@property (nonatomic, readwrite, unsafe_unretained) IBOutlet PWView *PWHidingMasterView;

@end
