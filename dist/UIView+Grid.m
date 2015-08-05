//
//  UIView+Grid.m
//  Checkout
//
//  Created by Benjamin Steephenson on 7/30/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "UIView+Grid.h"

@implementation UIView(Grid)

- (CGRect)frameWithX:(float)x Y:(float)y Width:(float)width Height:(float)height
{
    float fullHeight = self.bounds.size.height;
    float fullWidth = self.bounds.size.width;
    
    x = x * fullWidth;
    y = y * fullHeight;
    width = width * fullWidth;
    height = height * fullHeight;
    
    return CGRectMake(x, y, width, height);
}

- (CGRect)frameWithX:(float)x Y:(float)y Width:(float)width Height:(float)height Pad:(float)padding
{
    return CGRectInset([self frameWithX:x Y:y Width:width Height:height], padding, padding);
}

- (CGRect)frameWithX:(float)x Y:(float)y Width:(float)width Height:(float)height PadX:(float)paddingX PadY:(float)paddingY
{
    return CGRectInset([self frameWithX:x Y:y Width:width Height:height], paddingX, paddingY);
}

@end
