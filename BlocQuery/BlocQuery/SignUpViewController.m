//
//  SignUpViewController.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 2/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bloc-logo-rectangle-grey.jpg"]];
    logoView.contentMode = UIViewContentModeScaleAspectFit;
    self.signUpView.logo = logoView;
    
    
    
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
