//
//  UIPickerView+DaiQuickPicker.m
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "UIPickerView+DaiQuickPicker.h"

#import <objc/runtime.h>

@implementation UIPickerView (DaiQuickPicker)

@dynamic dqpTitle, dqpAttributedTitle, dqpView, onSelected, dqpComponents, dqpRows, dqpItemSize;

- (void)setDqpTitle:(DQPTitle)dqpTitle
{
	objc_setAssociatedObject(self, @selector(dqpTitle), dqpTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DQPTitle)dqpTitle
{
	return objc_getAssociatedObject(self, @selector(dqpTitle));
}

- (void)setDqpAttributedTitle:(DQPAttributedTitle)dqpAttributedTitle
{
	objc_setAssociatedObject(self, @selector(dqpAttributedTitle), dqpAttributedTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DQPAttributedTitle)dqpAttributedTitle
{
	return objc_getAssociatedObject(self, @selector(dqpAttributedTitle));
}

- (void)setDqpView:(DQPView)dqpView
{
	objc_setAssociatedObject(self, @selector(dqpView), dqpView, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DQPView)dqpView
{
	return objc_getAssociatedObject(self, @selector(dqpView));
}

- (void)setOnSelected:(DQPOnSelected)onSelected
{
	objc_setAssociatedObject(self, @selector(onSelected), onSelected, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DQPOnSelected)onSelected
{
	return objc_getAssociatedObject(self, @selector(onSelected));
}

- (void)setDqpComponents:(DQPComponents)dqpComponents
{
	objc_setAssociatedObject(self, @selector(dqpComponents), dqpComponents, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DQPComponents)dqpComponents
{
	return objc_getAssociatedObject(self, @selector(dqpComponents));
}

- (void)setDqpRows:(DQPRows)dqpRows
{
	objc_setAssociatedObject(self, @selector(dqpRows), dqpRows, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DQPRows)dqpRows
{
	return objc_getAssociatedObject(self, @selector(dqpRows));
}

- (void)setDqpItemSize:(DQPItemSize)dqpItemSize
{
	objc_setAssociatedObject(self, @selector(dqpItemSize), dqpItemSize, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DQPItemSize)dqpItemSize
{
	return objc_getAssociatedObject(self, @selector(dqpItemSize));
}

@end
