//
//  ViewController.m
//  JDHomeNavigationDemo
//
//  Created by Lyh on 2018/1/10.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *nextBtn = [[UIButton alloc]init];
    nextBtn.frame = CGRectMake(100, 100, 150, 50);
    [nextBtn setTitle:@"next-->" forState:UIControlStateNormal];
    [nextBtn setBackgroundColor:[UIColor orangeColor]];
    [nextBtn addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    nextBtn.center = self.view.center;
    
}

- (void)clickNextBtn{
    
    DemoViewController *demoVC = [[DemoViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:demoVC];
    [UIApplication sharedApplication].keyWindow.rootViewController = navi;
    
}

@end
