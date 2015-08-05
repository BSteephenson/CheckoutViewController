//
//  CheckoutViewController.m
//  Checkout
//
//  Created by Benjamin Steephenson on 7/24/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "CheckoutViewController.h"

@interface CheckoutViewController()

@property (nonatomic) UIView *backgroundView;
@property (nonatomic) ShippingAddressPage *shippingAddressPage;
@property (nonatomic) PaymentOptionsPage *paymentOptionsPage;
@property (nonatomic) AddPaymentOptionPage *addNewPaymentMethodPage;
@property (nonatomic) ShippingOptionsPage *shippingOptionsPage;
@property (nonatomic) OverviewPage *overviewPage;

@end

@implementation CheckoutViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, self.fullHeight, self.fullWidth, 0)];
    [self.view.layer setMasksToBounds:YES];
    [self.view addSubview:self.backgroundView];
    self.view.userInteractionEnabled = YES;
    [self setupSubviews];
}

- (void)setupSubviews
{
    self.shippingAddressPage = [[ShippingAddressPage alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    self.shippingAddressPage.delegate = self;
    self.paymentOptionsPage = [[PaymentOptionsPage alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    self.paymentOptionsPage.delegate = self;

    self.addNewPaymentMethodPage = [[AddPaymentOptionPage alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.addNewPaymentMethodPage.delegate = self;

    self.shippingOptionsPage = [[ShippingOptionsPage alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.shippingOptionsPage.shippingOptionsDelegate = self;
    

    
    self.overviewPage = [[OverviewPage alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.overviewPage.delegate = self;

    
    self.paymentOptionsPage.options = self.paymentOptions;
    self.shippingOptionsPage.options = self.shippingOptions;
    
    self.overviewPage.selectedShippingOption = self.defaultShippingOption;
    self.overviewPage.selectedPaymentOption = self.defaultPaymentOption;
    self.overviewPage.shippingAddress = self.defaultShippingAddress;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setSubview:self.overviewPage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayWithSender:(UIViewController *)sender
{
    [sender.view addSubview:self.view];
    [sender.view bringSubviewToFront:self.view];
    [sender addChildViewController:self];
//    [self didMoveToParentViewController:sender];
}

#pragma mark Setters / Getters

- (UIView *)backgroundView
{
    if (!_backgroundView) {
//        _backgroundView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:1 alpha:.75];
        _backgroundView.frame = self.view.bounds;
        
    }
    return _backgroundView;
}


#pragma mark Helpers..

- (CGFloat)fullWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}
- (CGFloat)fullHeight
{
    return [[UIScreen mainScreen] bounds].size.height;
}

- (void)setSubview:(UIView *)subview
{
    UIView *currentSubview;
    if (self.view.subviews.count > 1) {
        currentSubview = self.view.subviews.lastObject;
    }
    [self.view addSubview:subview];
    subview.alpha = 0;
    [UIView animateWithDuration:.5 animations:^{
        subview.alpha = 1;
        currentSubview.alpha = 0;
        [self setHeight:subview.frame.size.height];
    } completion:^(BOOL finished) {
        [currentSubview removeFromSuperview];
    }];
    
}

- (void)setHeight:(CGFloat)height
{
    self.view.frame = CGRectMake(0, self.fullHeight - height, self.fullWidth, height);
    self.backgroundView.frame = self.view.bounds;
}


- (ShippingOption *)selectedShippingOption
{
    return self.overviewPage.selectedShippingOption;
}
- (PaymentOption *)selectedPaymentOption
{
    return self.overviewPage.selectedPaymentOption;
}
- (BSTAddress *)shippingAddress
{
    return self.overviewPage.shippingAddress;
}



#pragma mark Delegate methods

- (void)didCancel
{
    [self setSubview:self.overviewPage];
}

- (void)didSelectPaymentOption:(PaymentOption *)paymentOption
{
    self.overviewPage.selectedPaymentOption = paymentOption;
    [self.overviewPage reload];
    [self setSubview:self.overviewPage];
}
- (void)didSelectShippingOption:(ShippingOption *)shippingOption
{
    // TODO tell the delegate
    self.overviewPage.selectedShippingOption = shippingOption;
    [self.overviewPage reload];
    [self setSubview:self.overviewPage];
    
}
- (void)didEnterPaymentOption:(PaymentOption *)paymentOption
{
    // TODO tell the delegate
    self.overviewPage.selectedPaymentOption = paymentOption;
    [self.overviewPage reload];
    [self setSubview:self.overviewPage];
    
}
- (void)didEnterShippingAddress:(BSTAddress *)address
{
    // TODO tell the delegate
    self.overviewPage.shippingAddress = address;
    [self.overviewPage reload];
    [self setSubview:self.overviewPage];
}

- (void)didClickPaymentOptionOnOverviewPage
{
    [self setSubview:self.paymentOptionsPage];
    
}
- (void)didClickShippingAddressOnOverviewPage
{
    [self.shippingOptionsPage reloadInputViews];
    [self setSubview:self.shippingAddressPage];
    
}
- (void)didClickShippingOptionOnOverviewPage
{
    [self setSubview:self.shippingOptionsPage];
}
- (void)didClickAddPaymentOptionButton
{
    [self setSubview:self.addNewPaymentMethodPage];
}

- (void)overviewPageDidClickCancel
{
    [self.delegate checkoutDidCancel:self];
}
- (void)overviewPageDidClickDone
{
    [self.delegate checkoutDidFinish:self];
}

@end

