//
//  ViewController.m
//  LYLAlertView
//
//  Created by Rainy on 2017/2/8.
//  Copyright © 2017年 Rainy. All rights reserved.
//

#import "ViewController.h"
#import "LYLConstants.h"
#import "LYLAlertView.h"

@interface ViewController ()<LYLAlertViewDelegate>
{
    LYLAlertView * alert;
    bool isPopupShown;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)PromptPlayAction:(id)sender {
    
    if (!alert || !alert.isDisplayed) {
        UIButton * btn = (UIButton*) sender;
        switch (btn.tag) {
            case AlertSuccess:
                alert = [[LYLAlertView alloc]initDropAlertWithTitle:@"成功 !" andText:@"新年快乐，万事如意 !" andCancelButton:NO forAlertType:AlertSuccess];
                alert.animationType = FadeInAnimation;
                alert.completionBlock = ^void (LYLAlertView *alertObj, UIButton *button) {
                    if(button == alertObj.defaultButton) {
                        NSLog(@"确认");
                    } else {
                        NSLog(@"其他");
                    }
                };
                break;
            case AlertFailure:
                alert = [[LYLAlertView alloc]initFadeAlertWithTitle:@"失败 !" andText:@"对不起，您的操作有误 !" andCancelButton:NO forAlertType:AlertFailure];
                alert.animationType = DropAnimation;
                break;
            case AlertInfo:
                alert = [[LYLAlertView alloc]initDropAlertWithTitle:@"通知提示" andText:@"请注意您的行为可能触犯了协议条例 !" andCancelButton:YES forAlertType:AlertInfo];
                alert.animationType = FadeInAnimation;
                break;
            case 3:
                // Custom colored alert of type AlertInfo, custom colors can be applied to any alert type
                alert = [[LYLAlertView alloc]initDropAlertWithTitle:@"自定义下 !" andText:@"看到我说明你成功了 !" andCancelButton:YES forAlertType:AlertInfo andColor:[UIColor colorWithRed:0.607 green:0.372 blue:0.862 alpha:1]];
                
                alert.animationType = DropAnimation;
                
                break;
            case 4:
                alert = [[LYLAlertView alloc]initDropAlertWithTitle:@"代理 !" andText:@"通过代理监控事件 !" andCancelButton:YES forAlertType:AlertInfo];
                alert.tag = 0;
                
                alert.animationType = FadeInAnimation;
                alert.delegate = self;
                break;
                
                
            default:
                break;
        }
        
        alert.cornerRadius = 3.0f;
        [alert show];
    }else{
        [alert dismissAlertView];
    }
}
#pragma mark - Delegates
- (void)alertView:(LYLAlertView *)alertView didDismissWithButton:(UIButton *)button {
    if (alertView == alert) {
        if (button == alert.defaultButton) {
            NSLog(@"Default button touched!");
        }
        if (button == alert.cancelButton) {
            NSLog(@"Cancel button touched!");
        }
    }
}
- (void)alertViewWillShow:(LYLAlertView *)alertView {
    if (alertView.tag == 0)
        NSLog(@"AlertView Will Show: '%@'", alertView.titleLabel.text);
}

- (void)alertViewDidShow:(LYLAlertView *)alertView {
    NSLog(@"AlertView Did Show: '%@'", alertView.titleLabel.text);
}

- (void)alertViewWillDismiss:(LYLAlertView *)alertView {
    NSLog(@"AlertView Will Dismiss: '%@'", alertView.titleLabel.text);
}

- (void)alertViewDidDismiss:(LYLAlertView *)alertView {
    NSLog(@"AlertView Did Dismiss: '%@'", alertView.titleLabel.text);
}
@end
