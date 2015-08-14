DaiQuickPicker
==============
方便快速的建立簡單的 `UIPickerView`, 省去 `delegate` 與 `dataSource` 設置, 皆由連貫的 block 方式完成

![image](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/DaiQuickPicker.gif)

DaidoujiChen

daidoujichen@gmail.com

總覽
===========
`UIPickerView` 雖然方便, 但是每次建立時都需要加上一大堆的 `delegate` 和 `dataSource`, 在同一個 controller 上如果有多個 picker 的話, 設置上更為混亂, 因此, 如果可以利用 block 的方式將這些東西整合在一起, 寫作上將會更為的便利.

手動安裝
===========
先把 `DaiQuickPicker` 資料夾下兩個檔案

`````
DaiQuickPicker.h
DaiQuickPicker.m
`````

複製到你目前的專案中, 然後在要用的地方

`````
#import "DaiQuickPicker.h"
`````

即可.

使用
===========
最簡單的 picker 顯示就是普通的 `NSString`, 當我們想要設置有兩個 `components` 的 picker 時, 可以利用下面兩個方法

`````
+ (UIPickerView *)title:(QuickTitle)title components:(QuickComponents)components rows:(QuickRows)rows onSelected:(QuickOnSelected)onSelected;
+ (UIPickerView *)title:(QuickTitle)title components:(QuickComponents)components rows:(QuickRows)rows size:(QuickItemSize)size onSelected:(QuickOnSelected)onSelected;
`````

兩個的差異只在要不要自定義 `size`, 可以調整 `row` 的大小, 使用上會像是

`````
self.yourTextField.inputView = [DaiQuickPicker title: ^NSString *(UIPickerView *picker, NSInteger row, NSInteger component) {
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
`````

就完成了.

除了 `NSString`, 也支援 `NSAttributedString` 以及任何客製化的 `UIView`.