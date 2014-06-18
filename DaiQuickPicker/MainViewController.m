//
//  MainViewController.m
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController

-(BOOL) textFieldShouldReturn : (UITextField*) textField {
    return YES;
}

#pragma mark - life cycle

-(void) viewDidLoad {
    [super viewDidLoad];
    
    __block int selectedComponent = 0;
    [self.testTextField setInputView:[DaiQuickPicker picker:^PickerDataSource(PickerDataSource dataSource) {
        dataSource.components = 5;
        dataSource.rows = (selectedComponent+1)*2;
        return dataSource;
    }
                                              titleCallback:^NSString *(UIPickerView* picker, NSInteger row, NSInteger component) {
                                                  return @"hello";
                                              }
                                                 onSelected:^(UIPickerView* picker, NSInteger row, NSInteger component) {
                                                     NSLog(@"%d, %d", row, component);
                                                     selectedComponent = component;
                                                     [picker reloadAllComponents];
                                                 }]];
    
}


@end
