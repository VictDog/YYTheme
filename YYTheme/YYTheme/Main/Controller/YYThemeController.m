//
//  代码地址：https://github.com/VictDog/YYTheme
//  作者地址：https://github.com/VictDog/
//
//  YYThemeController.m
//  YYTheme
//
//  Created by Mac on 2016.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "YYThemeController.h"
#import "UIView+YYExtension.h"
#import "NSObject+YYThemeExtension.h"

#pragma mark - 颜色
#define YYColor(r,g,b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]
#define YYRandomColor  YYColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))

@interface YYThemeController ()

@end

@implementation YYThemeController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - 初始化
- (instancetype)init {
    // 设置流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 80) / 3;
    layout.itemSize = CGSizeMake(width, width);
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 20;
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.yy_x = 20;
    self.collectionView.yy_y = 0;
    self.collectionView.yy_width = [UIScreen mainScreen].bounds.size.width - 40;
    self.collectionView.yy_height = [UIScreen mainScreen].bounds.size.height - 40;
    self.collectionView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 45;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = YYRandomColor;
    cell.layer.cornerRadius = 10;
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取出选中cell，设置主题颜色
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
//    NSLog(@"color%@", selectedCell.backgroundColor);
    [self yy_setThemeColor:selectedCell.backgroundColor];
}

@end
