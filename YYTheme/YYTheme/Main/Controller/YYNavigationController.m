//
//  代码地址：https://github.com/VictDog/YYTheme
//  作者地址：https://github.com/VictDog/
//
//  YYNavigationController.m
//  YYTheme
//
//  Created by Mac on 2016.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "YYNavigationController.h"
#import "NSObject+YYThemeExtension.h"

@interface YYNavigationController ()

@end

@implementation YYNavigationController

#pragma mark - initWithRootViewController
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    if (self = [super initWithRootViewController:rootViewController]) {
        UINavigationBar *navBar = [[UINavigationBar alloc] init];
        // 设置主题颜色
        [navBar yy_addToThemeColorPool:@"barTintColor"];
        navBar.tintColor = [UIColor whiteColor];
        // 设置字体颜色
        NSDictionary *attributes = @{ NSForegroundColorAttributeName: [UIColor whiteColor],
                                NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
        navBar.titleTextAttributes = attributes;
        [self setValue:navBar forKey:@"navigationBar"];
    }
    return self;
}


#pragma mark - 设置状态栏白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
