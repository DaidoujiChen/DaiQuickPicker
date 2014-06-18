//
//  DaiQuickPicker.m
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiQuickPicker.h"

@implementation DaiQuickPicker

#pragma mark - UIPickerViewDelegate

+(NSString*) pickerView : (UIPickerView*) pickerView titleForRow : (NSInteger) row forComponent : (NSInteger) component {
    return pickerView.titleCallback(pickerView, row, component);
}

+(void) pickerView : (UIPickerView*) pickerView didSelectRow : (NSInteger) row inComponent : (NSInteger) component {
    pickerView.onSelected(pickerView, row, component);
}

#pragma mark - UIPickerViewDataSource

+(NSInteger) numberOfComponentsInPickerView : (UIPickerView*) pickerView {
    PickerDataSource newDataSource;
    return pickerView.pickerDataSource(newDataSource).components;
}

+(NSInteger) pickerView : (UIPickerView*) pickerView numberOfRowsInComponent : (NSInteger) component {
    PickerDataSource newDataSource;
    return pickerView.pickerDataSource(newDataSource).rows;
}

#pragma mark - class method

+(UIPickerView*) picker : (PickerDataSourceBlock) pickerDataSourceCallback titleCallback : (TitleCallbackBlock) titleCallback onSelected : (OnSelectedBlock) onSelected {
    
    UIPickerView *newPicker = [UIPickerView new];
    [newPicker setTitleCallback:titleCallback];
    [newPicker setOnSelected:onSelected];
    [newPicker setPickerDataSource:pickerDataSourceCallback];
    [newPicker setDelegate:(id<UIPickerViewDelegate>)self];
    [newPicker setDataSource:(id<UIPickerViewDataSource>)self];
    return newPicker;
    
}

@end
