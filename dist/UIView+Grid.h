//
//  UIView+Grid.h
//  Checkout
//
//  Created by Benjamin Steephenson on 7/30/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(Grid)

- (CGRect)frameWithX:(float)x Y:(float)y Width:(float)width Height:(float)height Pad:(float)padding;
- (CGRect)frameWithX:(float)x Y:(float)y Width:(float)width Height:(float)height;
- (CGRect)frameWithX:(float)x Y:(float)y Width:(float)width Height:(float)height PadX:(float)paddingX PadY:(float)paddingY;

@end
