//
//  AddressEntryPage.h
//  Checkout
//
//  Created by Benjamin Steephenson on 7/25/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSTAddress.h"

@interface AddressEntryView : UIView <UITextFieldDelegate>

@property (nonatomic) UITextField *nameField;
@property (nonatomic) UITextField *streetField;
@property (nonatomic) UITextField *cityField;
@property (nonatomic) UITextField *stateField;
@property (nonatomic) UITextField *zipcodeField;

- (BSTAddress *)address;

@end
