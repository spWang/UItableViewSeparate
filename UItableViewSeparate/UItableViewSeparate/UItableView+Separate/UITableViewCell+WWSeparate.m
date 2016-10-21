//
//  UITableViewCell+WWSeparate.m
//  UItableViewSeparate
//
//  Created by wangshuaipeng on 16/8/14.
//  Copyright © 2016年 Mac－pro. All rights reserved.
//

#import "UITableViewCell+WWSeparate.h"
#import <objc/runtime.h>

@interface UIView()
@property (nonatomic, strong) NSLayoutConstraint *constraintLeft;
@end


@implementation UIView (WWSeparate)

- (void)ww_setBottomLineViewWithLeftMargin:(CGFloat)leftMargin {
    UIView *selfView = self;
    if ([self isKindOfClass:[UITableViewCell class]]) {
        UITableViewCell *v = (UITableViewCell *)self;
        selfView = v.contentView;
    }else if ([self isKindOfClass:[UICollectionViewCell class]]) {
        UICollectionViewCell *v = (UICollectionViewCell *)self;
        selfView = v.contentView;
    }
    
    if (![selfView.subviews containsObject:self.ww_lineView]) {
        UIView *lineView = [[UIView alloc]init];
        self.ww_lineView = lineView;
        [selfView addSubview:lineView];
        lineView.backgroundColor = [UIColor darkGrayColor];
        lineView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:selfView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:selfView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.5];
        
        [selfView addConstraint:constraintRight];
        [selfView addConstraint:constraintBottom];
        [selfView addConstraint:constraintHeight];
    }
    
    [selfView removeConstraint:self.constraintLeft];
    self.constraintLeft = [NSLayoutConstraint constraintWithItem:self.ww_lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:selfView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:leftMargin];
    [selfView addConstraint:self.constraintLeft];
}

- (UIView *)ww_lineView {
    return objc_getAssociatedObject(self, @selector(ww_lineView));
}

- (void)setWw_lineView:(UIView *)ww_lineView {
    objc_setAssociatedObject(self, @selector(ww_lineView), ww_lineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)constraintLeft {
    return objc_getAssociatedObject(self, @selector(constraintLeft));
}

- (void)setConstraintLeft:(NSLayoutConstraint *)constraintLeft {
    objc_setAssociatedObject(self, @selector(constraintLeft), constraintLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
