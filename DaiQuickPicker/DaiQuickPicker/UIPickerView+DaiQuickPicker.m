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

@dynamic titleCallback, onSelected, pickerDataSource;

static const char TITLECALLBACKPOINTER;
static const char ONSELECTEDPOINTER;
static const char PICKERDATASOURCEPOINTER;

-(void) setTitleCallback : (TitleCallbackBlock) titleCallback {
    objc_setAssociatedObject(self, &TITLECALLBACKPOINTER, titleCallback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(TitleCallbackBlock) titleCallback {
    return objc_getAssociatedObject(self, &TITLECALLBACKPOINTER);
}

-(void) setOnSelected : (OnSelectedBlock) onSelected {
    objc_setAssociatedObject(self, &ONSELECTEDPOINTER, onSelected, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(OnSelectedBlock) onSelected {
    return objc_getAssociatedObject(self, &ONSELECTEDPOINTER);
}

-(void) setPickerDataSource : (PickerDataSourceBlock) pickerDataSource {
    objc_setAssociatedObject(self, &PICKERDATASOURCEPOINTER, pickerDataSource, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(PickerDataSourceBlock) pickerDataSource {
    return objc_getAssociatedObject(self, &PICKERDATASOURCEPOINTER);
}

@end
