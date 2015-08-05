//
//  ViewController.h
//  Checkout
//
//  Created by Benjamin Steephenson on 7/24/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckoutViewController.h"

@interface ViewController : UIViewController<CheckoutViewControllerDelegate>

- (IBAction)clickedCheckoutButton:(id)sender;

@end

