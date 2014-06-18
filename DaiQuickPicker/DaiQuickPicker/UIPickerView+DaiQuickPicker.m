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

static const char DQPTITLEPOINTER;
static const char DQPATTRIBUTEDTITLEPOINTER;
static const char DQPVIEWPOINTER;

static const char ONSELECTEDPOINTER;
static const char DQPCOMPONENTSPOINTER;
static const char DQPROWSPOINTER;
static const char DQPITEMSIZEPOINTER;

-(void) setDqpTitle : (DQPTitle) dqpTitle {
    objc_setAssociatedObject(self, &DQPTITLEPOINTER, dqpTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(DQPTitle) dqpTitle {
    return objc_getAssociatedObject(self, &DQPTITLEPOINTER);
}

-(void) setDqpAttributedTitle : (DQPAttributedTitle) dqpAttributedTitle {
    objc_setAssociatedObject(self, &DQPATTRIBUTEDTITLEPOINTER, dqpAttributedTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(DQPAttributedTitle) dqpAttributedTitle {
    return objc_getAssociatedObject(self, &DQPATTRIBUTEDTITLEPOINTER);
}

-(void) setDqpView : (DQPView) dqpView {
    objc_setAssociatedObject(self, &DQPVIEWPOINTER, dqpView, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(DQPView) dqpView {
    return objc_getAssociatedObject(self, &DQPVIEWPOINTER);
}

-(void) setOnSelected : (DQPOnSelected) onSelected {
    objc_setAssociatedObject(self, &ONSELECTEDPOINTER, onSelected, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(DQPOnSelected) onSelected {
    return objc_getAssociatedObject(self, &ONSELECTEDPOINTER);
}

-(void) setDqpComponents : (DQPComponents) dqpComponents {
    objc_setAssociatedObject(self, &DQPCOMPONENTSPOINTER, dqpComponents, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(DQPComponents) dqpComponents {
    return objc_getAssociatedObject(self, &DQPCOMPONENTSPOINTER);
}

-(void) setDqpRows : (DQPRows) dqpRows {
    objc_setAssociatedObject(self, &DQPROWSPOINTER, dqpRows, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(DQPRows) dqpRows {
    return objc_getAssociatedObject(self, &DQPROWSPOINTER);
}

-(void) setDqpItemSize : (DQPItemSize) dqpItemSize {
    objc_setAssociatedObject(self, &DQPITEMSIZEPOINTER, dqpItemSize, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(DQPItemSize) dqpItemSize {
    return objc_getAssociatedObject(self, &DQPITEMSIZEPOINTER);
}

@end
