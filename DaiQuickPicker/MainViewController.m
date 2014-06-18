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
    
    //easy sample
    
    [self.testTextField setInputView:[DaiQuickPicker title:^NSString *(UIPickerView *picker, NSInteger row, NSInteger component) {
        return [NSString stringWithFormat:@"%d-%d", component, row];
    }
                                                components:^NSInteger{
                                                    return 2;
                                                }
                                                      rows:^NSInteger(UIPickerView *picker, NSInteger components) {
                                                          if (components) {
                                                              return 10;
                                                          } else {
                                                              return 15;
                                                          }
                                                      }
                                                onSelected:^(UIPickerView *picker, NSInteger row, NSInteger component) {
                                                    
                                                    NSLog(@"%d, %d", row, component);
                                                    
                                                }]];
    
}


@end
