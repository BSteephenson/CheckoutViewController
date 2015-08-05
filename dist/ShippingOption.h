//
//  ShippingOption.h
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShippingOption : NSObject

@property(nonatomic) NSString *name;
@property(nonatomic) NSString *descriptionText;
@property(nonatomic) NSString *cost;

@end
