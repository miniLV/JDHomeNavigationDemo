//
//  ViewController.m
//  FBKVODemo
//
//  Created by Lyh on 2017/10/27.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "ViewController.h"

#import "TwoViewController.h"

#import <KVOController/KVOController.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//     TwoViewController *twoVC = [[TwoViewController alloc]init];
//    
//    FBKVOController *KVOC = [FBKVOController controllerWithObserver:twoVC];
//    
//    self.KVOController = KVOC;
    
//    [self.KVOController observe:twoVC.contentLabel keyPath:@"text" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
//        
//        NSLog(@"123");
//        
//        
//        
//    }];
    
    
    
}

- (void)editTextField{

    
}

- (IBAction)clickNextBtn:(id)sender {
    
    TwoViewController *twoVC = [[TwoViewController alloc]init];
    
    [self.navigationController pushViewController:twoVC animated:YES];
    
    
}


@end
