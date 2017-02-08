# LYLAlertView 给点个Star支持一下吧！3Q！
效果不错的弹框提醒-成功，失败和提醒状态，便于自定义颜色样式！


可以用block语句监控事件方便灵活：

alert = [[LYLAlertView alloc]initDropAlertWithTitle:@"成功 !" andText:@"新年快乐，万事如意 !" andCancelButton:NO forAlertType:AlertSuccess];
                
                
                alert.animationType = FadeInAnimation;//设置动画样式
                
                
                alert.completionBlock = ^void (LYLAlertView *alertObj, UIButton *button)
                
                {
                    if(button == alertObj.defaultButton) {
                    
                
                        NSLog(@"确认");
                        
                        
                    } else {
                    
                    
                        NSLog(@"其他");
                        
                        
                    }
                    
                    
                };
                                
可以使用代理来监控事件及进程更清晰：

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
