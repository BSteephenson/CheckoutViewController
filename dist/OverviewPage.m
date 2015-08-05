//
//  OverviewPage.m
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "OverviewPage.h"

@interface OverviewPage()

@property(nonatomic) UITableView *tableView;
@property(nonatomic) UIButton *cancelButton;
@property(nonatomic) UIButton *doneButton;

@end

@implementation OverviewPage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [UITableView new];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        
        self.cancelButton = [UIButton new];
        [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(didSelectCancel) forControlEvents:UIControlEventTouchUpInside];
        self.doneButton = [UIButton new];
        [self.doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [self.doneButton addTarget:self action:@selector(didSelectDone) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.tableView];
        [self addSubview:self.cancelButton];
        [self addSubview:self.doneButton];
        
    }
    return self;
}

- (void)reload
{
    [self.tableView reloadData];
}


- (void)layoutSubviews
{
    
    CGFloat padding = 5;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
        make.height.equalTo(self).multipliedBy(3./4).offset(-2*padding);
    }];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).offset(2*padding);
        make.left.equalTo(self.tableView);
        make.bottom.equalTo(self).offset(-padding);
        make.right.equalTo(self).dividedBy(2).offset(-padding);
    }];
    
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.cancelButton);
        make.right.equalTo(self).offset(-padding);
        make.width.equalTo(self.cancelButton);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSString *title;
    NSString *subtitle;
    
    switch (indexPath.section) {
        case 0: // Payment option
            title = @"Payment Option";
            subtitle = self.selectedPaymentOption.cardNumber;
            break;
        case 1: // Shipping option
            title = @"Shipping Option";
            subtitle = self.selectedShippingOption.name;
            break;
        case 2: // Shipping address
            title = @"Shipping Address";
            subtitle = self.shippingAddress.stringValue;
            break;
            
        default:
            break;
    }
    
    cell.textLabel.text = title;
    cell.detailTextLabel.text = subtitle;
    cell.frame = CGRectInset(cell.frame, 5, 5);
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            [self.delegate didClickPaymentOptionOnOverviewPage];
            break;
        case 1:
            [self.delegate didClickShippingOptionOnOverviewPage];
            break;
        case 2:
            [self.delegate didClickShippingAddressOnOverviewPage];
            break;
        default:
            break;
    }
}

- (void)didSelectDone
{
    [self.delegate overviewPageDidClickDone];
}
- (void)didSelectCancel
{
    [self.delegate overviewPageDidClickCancel];
}
@end
