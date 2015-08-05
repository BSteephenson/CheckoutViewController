//
//  ShippingAddress.m
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "BSTAddress.h"

@implementation BSTAddress

- (NSString *)stringValue
{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    [string appendString:self.name];
    [string appendString:@", "];
    [string appendString:self.street];
    [string appendString:@", "];
    [string appendString:self.city];
    [string appendString:@", "];
    [string appendString:self.state];
    [string appendString:@", "];
    [string appendString:self.ZIP];
    return string;
}

@end
