//
//  UITableViewCell+WWSeparate.h
//  UItableViewSeparate
//
//  Created by wangshuaipeng on 16/8/14.
//  Copyright © 2016年 Mac－pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (WWSeparate)

/** 设置最下边的分割线,并指定距离左边的间距(需要先设置tableview分割线为None) */
- (void)ww_setupBottomLineViewWithLeftMargin:(CGFloat)leftMargin;

@end
