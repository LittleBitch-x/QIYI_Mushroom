//
//  MainViewController.m
//  QYMushroom
//
//  Created by 李祖建 on 15/10/23.
//  Copyright © 2015年 RecordTeam. All rights reserved.
//


#import "MainViewController.h"
#import "CustomTabBar.h"
#import "HomeViewController.h"

@interface MainViewController ()



@end

@implementation MainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBar.hidden = YES;
        
        CustomTabBar *tabBar = [[CustomTabBar alloc]init];
        tabBar.center = CGPointMake(MAINSCREEN_W/2,MAINSCREEN_H-tabBar.frame.size.height/2);
        [self.view addSubview:tabBar];
        
        HomeViewController *homeVC = [[HomeViewController alloc]init];
        
        self.viewControllers = @[homeVC];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
