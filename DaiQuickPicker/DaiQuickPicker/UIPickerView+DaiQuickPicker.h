//
//  UIPickerView+DaiQuickPicker.h
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import <UIKit/UIKit.h>

struct PickerItemSize {
	CGFloat width;
	CGFloat height;
};
typedef struct PickerItemSize PickerItemSize;

typedef NSString *(^DQPTitle)(UIPickerView *picker, NSInteger row, NSInteger component);
typedef NSAttributedString *(^DQPAttributedTitle)(UIPickerView *picker, NSInteger row, NSInteger component);
typedef UIView *(^DQPView)(UIPickerView *picker, NSInteger row, NSInteger component, UIView *reusingView);

typedef void (^DQPOnSelected)(UIPickerView *picker, NSInteger row, NSInteger component, id selectedItem);

typedef NSInteger (^DQPComponents)(void);
typedef NSInteger (^DQPRows)(UIPickerView *picker, NSInteger components);
typedef PickerItemSize (^DQPItemSize)(PickerItemSize itemSize);

@interface UIPickerView (DaiQuickPicker)

@property (nonatomic, copy) DQPTitle dqpTitle;
@property (nonatomic, copy) DQPAttributedTitle dqpAttributedTitle;
@property (nonatomic, copy) DQPView dqpView;

@property (nonatomic, copy) DQPOnSelected onSelected;
@property (nonatomic, copy) DQPComponents dqpComponents;
@property (nonatomic, copy) DQPRows dqpRows;
@property (nonatomic, copy) DQPItemSize dqpItemSize;

@end
