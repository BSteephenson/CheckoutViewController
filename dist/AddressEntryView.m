//
//  AddressEntryPage.m
//  Checkout
//
//  Created by Benjamin Steephenson on 7/25/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "AddressEntryView.h"


@implementation AddressEntryView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.nameField = [self newTextField];
        self.streetField = [self newTextField];
        self.cityField = [self newTextField];
        self.stateField = [self newTextField];
        self.zipcodeField = [self newTextField];
        
        
        [self addSubview:self.nameField];
        [self addSubview:self.streetField];
        [self addSubview:self.cityField];
        [self addSubview:self.stateField];
        [self addSubview:self.zipcodeField];
    }
    return self;
}


- (void)layoutSubviews
{
    CGFloat padding = 5;
    
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.equalTo(self).offset(-2*padding);
        make.height.equalTo(self).dividedBy(3).offset(-2*padding);
        make.topMargin.equalTo(@5);
    }];
    
    [self.streetField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.height.width.equalTo(self.nameField);
        make.top.equalTo(self.nameField.mas_bottom).offset(2*padding);
    }];

    [self.cityField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.nameField);
        make.top.equalTo(self.streetField.mas_bottom).offset(2*padding);
        make.left.equalTo(self.nameField);
        make.width.equalTo(self).dividedBy(2).offset(-padding);
    }];
    
    [self.stateField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.nameField);
        make.width.equalTo(self.nameField).dividedBy(4).offset(padding);
        make.top.equalTo(self.cityField);
        make.left.equalTo(self.cityField.mas_right).offset(2*padding);
    }];
    
    [self.zipcodeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.nameField);
        make.width.lessThanOrEqualTo(self).dividedBy(4);
        make.top.equalTo(self.cityField);
        make.left.equalTo(self.stateField.mas_right).offset(2*padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    self.nameField.placeholder = @"Name";
    self.streetField.placeholder = @"Street";
    self.cityField.placeholder = @"City";
    self.stateField.placeholder = @"State";
    self.zipcodeField.placeholder = @"ZIP";
    
    self.nameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    self.streetField.delegate = self;

    
    self.userInteractionEnabled = YES;

    
}

- (CGRect)frameForRow:(int)row ofRows:(int)rows forCol:(int)col ofCols:(int)cols
{
    CGRect frame;
    frame.size.width = self.frame.size.width / cols;
    frame.size.height = self.frame.size.height / rows;
    frame.origin.x = frame.size.width * (col - 1);
    frame.origin.y = frame.size.height * (row - 1);
    frame = CGRectInset(frame, 5, 5);
    return frame;
}

- (UITextField *)newTextField
{
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    field.textColor = [UIColor blackColor];
    field.backgroundColor = [UIColor clearColor];
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.userInteractionEnabled = YES;
    field.delegate = self;
    field.keyboardType = UIKeyboardTypeAlphabet;
    field.enabled = YES;
//    [field addTarget:self action:@selector(onTextFieldTouch:) forControlEvents:UIControlEventTouchDown];
    return field;
}

- (UIButton *)newButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    return button;
}

- (void)onTextFieldTouch:(UITextField *)sender
{
//    [sender becomeFirstResponder];
}

- (BSTAddress *)address
{
    BSTAddress *address = [BSTAddress new];
    address.name = self.nameField.text;
    address.street = self.streetField.text;
    address.city = self.cityField.text;
    address.state = self.stateField.text;
    address.ZIP = self.zipcodeField.text;
    return address;
}

@end
