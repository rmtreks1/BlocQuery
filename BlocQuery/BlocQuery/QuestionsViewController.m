//
//  FirstViewController.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 1/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "QuestionsViewController.h"
#import <Parse/Parse.h>
#import "LoginViewController.h"
#import "SignUpViewController.h"



@interface QuestionsViewController () <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
@property (nonatomic, strong) PFUser *currentUser;

@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.currentUser = [PFUser currentUser];
    
    if (!self.currentUser) {
        NSLog(@"Not logged in");
        
        // testing the login controller
        LoginViewController *loginController = [[LoginViewController alloc] init];
        loginController.delegate = self;
        
        // custom signup controller
        loginController.signUpController = [[SignUpViewController alloc] init];
        loginController.signUpController.delegate = self;
        
        [self presentViewController:loginController animated:YES completion:nil];
    } else if (self.currentUser) {
        NSLog(@"current user is: %@", self.currentUser.email);
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Logging in to Parse
// move this code to button or screen that triggers the login

- (void)logInViewController:(PFLogInViewController *)controller
               didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    [self dismissViewControllerAnimated:YES completion:nil];
}








@end
