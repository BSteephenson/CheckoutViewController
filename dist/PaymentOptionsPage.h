//
//  PaymentOptionsPage.h
//  Checkout
//
//  Created by Benjamin Steephenson on 7/25/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentOption.h"

@protocol PaymentOptionPageDelegate <NSObject>

- (void)didSelectPaymentOption:(PaymentOption *)paymentOption;
- (void)didClickAddPaymentOptionButton;

@end

@interface PaymentOptionsPage : UIView <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic) NSArray *options; // Each element must be of type PaymentOption
@property(nonatomic, weak) id<PaymentOptionPageDelegate> delegate;


@end
