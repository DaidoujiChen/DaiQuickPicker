//
//  DaiQuickPicker.m
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiQuickPicker.h"

#import "DQPHandle.h"

@implementation DaiQuickPicker

#pragma mark - class method

+(UIPickerView*) title : (DQPTitle) title
            components : (DQPComponents) components
                  rows : (DQPRows) rows
            onSelected : (DQPOnSelected) onSelected {
    
    return [self title:title components:components rows:rows size:nil onSelected:onSelected];
    
}

+(UIPickerView*) title : (DQPTitle) title
            components : (DQPComponents) components
                  rows : (DQPRows) rows
                  size : (DQPItemSize) size
            onSelected : (DQPOnSelected) onSelected {
    
    UIPickerView *newPicker = [self commonPicker:components rows:rows onSelected:onSelected];
    [newPicker setDqpTitle:title];
    [newPicker setDqpItemSize:size];
    [newPicker setDelegate:(id<UIPickerViewDelegate>)[DQPStringHandle class]];
    [newPicker setDataSource:(id<UIPickerViewDataSource>)[DQPStringHandle class]];
    return newPicker;
    
}

+(UIPickerView*) attributedTitle : (DQPAttributedTitle) attributedTitle
                      components : (DQPComponents) components
                            rows : (DQPRows) rows
                      onSelected : (DQPOnSelected) onSelected {
    
    return [self attributedTitle:attributedTitle components:components rows:rows size:nil onSelected:onSelected];
    
}

+(UIPickerView*) attributedTitle : (DQPAttributedTitle) attributedTitle
                      components : (DQPComponents) components
                            rows : (DQPRows) rows
                            size : (DQPItemSize) size
                      onSelected : (DQPOnSelected) onSelected {
    
    UIPickerView *newPicker = [self commonPicker:components rows:rows onSelected:onSelected];
    [newPicker setDqpAttributedTitle:attributedTitle];
    [newPicker setDqpItemSize:size];
    [newPicker setDelegate:(id<UIPickerViewDelegate>)[DQPAttributedStringHandle class]];
    [newPicker setDataSource:(id<UIPickerViewDataSource>)[DQPAttributedStringHandle class]];
    return newPicker;
    
}

+(UIPickerView*) view : (DQPView) view
           components : (DQPComponents) components
                 rows : (DQPRows) rows
           onSelected : (DQPOnSelected) onSelected {
    
    return [self view:view components:components rows:rows size:nil onSelected:onSelected];
    
}

+(UIPickerView*) view : (DQPView) view
           components : (DQPComponents) components
                 rows : (DQPRows) rows
                 size : (DQPItemSize) size
           onSelected : (DQPOnSelected) onSelected {
    
    UIPickerView *newPicker = [self commonPicker:components rows:rows onSelected:onSelected];
    [newPicker setDqpView:view];
    [newPicker setDqpItemSize:size];
    [newPicker setDelegate:(id<UIPickerViewDelegate>)[DQPViewHandle class]];
    [newPicker setDataSource:(id<UIPickerViewDataSource>)[DQPViewHandle class]];
    return newPicker;
    
}

#pragma mark - private

+(UIPickerView*) commonPicker : (DQPComponents) components rows : (DQPRows) rows onSelected : (DQPOnSelected) onSelected {
    
    UIPickerView *newPicker = [UIPickerView new];
    [newPicker setOnSelected:onSelected];
    [newPicker setDqpComponents:components];
    [newPicker setDqpRows:rows];
    return newPicker;
    
}

@end
