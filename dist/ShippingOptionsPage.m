//
//  ShippingOptionsPage.m
//  Checkout
//
//  Created by Benjamin Steephenson on 8/6/15.
//  Copyright (c) 2015 Benjamin Steephenson. All rights reserved.
//

#import "ShippingOptionsPage.h"
#import "ShippingOption.h"

@implementation ShippingOptionsPage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.options = [NSArray new];
        self.backgroundColor = [UIColor clearColor];
        
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    ShippingOption *option = self.options[indexPath.section];
    NSString *title =  option.name;
    title = [title stringByAppendingString:@" : "];
    title = [title stringByAppendingString:option.cost];
    cell.textLabel.text = title;
    cell.detailTextLabel.text = option.descriptionText;
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
    [self.shippingOptionsDelegate didSelectShippingOption:self.options[indexPath.section]];
}

@end
