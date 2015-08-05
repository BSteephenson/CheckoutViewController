//
//  PaymentOption.h
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSTAddress.h"

@interface PaymentOption : NSObject

@property(nonatomic) NSString *cardNumber;
@property(nonatomic) NSString *cvc;
@property(nonatomic) NSString *expiration;
@property(nonatomic) BSTAddress *billingAddress;


@end
