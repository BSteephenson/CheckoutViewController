//
//  ShippingAddressPage.h
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSTAddress.h"

@protocol ShippingAddressPageDelegate <NSObject>

- (void)didCancel;
- (void)didEnterShippingAddress:(BSTAddress *)address;

@end

@interface ShippingAddressPage : UIView

@property(nonatomic, weak) id<ShippingAddressPageDelegate> delegate;

@end
