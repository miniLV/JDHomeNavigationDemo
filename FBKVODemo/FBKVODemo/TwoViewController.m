//
//  TwoViewController.m
//  FBKVODemo
//
//  Created by Lyh on 2017/10/27.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "TwoViewController.h"

#import <KVOController/KVOController.h>

#import "ViewController.h"

@interface TwoViewController ()



@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    [self setControlTarget];
    
    
//    TwoViewController *twoVC = [[TwoViewController alloc]init];

    
    [self testSuccessKVO];

    
//    ViewController *vc = [[ViewController alloc]init];
//    
//    FBKVOController *KVOC = [FBKVOController controllerWithObserver:vc];
//    
//    self.KVOController = KVOC;
//    
//    [self.KVOController observe:vc keyPath:@"view" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
//        
//        NSLog(@"123");
//        
//    }];
    
}

- (void)testSuccessKVO{

    FBKVOController *KVOC = [FBKVOController controllerWithObserver:self];
    
    self.KVOController = KVOC;
    
    
    
    [self.KVOController observe:self.contentLabel keyPath:@"text" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        
        NSLog(@"123");
        
    }];
    
}


- (void)setControlTarget{

    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 400, 250, 50)];
    contentLabel.text = _contentTextField.text;
    contentLabel.textColor = [UIColor blueColor];
    contentLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [_contentTextField addTarget:self
                          action:@selector(editTextField) forControlEvents:UIControlEventEditingDidEnd];
    
    [_testBtn addTarget:self action:@selector(clickTestBtn) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickTestBtn{

    [_contentTextField resignFirstResponder];
    
}

- (void)editTextField{

    NSLog(@"editTextField");
    
    _contentLabel.text = _contentTextField.text;
}


- (IBAction)clickPopBtn:(id)sender {
    
    
}

@end
