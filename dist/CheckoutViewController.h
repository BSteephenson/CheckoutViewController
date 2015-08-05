//
//  CheckoutViewController.h
//  Checkout
//
//  Created by Benjamin Steephenson on 7/24/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AddressEntryView.h"
#import "PaymentOptionsPage.h"
#import "AddPaymentOptionPage.h"
#import "ShippingOption.h"
#import "ShippingOptionsPage.h"
#import "OverviewPage.h"
#import "ShippingAddressPage.h"

@class CheckoutViewController;

@protocol CheckoutViewControllerDelegate <NSObject>

- (void)checkoutDidFinish:(CheckoutViewController *)vc;
- (void)checkoutDidCancel:(CheckoutViewController *)vc;

@end


@interface CheckoutViewController : UIViewController <PaymentOptionPageDelegate, AddPaymentOptionPageDelegate, ShippingOptionsPageDelegate, OverviewPageDelegate, ShippingAddressPageDelegate>

@property(nonatomic, weak)id<CheckoutViewControllerDelegate> delegate;

@property(nonatomic) NSArray *shippingOptions;
@property(nonatomic) ShippingOption *defaultShippingOption;

@property(nonatomic) NSArray *paymentOptions;
@property(nonatomic) PaymentOption *defaultPaymentOption;

@property(nonatomic) BSTAddress *defaultShippingAddress;


- (void)displayWithSender:(UIViewController *)sender;

- (ShippingOption *)selectedShippingOption;
- (PaymentOption *)selectedPaymentOption;
- (BSTAddress *)shippingAddress;



@end

