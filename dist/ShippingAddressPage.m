//
//  ShippingAddressPage.m
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "ShippingAddressPage.h"
#import "AddressEntryView.h"

@interface ShippingAddressPage()

@property(nonatomic) AddressEntryView *addressEntryView;
@property(nonatomic) UILabel *title;
@property(nonatomic) UIButton *cancelButton;
@property(nonatomic) UIButton *doneButton;

@end

@implementation ShippingAddressPage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.addressEntryView = [AddressEntryView new];
        self.title = [UILabel new];
        self.title.text = @"Shipping Address";
        self.cancelButton = [UIButton new];
        [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(didSelectCancel) forControlEvents:UIControlEventTouchUpInside];
        self.doneButton = [UIButton new];
        [self.doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [self.doneButton addTarget:self action:@selector(didSelectDone) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.addressEntryView];
        [self addSubview:self.title];
        [self addSubview:self.cancelButton];
        [self addSubview:self.doneButton];
    }
    return self;
}

- (void)layoutSubviews
{
    int rows = 5;
    CGFloat padding = 5;
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self).dividedBy(rows).offset(-2*padding);
        make.left.right.top.equalTo(@(padding));
    }];
    
    [self.addressEntryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self).multipliedBy(3./rows);
        make.top.equalTo(self.title.mas_bottom).offset(2*padding);
        make.left.right.equalTo(self);
    }];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(self.title);
        make.right.equalTo(self).dividedBy(2).offset(-padding);
        make.bottom.equalTo(self).offset(-padding);
    }];
    
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.top.equalTo(self.cancelButton);
        make.right.equalTo(self).offset(-padding);
    }];
}

- (void)didSelectCancel
{
    [self.delegate didCancel];
}
- (void)didSelectDone
{
    BSTAddress *address = [BSTAddress new];
    address.name = self.addressEntryView.nameField.text;
    address.street = self.addressEntryView.streetField.text;
    address.city = self.addressEntryView.cityField.text;
    address.state = self.addressEntryView.stateField.text;
    address.ZIP = self.addressEntryView.zipcodeField.text;
    [self.delegate didEnterShippingAddress:address];
}

@end
