//
//  AddNewPaymentMethodPage.h
//  Checkout
//
//  Created by Benjamin Steephenson on 7/25/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentOption.h"

@protocol AddPaymentOptionPageDelegate <NSObject>

- (void)didCancel;
- (void)didEnterPaymentOption:(PaymentOption *)paymentOption;

@end

@interface AddPaymentOptionPage : UIView

@property(nonatomic, weak) id<AddPaymentOptionPageDelegate> delegate;


@end
