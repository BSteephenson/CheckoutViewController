//
//  ShippingAddress.h
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSTAddress : NSObject

@property(nonatomic) NSString *name;
@property(nonatomic) NSString *street;
@property(nonatomic) NSString *city;
@property(nonatomic) NSString *state;
@property(nonatomic) NSString *ZIP;

- (NSString *)stringValue;


@end
