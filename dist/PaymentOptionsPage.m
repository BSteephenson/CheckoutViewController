//
//  PaymentOptionsPage.m
//  Checkout
//
//  Created by Benjamin Steephenson on 7/25/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "PaymentOptionsPage.h"

@interface PaymentOptionsPage()

@property(nonatomic) UILabel *titleLabel;
@property(nonatomic) UITableView *tableView;
@property(nonatomic) UIButton *addNewButton;


@end

@implementation PaymentOptionsPage

- (void)setupSubviews
{
    self.titleLabel = [[UILabel alloc] init];
    self.tableView = [[UITableView alloc] init];
    self.addNewButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.titleLabel.frame = [self FrameWithTop:0 bottom:4./5 left:0 right:1./3];
    self.tableView.frame = [self FrameWithTop:1./5 bottom:0 left:0 right:0];
    self.addNewButton.frame = [self FrameWithTop:0 bottom:4./5 left:2./3 right:0];
    
    self.titleLabel.text = @"Select a payment method";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.addNewButton setTitle:@"New" forState:UIControlStateNormal];
    [self.addNewButton addTarget:self action:@selector(clickedNew) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.tableView];
    [self addSubview:self.addNewButton];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.options.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    PaymentOption *payment = self.options[indexPath.section];
    cell.textLabel.text = payment.cardNumber;
    cell.frame = CGRectInset(cell.frame, 5, 5);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (CGRect)FrameWithTop:(float)top bottom:(float)bottom left:(float)left right:(float)right
{
    CGRect frame = self.bounds;
    
    frame.origin.x += left * frame.size.width;
    frame.origin.y += top * frame.size.height;
    frame.size.width *= 1 - left - right;
    frame.size.height *= 1 - top - bottom;

    return CGRectInset(frame, 5, 5);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate didSelectPaymentOption:self.options[indexPath.section]];
}

- (void)clickedNew
{
    [self.delegate didClickAddPaymentOptionButton];
}

@end
