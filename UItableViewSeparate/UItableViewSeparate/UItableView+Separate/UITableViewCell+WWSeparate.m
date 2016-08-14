//
//  UITableViewCell+WWSeparate.m
//  UItableViewSeparate
//
//  Created by wangshuaipeng on 16/8/14.
//  Copyright © 2016年 Mac－pro. All rights reserved.
//

#import "UITableViewCell+WWSeparate.h"
#import <objc/runtime.h>

@interface UITableViewCell()
@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, strong) NSLayoutConstraint *constraintLeft;
@end


@implementation UITableViewCell (WWSeparate)
static char HCBlineView;
static char HCBconstraintLeft;

- (void)ww_setupBottomLineViewWithLeftMargin:(CGFloat)leftMargin {
    
    if (![self.contentView.subviews containsObject:self.lineView]) {
        UIView *lineView = [[UIView alloc]init];
        self.lineView = lineView;
        [self.contentView addSubview:lineView];
        lineView.backgroundColor = [UIColor darkGrayColor];
        lineView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.5];
        
        [self.contentView addConstraint:constraintRight];
        [self.contentView addConstraint:constraintBottom];
        [self.contentView addConstraint:constraintHeight];
    }
    
    [self.contentView removeConstraint:self.constraintLeft];
    self.constraintLeft = [NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:leftMargin];
    [self.contentView addConstraint:self.constraintLeft];
}

- (UIView *)lineView {
    return objc_getAssociatedObject(self, &HCBlineView);
}

- (void)setLineView:(UIView *)lineView {
    objc_setAssociatedObject(self, &HCBlineView, lineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)constraintLeft {
    return objc_getAssociatedObject(self, &HCBconstraintLeft);
}

- (void)setConstraintLeft:(NSLayoutConstraint *)constraintLeft {
    objc_setAssociatedObject(self, &HCBconstraintLeft, constraintLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
