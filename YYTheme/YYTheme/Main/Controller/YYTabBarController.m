//
//  代码地址：https://github.com/VictDog/YYTheme
//  作者地址：https://github.com/VictDog/
//
//  YYTabBarController.m
//  YYTheme
//
//  Created by Mac on 2016.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "YYTabBarController.h"
#import "YYNavigationController.h"
#import "YYTabBar.h"
#import "YYThemeController.h"
#import "NSObject+YYThemeExtension.h"
#import "YYAddController.h"

@interface YYTabBarController ()

@end

@implementation YYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    YYTabBar *tabBar = [YYTabBar tabBar];
    // 自定义tabBar
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    // 设置子控制器
    [self setUpChildViewControllers];
}

#pragma mark - 设置子控制器
- (void)setUpChildViewControllers {
    
    [self addChildViewController:[[YYThemeController alloc] init] image:@"tab_home_nor" seletedImage:@"tab_home_press" title:@"首页"];
    [self addChildViewController:[[YYThemeController alloc] init] image:@"tab_classify_nor"  seletedImage:@"tab_classify_press"  title:@"分类"];
    [self addChildViewController:[[YYThemeController alloc] init] image:@"tab_community_nor"  seletedImage:@"tab_community_press"  title:@"社区"];
    [self addChildViewController:[[YYThemeController alloc] init] image:@"tab_me_nor"  seletedImage:@"tab_me_press"  title:@"我的"];
}

#pragma mark - 添加子控制器
- (UIViewController *)addChildViewController:(UIViewController *)childController image:(NSString *)image seletedImage:(NSString *)selectedImage title:(NSString *)title {
    
    childController.title = title;
    // 设置字体颜色
    NSMutableDictionary * normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor darkTextColor];
    [childController.tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    NSMutableDictionary * selectedAtrrs = [NSMutableDictionary dictionary];
    selectedAtrrs[NSForegroundColorAttributeName] = YYTHEME_THEME_COLOR;
    [childController.tabBarItem yy_addToThemeColorPoolWithSelector:@selector(setTitleTextAttributes:forState:) objects:@[selectedAtrrs, @(UIControlStateSelected)]];
    // 设置图片
    [childController.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    // 导航条
    YYNavigationController *nav = [[YYNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
    return childController;
}

- (void)tabBarDidClickAddItem:(YYTabBar *)tabBar {
    [self presentViewController:[[YYAddController alloc] init] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
