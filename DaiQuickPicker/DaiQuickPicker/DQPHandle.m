//
//  DQPHandle.m
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DQPHandle.h"

@implementation DQPHandle

#pragma mark - UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	if (pickerView.dqpItemSize) {
		PickerItemSize newItemSize = {
			.width = [pickerView rowSizeForComponent:component].width,
			.height = [pickerView rowSizeForComponent:component].height
		};
		return pickerView.dqpItemSize(newItemSize).width;
	} else {
		return [pickerView rowSizeForComponent:component].width;
	}
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	if (pickerView.dqpItemSize) {
		PickerItemSize newItemSize = {
			.width = [pickerView rowSizeForComponent:component].width,
			.height = [pickerView rowSizeForComponent:component].height
		};
		return pickerView.dqpItemSize(newItemSize).height;
	} else {
		return [pickerView rowSizeForComponent:component].height;
	}
}

+ (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	pickerView.onSelected(pickerView, row, component, [pickerView.delegate pickerView:pickerView titleForRow:row forComponent:component]);
}

#pragma mark - UIPickerViewDataSource

+ (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return pickerView.dqpComponents();
}

+ (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return pickerView.dqpRows(pickerView, component);
}

@end

@implementation DQPStringHandle

#pragma mark - UIPickerViewDelegate

+ (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return pickerView.dqpTitle(pickerView, row, component);
}

@end

@implementation DQPAttributedStringHandle

+ (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return pickerView.dqpAttributedTitle(pickerView, row, component);
}

@end

@implementation DQPViewHandle

+ (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
	return pickerView.dqpView(pickerView, row, component, view);
}

@end
