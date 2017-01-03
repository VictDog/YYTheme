//
//  代码地址：https://github.com/VictDog/YYTheme
//  作者地址：https://github.com/VictDog/
//
//  YYAddController.m
//  YYTheme
//
//  Created by Mac on 2016.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "YYAddController.h"

@interface YYAddController ()

@end

@implementation YYAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)publish:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
