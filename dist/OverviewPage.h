//
//  OverviewPage.h
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShippingOption.h"
#import "BSTAddress.h"
#import "PaymentOption.h"

@protocol OverviewPageDelegate <NSObject>

- (void)didClickShippingOptionOnOverviewPage;
- (void)didClickShippingAddressOnOverviewPage;
- (void)didClickPaymentOptionOnOverviewPage;
- (void)overviewPageDidClickDone;
- (void)overviewPageDidClickCancel;

@end

@interface OverviewPage : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) ShippingOption *selectedShippingOption;
@property (nonatomic) BSTAddress *shippingAddress;
@property (nonatomic) PaymentOption *selectedPaymentOption;
@property(nonatomic, weak) id<OverviewPageDelegate> delegate;

- (void)reload;

@end
