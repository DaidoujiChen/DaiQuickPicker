//
//  DaiQuickPicker.h
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *(^QuickTitle)(UIPickerView *picker, NSInteger row, NSInteger component);
typedef NSAttributedString *(^QuickAttributedTitle)(UIPickerView *picker, NSInteger row, NSInteger component);
typedef UIView *(^QuickView)(UIPickerView *picker, NSInteger row, NSInteger component, UIView *reusingView);
typedef void (^QuickOnSelected)(UIPickerView *picker, NSInteger row, NSInteger component, id selectedItem);
typedef NSInteger (^QuickComponents)(void);
typedef NSInteger (^QuickRows)(UIPickerView *picker, NSInteger components);
typedef CGSize (^QuickItemSize)(void);

@interface DaiQuickPicker : NSObject

+ (UIPickerView *)title:(QuickTitle)title components:(QuickComponents)components rows:(QuickRows)rows onSelected:(QuickOnSelected)onSelected;
+ (UIPickerView *)title:(QuickTitle)title components:(QuickComponents)components rows:(QuickRows)rows size:(QuickItemSize)size onSelected:(QuickOnSelected)onSelected;

+ (UIPickerView *)attributedTitle:(QuickAttributedTitle)attributedTitle components:(QuickComponents)components rows:(QuickRows)rows onSelected:(QuickOnSelected)onSelected;
+ (UIPickerView *)attributedTitle:(QuickAttributedTitle)attributedTitle components:(QuickComponents)components rows:(QuickRows)rows size:(QuickItemSize)size onSelected:(QuickOnSelected)onSelected;

+ (UIPickerView *)view:(QuickView)view components:(QuickComponents)components rows:(QuickRows)rows onSelected:(QuickOnSelected)onSelected;
+ (UIPickerView *)view:(QuickView)view components:(QuickComponents)components rows:(QuickRows)rows size:(QuickItemSize)size onSelected:(QuickOnSelected)onSelected;

@end
