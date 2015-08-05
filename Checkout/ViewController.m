//
//  ViewController.m
//  Checkout
//
//  Created by Benjamin Steephenson on 7/24/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "ViewController.h"
#import "CheckoutViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CheckoutViewController *vc = [[CheckoutViewController alloc] init];
    
    ShippingOption *option1 = [ShippingOption new];
    option1.name = @"NAme";
    option1.descriptionText = @"Descripti";
    option1.cost = @"$12";
    
    PaymentOption *payment = [PaymentOption new];
    payment.cardNumber = @"CARd number";
    
    BSTAddress *address = [BSTAddress new];
    address.name = @"Bob Smith";
    address.street = @"16 coyne";
    address.city = @"Burgerfield";
    address.state = @"NJ";
    address.ZIP = @"07621";
    
    vc.shippingOptions = @[option1];
    vc.defaultShippingOption = option1;
    vc.paymentOptions = @[payment];
    vc.defaultPaymentOption = payment;
    vc.defaultShippingAddress = address;
    
    vc.delegate = self;
    
    [vc displayWithSender:self];

}

- (IBAction)clickedCheckoutButton:(id)sender
{
    
}

- (void)checkoutDidFinish:(CheckoutViewController *)vc
{
    
}
- (void)checkoutDidCancel:(CheckoutViewController *)vc
{
    
}

@end
