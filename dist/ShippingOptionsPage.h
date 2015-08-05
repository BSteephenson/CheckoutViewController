//
//  ShippingOptionsPage.h
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShippingOption.h"

@protocol ShippingOptionsPageDelegate <NSObject>

- (void)didSelectShippingOption:(ShippingOption *)shippingOption;

@end

@interface ShippingOptionsPage : UITableView <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic) NSArray *options; // each element must be of type ShippingOption
@property(nonatomic, weak) id<ShippingOptionsPageDelegate> shippingOptionsDelegate;


@end
