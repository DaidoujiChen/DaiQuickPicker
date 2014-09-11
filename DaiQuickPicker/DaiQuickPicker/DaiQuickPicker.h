//
//  DaiQuickPicker.h
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UIPickerView+DaiQuickPicker.h"

@interface DaiQuickPicker : NSObject

+ (UIPickerView *)title:(DQPTitle)title components:(DQPComponents)components rows:(DQPRows)rows onSelected:(DQPOnSelected)onSelected;
+ (UIPickerView *)title:(DQPTitle)title components:(DQPComponents)components rows:(DQPRows)rows size:(DQPItemSize)size onSelected:(DQPOnSelected)onSelected;

+ (UIPickerView *)attributedTitle:(DQPAttributedTitle)attributedTitle components:(DQPComponents)components rows:(DQPRows)rows onSelected:(DQPOnSelected)onSelected;
+ (UIPickerView *)attributedTitle:(DQPAttributedTitle)attributedTitle components:(DQPComponents)components rows:(DQPRows)rows size:(DQPItemSize)size onSelected:(DQPOnSelected)onSelected;

+ (UIPickerView *)view:(DQPView)view components:(DQPComponents)components rows:(DQPRows)rows onSelected:(DQPOnSelected)onSelected;
+ (UIPickerView *)view:(DQPView)view components:(DQPComponents)components rows:(DQPRows)rows size:(DQPItemSize)size onSelected:(DQPOnSelected)onSelected;

@end
