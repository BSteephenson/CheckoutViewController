//
//  AddNewPaymentMethodPage.m
//  Checkout
//
//  Created by Benjamin Steephenson on 7/25/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "AddPaymentOptionPage.h"
#import "AddressEntryView.h"

@interface AddPaymentOptionPage()

@property(nonatomic) AddressEntryView *addressEntryView;
@property(nonatomic) UITextField *creditCardNumberField;
@property(nonatomic) UITextField *cvcField;
@property(nonatomic) UITextField *expirationField;
@property(nonatomic) UIImageView *cameraImage;
@property(nonatomic) UILabel *billingAddressTitle;
@property(nonatomic) UIButton *cancelButton;
@property(nonatomic) UIButton *doneButton;


@end

@implementation AddPaymentOptionPage



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.addressEntryView = [[AddressEntryView alloc] init];
        self.creditCardNumberField = [self newTextField];
        self.creditCardNumberField.placeholder = @"Credit card number";
        self.cameraImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_photo_camera"]];
        self.cvcField = [self newTextField];
        self.cvcField.placeholder = @"CVC";
        self.expirationField = [self newTextField];
        self.expirationField.placeholder = @"Expiration";
        
        self.doneButton = [self newButton];
        [self.doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [self.doneButton addTarget:self action:@selector(didSelectDone) forControlEvents:UIControlEventTouchUpInside];

        self.cancelButton = [self newButton];
        [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(didSelectCancel) forControlEvents:UIControlEventTouchUpInside];

        self.billingAddressTitle = [UILabel new];
        self.billingAddressTitle.text = @"Billing Address";
        
        [self addSubview:self.addressEntryView];
        [self addSubview:self.creditCardNumberField];
        [self addSubview:self.cameraImage];
        [self addSubview:self.cvcField];
        [self addSubview:self.expirationField];
        [self addSubview:self.doneButton];
        [self addSubview:self.cancelButton];
        [self addSubview:self.billingAddressTitle];

    }
    return self;
}

- (void)layoutSubviews
{
    
    CGFloat padding = 5;
    int rows = 7;
    
    [self.creditCardNumberField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self).dividedBy(rows).offset(-2*padding);
        make.width.equalTo(self).multipliedBy(3./4).offset(-2*padding);
        make.left.top.equalTo(self).offset(padding);
    }];
    
    [self.cameraImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).dividedBy(4).offset(-2*padding);
        make.height.equalTo(self.creditCardNumberField);
        make.top.equalTo(self.creditCardNumberField);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [self.cvcField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.equalTo(self.creditCardNumberField);
        make.width.equalTo(self).dividedBy(2).offset(-2*padding);
        make.top.equalTo(self.cameraImage.mas_bottom).offset(2*padding);
    }];

    [self.expirationField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.top.equalTo(self.cvcField);
        make.width.equalTo(self).dividedBy(2).offset(-2*padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [self.billingAddressTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.left.equalTo(self.creditCardNumberField);
        make.top.equalTo(self.expirationField.mas_bottom).offset(2*padding);
    }];
    
    [self.addressEntryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self).multipliedBy(3./rows);
        make.top.equalTo(self.billingAddressTitle.mas_bottom).offset(padding);
        make.left.width.equalTo(self);
    }];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.equalTo(self.creditCardNumberField);
        make.width.equalTo(self).dividedBy(2).offset(-2*padding);
        make.top.equalTo(self.addressEntryView.mas_bottom).offset(padding);
    }];
    
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.top.width.equalTo(self.cancelButton);
        make.right.equalTo(self).offset(-padding);
    }];
    
}

- (UITextField *)newTextField
{
    UITextField *field = [UITextField new];
    field.textColor = [UIColor blackColor];
    field.backgroundColor = [UIColor clearColor];
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.userInteractionEnabled = YES;
    field.keyboardType = UIKeyboardTypeAlphabet;
    field.enabled = YES;
    return field;
}

- (UIButton *)newButton
{
    UIButton *button = [UIButton new];
    return button;
}

- (void)didSelectCancel
{
    [self.delegate didCancel];
}
- (void)didSelectDone
{
    PaymentOption *payment = [PaymentOption new];
    payment.cardNumber = self.creditCardNumberField.text;
    payment.cvc = self.cvcField.text;
    payment.expiration = self.expirationField.text;
    payment.billingAddress = self.addressEntryView.address;
    [self.delegate didEnterPaymentOption:payment];
}

@end
