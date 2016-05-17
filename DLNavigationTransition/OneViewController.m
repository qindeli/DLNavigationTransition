//
//  OneViewController.m
//  DLNavigationTransition
//
//  Created by vera on 16/5/17.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController


- (IBAction)enterTwoViewController:(id)sender
{
    TwoViewController *twoCtrl = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:twoCtrl animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"$$$$$$$$$$$$$");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
