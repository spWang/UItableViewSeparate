//
//  ViewController.m
//  UItableViewSeparate
//
//  Created by wangshuaipeng on 16/8/14.
//  Copyright © 2016年 Mac－pro. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+WWSeparate.h"

@interface ViewController ()<UITabBarDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.redView ww_setBottomLineViewWithLeftMargin:0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 设置毛玻璃
//    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
//    self.tableView.separatorEffect = vibrancyEffect;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    //self.tableView.separatorInset = UIEdgeInsetsMake(0, 100, 0, 0);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ViewController"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ViewController"];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd组--%zd行",indexPath.section,indexPath.row];
    //控制不同行的间距
    CGFloat leftMargin = indexPath.row % 2 ? 0 :10;
    [cell ww_setBottomLineViewWithLeftMargin:leftMargin];
    
    return cell;
}


@end
