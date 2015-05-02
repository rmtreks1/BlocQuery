//
//  LoginViewController.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 2/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <PFSignUpViewControllerDelegate>

@end



@implementation LoginViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    // custom logo
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bloc-logo-rectangle-grey.jpg"]];
    logoView.contentMode = UIViewContentModeScaleAspectFit;
    self.logInView.logo = logoView;
    
}



@end
