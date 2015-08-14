//
//  MainViewController.m
//  DaiQuickPicker
//
//  Created by 啟倫 陳 on 2014/6/18.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sizeSegment;

@end

@implementation MainViewController

#pragma mark - ibaction

- (IBAction)typeChangeAction:(id)sender {
    [self refreshInputView];
}

- (IBAction)sizeChangeAction:(id)sender {
    [self refreshInputView];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.typeSegment.enabled = NO;
    self.sizeSegment.enabled = NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.typeSegment.enabled = YES;
    self.sizeSegment.enabled = YES;
}

#pragma mark - private instance method

- (void)refreshInputView {
    switch (self.typeSegment.selectedSegmentIndex) {
        case 0:
        {
            switch (self.sizeSegment.selectedSegmentIndex) {
                case 0:
                    NSLog(@"Select to Title + DefaultSize");
                    self.testTextField.inputView = [DaiQuickPicker title: ^NSString *(UIPickerView *picker, NSInteger row, NSInteger component) {
                        return [NSString stringWithFormat:@"%td-%td", component, row];
                    } components: ^NSInteger {
                        return 2;
                    } rows: ^NSInteger(UIPickerView *picker, NSInteger components) {
                        if (components) {
                            return 10;
                        }
                        else {
                            return 15;
                        }
                    } onSelected: ^(UIPickerView *picker, NSInteger row, NSInteger component, id selectedItem) {
                        NSLog(@"%td, %td, %@", row, component, selectedItem);
                    }];
                    break;
                    
                case 1:
                    NSLog(@"Select to Title + CustomSize");
                    self.testTextField.inputView = [DaiQuickPicker title: ^NSString *(UIPickerView *picker, NSInteger row, NSInteger component) {
                        return [NSString stringWithFormat:@"%td-%td", component, row];
                    } components: ^NSInteger {
                        return 2;
                    } rows: ^NSInteger(UIPickerView *picker, NSInteger components) {
                        if (components) {
                            return 10;
                        }
                        else {
                            return 15;
                        }
                    } size: ^CGSize {
                        return CGSizeMake(50, 80);
                    } onSelected: ^(UIPickerView *picker, NSInteger row, NSInteger component, id selectedItem) {
                        NSLog(@"%td, %td, %@", row, component, selectedItem);
                    }];
                    break;
                    
                default:
                    break;
            }
            break;
        }
            
        case 1:
        {
            switch (self.sizeSegment.selectedSegmentIndex) {
                case 0:
                    NSLog(@"Select to Attributed + DefaultSize");
                    self.testTextField.inputView = [DaiQuickPicker attributedTitle: ^NSAttributedString *(UIPickerView *picker, NSInteger row, NSInteger component) {
                        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%td-%td", component, row] attributes:@{ NSForegroundColorAttributeName : [UIColor redColor] }];
                        return attributedString;
                    } components: ^NSInteger {
                        return 2;
                    } rows: ^NSInteger(UIPickerView *picker, NSInteger components) {
                        if (components) {
                            return 10;
                        }
                        else {
                            return 15;
                        }
                    } onSelected: ^(UIPickerView *picker, NSInteger row, NSInteger component, id selectedItem) {
                        NSLog(@"%td, %td, %@", row, component, selectedItem);
                    }];
                    break;
                    
                case 1:
                    NSLog(@"Select to Attributed + CustomSize");
                    self.testTextField.inputView = [DaiQuickPicker attributedTitle: ^NSAttributedString *(UIPickerView *picker, NSInteger row, NSInteger component) {
                        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%td-%td", component, row] attributes:@{ NSForegroundColorAttributeName : [UIColor redColor] }];
                        return attributedString;
                    } components: ^NSInteger {
                        return 2;
                    } rows: ^NSInteger(UIPickerView *picker, NSInteger components) {
                        if (components) {
                            return 10;
                        }
                        else {
                            return 15;
                        }
                    } size: ^CGSize {
                        return CGSizeMake(100, 80);
                    } onSelected: ^(UIPickerView *picker, NSInteger row, NSInteger component, id selectedItem) {
                        NSLog(@"%td, %td, %@", row, component, selectedItem);
                    }];
                    break;
                    
                default:
                    break;
            }
            break;
        }
            
        case 2:
        {
            switch (self.sizeSegment.selectedSegmentIndex) {
                case 0:
                    NSLog(@"Select to View + DefaultSize");
                    self.testTextField.inputView = [DaiQuickPicker view: ^UIView *(UIPickerView *picker, NSInteger row, NSInteger component, UIView *reusingView) {
                        UILabel *label = nil;
                        if (reusingView) {
                            label = (UILabel *)reusingView;
                        }
                        else {
                            label = [UILabel new];
                            label.backgroundColor = [UIColor whiteColor];
                            label.textColor = [UIColor blackColor];
                        }
                        label.text = [NSString stringWithFormat:@"%td-%td", component, row];
                        return label;
                    } components: ^NSInteger {
                        return 2;
                    } rows: ^NSInteger(UIPickerView *picker, NSInteger components) {
                        if (components) {
                            return 10;
                        }
                        else {
                            return 15;
                        }
                    } onSelected: ^(UIPickerView *picker, NSInteger row, NSInteger component, id selectedItem) {
                        NSLog(@"%td, %td, %@", row, component, selectedItem);
                    }];
                    break;
                    
                case 1:
                    NSLog(@"Select to View + CustomSize");
                    self.testTextField.inputView = [DaiQuickPicker view: ^UIView *(UIPickerView *picker, NSInteger row, NSInteger component, UIView *reusingView) {
                        UILabel *label = nil;
                        if (reusingView) {
                            label = (UILabel *)reusingView;
                        }
                        else {
                            label = [UILabel new];
                            label.backgroundColor = [UIColor whiteColor];
                            label.textColor = [UIColor blackColor];
                        }
                        label.text = [NSString stringWithFormat:@"%td-%td", component, row];
                        return label;
                    } components: ^NSInteger {
                        return 2;
                    } rows: ^NSInteger(UIPickerView *picker, NSInteger components) {
                        if (components) {
                            return 10;
                        }
                        else {
                            return 15;
                        }
                    } size: ^CGSize {
                        return CGSizeMake(150, 80);
                    } onSelected: ^(UIPickerView *picker, NSInteger row, NSInteger component, id selectedItem) {
                        NSLog(@"%td, %td, %@", row, component, selectedItem);
                    }];
                    break;
                    
                default:
                    break;
            }
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testTextField.delegate = self;
    
    [self refreshInputView];
    
    // add done button
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self.testTextField action:@selector(resignFirstResponder)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIToolbar *toolbar = [UIToolbar new];
    toolbar.items = @[flexibleSpace, doneButton];
    self.testTextField.inputAccessoryView = toolbar;
    [toolbar sizeToFit];
}

@end
