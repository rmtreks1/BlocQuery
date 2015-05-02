//
//  ProfileViewController.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 1/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "ProfileViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "Questions.h"

@interface ProfileViewController () <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *logout;





@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //check if there's a user
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        self.login.hidden = YES;
        self.logout.hidden = NO;
        NSLog(@"current user: %@", currentUser.email);
    } else if (!currentUser) {
        self.login.hidden = NO;
        self.logout.hidden = YES;
    }
    
    
   
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        self.login.hidden = YES;
        self.logout.hidden = NO;
        NSLog(@"current user: %@", currentUser.email);
    } else if (!currentUser) {
        self.login.hidden = NO;
        self.logout.hidden = YES;
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Login

- (IBAction)loginAction:(UIButton *)sender {
    
    // testing the login controller
    LoginViewController *loginController = [[LoginViewController alloc] init];
    loginController.delegate = self;
    
    // custom signup controller
    loginController.signUpController = [[SignUpViewController alloc] init];
    loginController.signUpController.delegate = self;
    
    [self presentViewController:loginController animated:YES completion:nil];
    
    
    
    
}

- (IBAction)logoutUser:(UIButton *)sender {
    
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    
    if (currentUser) {
        self.login.hidden = YES;
        self.logout.hidden = NO;
        NSLog(@"current user: %@", currentUser.email);
    } else if (!currentUser) {
        self.login.hidden = NO;
        self.logout.hidden = YES;
    }

    
}








#pragma mark - Testing Parse
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





#pragma mark - Ask Question Button

- (IBAction)askQuestion:(UIButton *)sender {
    NSLog(@"ask question button pressed");
    
    Questions *newQuestion = [Questions object];
    newQuestion.questionText = @"something something";
    
    [newQuestion saveInBackground];
    
}





@end
