//
//  DemoViewController.m
//  JDHomeNavigationDemo
//
//  Created by Lyh on 2018/1/10.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@end

@implementation DemoViewController{
    
    //根据alpha - 改变透明度的背景View
    UIView *_topBackView;
    
    //不被alpha影响 - 放控件的View
    UIView *_navigationView;
    
    UIButton *_leftBtn;
    UIButton *_rightBtn;
    UITextField *_textField;
    //顶部状态栏颜色
    UIStatusBarStyle _statusBarStyle;
}

#define screenH [UIScreen mainScreen].bounds.size.height
#define screenW [UIScreen mainScreen].bounds.size.width
static CGFloat naviViewH = 44;
static CGFloat toolH = 20;
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];

    //1.setupUI
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - setupUI
- (void)setupUI{
    
    //1.basicSetting
    self.title = @"demoTitle";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //2.tableView
    [self prepareTableView];
    
    //3.navigation
    [self prepareNavigation];

}

- (void)prepareNavigation{

    //0.背景View
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.frame = CGRectMake(0, 0, screenW, naviViewH + toolH);
    [self.view addSubview:backView];
    _topBackView = backView;
    
    //1.naviView
    UIView *naviView = [[UIView alloc]init];
    naviView.frame = CGRectMake(0, toolH , screenW, naviViewH);
    [self.view addSubview:naviView];
    _navigationView = naviView;
    
    //2.左边按钮
    CGFloat btnW = 28;
    CGFloat btnH = 30;
    CGFloat btnY = 5;
    CGFloat leftMargin = 15;
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(leftMargin, btnY, btnW, btnH);
    [leftBtn setImage:[UIImage imageNamed:@"xiaoxi-h"] forState:UIControlStateNormal];
    [naviView addSubview:leftBtn];
    _leftBtn = leftBtn;
    
    //3.右边按钮
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(screenW - leftMargin - btnW, btnY, btnW, btnH);
    [rightBtn setImage:[UIImage imageNamed:@"fuwu-h"] forState:UIControlStateNormal];
    [naviView addSubview:rightBtn];
    _rightBtn = rightBtn;
    
    //4.搜索框
    CGFloat searchTextFW = 250;
    CGFloat searchTextFH = 30;
    UITextField *searchTextF = [[UITextField alloc]init];
    searchTextF.layer.cornerRadius = searchTextFH * 0.5;
    searchTextF.layer.masksToBounds = YES;
    searchTextF.backgroundColor = [UIColor lightGrayColor];
    searchTextF.frame = CGRectMake(0, btnY, searchTextFW, searchTextFH);
    [naviView addSubview:searchTextF];
    CGPoint tempCenter = backView.center;
    tempCenter.x = backView.center.x;
    tempCenter.y = backView.center.y - 10;
    searchTextF.center = tempCenter;
    _textField = searchTextF;
}

- (void)prepareTableView{
    UITableView *tableView = [[UITableView alloc]init];
    //顶部工具条间隙
    tableView.frame = CGRectMake(0, - toolH, screenW, screenH + toolH);
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    UIImageView *topImageView = [[UIImageView alloc]init];
    topImageView.frame = CGRectMake(0, 0, screenW, 200);
    topImageView.image = [UIImage imageNamed:@"mini"];
    tableView.tableHeaderView = topImageView;
}

#pragma mark - <UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }

    cell.textLabel.text = [@"test ----- "stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
    return cell;
}


#pragma mark - <scrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    static CGFloat tagOffsetY = 300.0;
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = offsetY / tagOffsetY;
    _topBackView.alpha = alpha;

    if (_topBackView.alpha >= 1) {
        
        //开始导航条变化
        _topBackView.backgroundColor = [UIColor darkGrayColor];
        [_rightBtn setImage:[UIImage imageNamed:@"fuwu"] forState:UIControlStateNormal];
        [_leftBtn setImage:[UIImage imageNamed:@"xiaoxi"] forState:UIControlStateNormal];
        _textField.backgroundColor = [UIColor whiteColor];
        _statusBarStyle = UIStatusBarStyleLightContent;
    }
    else{
        
        //默认导航条样式
        _topBackView.backgroundColor = [UIColor whiteColor];
        [_rightBtn setImage:[UIImage imageNamed:@"fuwu-h"] forState:UIControlStateNormal];
        [_leftBtn setImage:[UIImage imageNamed:@"xiaoxi-h"] forState:UIControlStateNormal];
        _textField.backgroundColor = [UIColor lightGrayColor];
        _statusBarStyle = UIStatusBarStyleDefault;
    }
    //设置状态栏刷新
    [self setNeedsStatusBarAppearanceUpdate];
}

//设置顶部状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return _statusBarStyle;
}

@end
