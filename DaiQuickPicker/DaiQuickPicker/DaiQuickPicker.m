//
//  DaiQuickPicker.m
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiQuickPicker.h"
#import <objc/runtime.h>

#pragma mark - DaiQuickPickerType enumerate

typedef enum {
    DaiQuickPickerTypeTitle,
    DaiQuickPickerTypeAttributedTitle,
    DaiQuickPickerTypeView
} DaiQuickPickerType;

#pragma mark - QuickPickerItems

@interface QuickPickerItems : NSObject

@property (nonatomic, copy) QuickTitle title;
@property (nonatomic, copy) QuickAttributedTitle attributedTitle;
@property (nonatomic, copy) QuickView view;
@property (nonatomic, copy) QuickOnSelected onSelected;
@property (nonatomic, copy) QuickComponents components;
@property (nonatomic, copy) QuickRows rows;
@property (nonatomic, copy) QuickItemSize size;

@end

@implementation QuickPickerItems

@end

#pragma mark - UIPickerView+QuickPicker

@interface UIPickerView (QuickPicker)

@property (nonatomic, strong) QuickPickerItems *quickPickerItems;

@end

@implementation UIPickerView (QuickPicker)

@dynamic quickPickerItems;

- (QuickPickerItems *)quickPickerItems {
    if (!objc_getAssociatedObject(self, _cmd)) {
        objc_setAssociatedObject(self, _cmd, [QuickPickerItems new], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, _cmd);
}

@end

#pragma mark - QuickPickerHandler

@interface QuickPickerHandler : NSObject

+ (Class)classWithType:(DaiQuickPickerType)type isSizeExist:(BOOL)isSizeExist;

@end

@implementation QuickPickerHandler

+ (Class)classWithType:(DaiQuickPickerType)type isSizeExist:(BOOL)isSizeExist {
    NSMutableString *className = [NSMutableString string];
    [className appendString:@"DaiQuickPicker"];
    switch (type) {
        case DaiQuickPickerTypeTitle:
            [className appendString:@"Title"];
            break;
            
        case DaiQuickPickerTypeAttributedTitle:
            [className appendString:@"AttributedTitle"];
            break;
            
        case DaiQuickPickerTypeView:
            [className appendString:@"View"];
            break;
    }
    
    if (isSizeExist) {
        [className appendString:@"Size"];
    }
    [className appendString:@"Handler"];
    
    Class newClass = objc_allocateClassPair([NSObject class], className.UTF8String, 0);
    if (newClass) {
        objc_registerClassPair(newClass);
        Class metaClass = objc_getMetaClass(className.UTF8String);
        class_addMethod(metaClass, @selector(pickerView:didSelectRow:inComponent:), (IMP)pickerView_didSelectRow_inComponentIMP, "v@:@ll");
        class_addMethod(metaClass, @selector(numberOfComponentsInPickerView:), (IMP)numberOfComponentsInPickerViewIMP, "l@:@");
        class_addMethod(metaClass, @selector(pickerView:numberOfRowsInComponent:), (IMP)pickerView_numberOfRowsInComponentIMP, "l@:@l");
        
        switch (type) {
            case DaiQuickPickerTypeTitle:
                class_addMethod(metaClass, @selector(pickerView:titleForRow:forComponent:), (IMP)pickerView_titleForRow_forComponentIMP, "@@:@ll");
                break;
                
            case DaiQuickPickerTypeAttributedTitle:
                class_addMethod(metaClass, @selector(pickerView:attributedTitleForRow:forComponent:), (IMP)pickerView_attributedTitleForRow_forComponentIMP, "@@:@ll");
                break;
                
            case DaiQuickPickerTypeView:
                class_addMethod(metaClass, @selector(pickerView:viewForRow:forComponent:reusingView:), (IMP)pickerView_viewForRow_forComponent_reusingViewIMP, "@@:@ll@");
                break;
        }
        
        if (isSizeExist) {
            class_addMethod(metaClass, @selector(pickerView:widthForComponent:), (IMP)pickerView_widthForComponentIMP, "f@:@l");
            class_addMethod(metaClass, @selector(pickerView:rowHeightForComponent:), (IMP)pickerView_rowHeightForComponent, "f@:@l");
        }
    }
    
    return NSClassFromString(className);
}

#pragma mark * UIPickerViewDelegate

CGFloat pickerView_rowHeightForComponent(id self, SEL _cmd, UIPickerView *pickerView, NSInteger component) {
    return pickerView.quickPickerItems.size().height;
}

CGFloat pickerView_widthForComponentIMP(id self, SEL _cmd, UIPickerView *pickerView, NSInteger component) {
    return pickerView.quickPickerItems.size().width;
}

NSString *pickerView_titleForRow_forComponentIMP(id self, SEL _cmd, UIPickerView *pickerView, NSInteger row, NSInteger component) {
    return pickerView.quickPickerItems.title(pickerView, row, component);
}

NSAttributedString *pickerView_attributedTitleForRow_forComponentIMP(id self, SEL _cmd, UIPickerView *pickerView, NSInteger row, NSInteger component) {
    return pickerView.quickPickerItems.attributedTitle(pickerView, row, component);
}

UIView *pickerView_viewForRow_forComponent_reusingViewIMP(id self, SEL _cmd, UIPickerView *pickerView, NSInteger row, NSInteger component, UIView *view) {
    return pickerView.quickPickerItems.view(pickerView, row, component, view);
}

void pickerView_didSelectRow_inComponentIMP(id self, SEL _cmd, UIPickerView *pickerView, NSInteger row, NSInteger component) {
    if (pickerView.quickPickerItems.title) {
        pickerView.quickPickerItems.onSelected(pickerView, row, component, [pickerView.delegate pickerView:pickerView titleForRow:row forComponent:component]);
    }
    else if (pickerView.quickPickerItems.attributedTitle) {
        pickerView.quickPickerItems.onSelected(pickerView, row, component, [pickerView.delegate pickerView:pickerView attributedTitleForRow:row forComponent:component]);
    }
    else if (pickerView.quickPickerItems.view) {
        pickerView.quickPickerItems.onSelected(pickerView, row, component, [pickerView.delegate pickerView:pickerView viewForRow:row forComponent:component reusingView:nil]);
    }
}

#pragma mark * UIPickerViewDataSource

NSInteger numberOfComponentsInPickerViewIMP(id self, SEL _cmd, UIPickerView *pickerView) {
    return pickerView.quickPickerItems.components();
}

NSInteger pickerView_numberOfRowsInComponentIMP(id self, SEL _cmd, UIPickerView *pickerView, NSInteger component) {
    return pickerView.quickPickerItems.rows(pickerView, component);
}

@end

#pragma mark - DaiQuickPicker

@implementation DaiQuickPicker

#pragma mark * private class method

+ (UIPickerView *)commonPicker:(QuickComponents)components rows:(QuickRows)rows onSelected:(QuickOnSelected)onSelected {
    UIPickerView *newPicker = [UIPickerView new];
    newPicker.quickPickerItems.onSelected = onSelected;
    newPicker.quickPickerItems.components = components;
    newPicker.quickPickerItems.rows = rows;
    return newPicker;
}

#pragma mark * class method

+ (UIPickerView *)title:(QuickTitle)title components:(QuickComponents)components rows:(QuickRows)rows onSelected:(QuickOnSelected)onSelected {
    return [self title:title components:components rows:rows size:nil onSelected:onSelected];
}

+ (UIPickerView *)title:(QuickTitle)title components:(QuickComponents)components rows:(QuickRows)rows size:(QuickItemSize)size onSelected:(QuickOnSelected)onSelected {
    UIPickerView *newPicker = [self commonPicker:components rows:rows onSelected:onSelected];
    newPicker.quickPickerItems.title = title;
    newPicker.quickPickerItems.size = size;
    newPicker.delegate = (id <UIPickerViewDelegate>)[QuickPickerHandler classWithType:DaiQuickPickerTypeTitle isSizeExist:(size ? YES : NO)];
    newPicker.dataSource = (id <UIPickerViewDataSource>)[QuickPickerHandler classWithType:DaiQuickPickerTypeTitle isSizeExist:(size ? YES : NO)];
    return newPicker;
}

+ (UIPickerView *)attributedTitle:(QuickAttributedTitle)attributedTitle components:(QuickComponents)components rows:(QuickRows)rows onSelected:(QuickOnSelected)onSelected {
    return [self attributedTitle:attributedTitle components:components rows:rows size:nil onSelected:onSelected];
}

+ (UIPickerView *)attributedTitle:(QuickAttributedTitle)attributedTitle components:(QuickComponents)components rows:(QuickRows)rows size:(QuickItemSize)size onSelected:(QuickOnSelected)onSelected {
    UIPickerView *newPicker = [self commonPicker:components rows:rows onSelected:onSelected];
    newPicker.quickPickerItems.attributedTitle = attributedTitle;
    newPicker.quickPickerItems.size = size;
    newPicker.delegate = (id <UIPickerViewDelegate>)[QuickPickerHandler classWithType:DaiQuickPickerTypeAttributedTitle isSizeExist:(size ? YES : NO)];
    newPicker.dataSource = (id <UIPickerViewDataSource>)[QuickPickerHandler classWithType:DaiQuickPickerTypeAttributedTitle isSizeExist:(size ? YES : NO)];
    return newPicker;
}

+ (UIPickerView *)view:(QuickView)view components:(QuickComponents)components rows:(QuickRows)rows onSelected:(QuickOnSelected)onSelected {
    return [self view:view components:components rows:rows size:nil onSelected:onSelected];
}

+ (UIPickerView *)view:(QuickView)view components:(QuickComponents)components rows:(QuickRows)rows size:(QuickItemSize)size onSelected:(QuickOnSelected)onSelected {
    UIPickerView *newPicker = [self commonPicker:components rows:rows onSelected:onSelected];
    newPicker.quickPickerItems.view = view;
    newPicker.quickPickerItems.size = size;
    newPicker.delegate = (id <UIPickerViewDelegate>)[QuickPickerHandler classWithType:DaiQuickPickerTypeView isSizeExist:(size ? YES : NO)];
    newPicker.dataSource = (id <UIPickerViewDataSource>)[QuickPickerHandler classWithType:DaiQuickPickerTypeView isSizeExist:(size ? YES : NO)];
    return newPicker;
}

@end
