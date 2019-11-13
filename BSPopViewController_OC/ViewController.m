//
//  ViewController.m
//  BSPopViewController_OC
//
//  Created by 张宝山 on 2019/11/13.
//  Copyright © 2019 张宝山. All rights reserved.
//

#import "ViewController.h"
#import "TestPopController.h"
#import "UIViewController+PopPresent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(150, 250, 80, 80)];
    [button setTitle:@"弹出视图" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)clickButton:(UIButton *)sender{
    
    TestPopController *vc = [[TestPopController alloc]init];
    
    [self showPresentedController:vc WithType:AlertType presentSize:CGSizeMake(200, 200) shadowDismiss:NO completeHandle:^(BOOL presented) {}];
    
    dispatch_time_t sleepTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC));

    dispatch_after(sleepTime, dispatch_get_main_queue(),^{

    //隐藏
        [vc dismissViewControllerAnimated:YES completion:nil];
        
    });
    
    
}


@end
