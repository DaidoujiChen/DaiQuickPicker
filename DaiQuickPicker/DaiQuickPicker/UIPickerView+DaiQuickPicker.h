//
//  UIPickerView+DaiQuickPicker.h
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import <UIKit/UIKit.h>

struct PickerDataSource {
    NSInteger rows;
    NSInteger components;
};
typedef struct PickerDataSource PickerDataSource;

typedef NSString*(^TitleCallbackBlock)(UIPickerView* picker, NSInteger row, NSInteger component);
typedef void(^OnSelectedBlock)(UIPickerView* picker, NSInteger row, NSInteger component);
typedef PickerDataSource(^PickerDataSourceBlock)(PickerDataSource dataSource);

@interface UIPickerView (DaiQuickPicker)

@property (nonatomic, copy) TitleCallbackBlock titleCallback;
@property (nonatomic, copy) OnSelectedBlock onSelected;
@property (nonatomic, copy) PickerDataSourceBlock pickerDataSource;

@end
