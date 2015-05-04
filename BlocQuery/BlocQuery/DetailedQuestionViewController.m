//
//  DetailedQuestionViewController.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 4/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "DetailedQuestionViewController.h"

@interface DetailedQuestionViewController ()

@end

@implementation DetailedQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.questionLabel.text = self.question[@"questionText"];
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
