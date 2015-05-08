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


@interface ProfileViewController () <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) PFUser *currentUser;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *loginLogoutButton;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextView *userDescription;
@property (strong, nonatomic) IBOutlet UIImageView *profilePicture;
@property (strong, nonatomic) IBOutlet UIImageView *pictureFromAlbum;




@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    //check if there's a user
    self.currentUser = [PFUser currentUser];
    if (self.currentUser) {
        self.loginLogoutButton.title = @"Logout";
        self.username.text = self.currentUser.username;
        self.username.userInteractionEnabled = NO;
        self.email.text = self.currentUser.email;
        self.userDescription.text = self.currentUser[@"description"];
        NSLog(@"current user: %@", self.currentUser.email);
        NSLog(@"current user description: %@", self.currentUser[@"description"]);
        
        
        PFFile *userImageFile = self.currentUser[@"profilePicture"];
        [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
            if (!error) {
                self.profilePicture.image = [UIImage imageWithData:imageData];
            }
        }];
        
        
        
        
        
    } else if (!self.currentUser) {
        self.loginLogoutButton.title = @"Login";
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Login

- (void)loginUser {
    
    // testing the login controller
    LoginViewController *loginController = [[LoginViewController alloc] init];
    loginController.delegate = self;
    
    // custom signup controller
    loginController.signUpController = [[SignUpViewController alloc] init];
    loginController.signUpController.delegate = self;
    
    [self presentViewController:loginController animated:YES completion:nil];
    
    
    
    
}

- (void)logoutUser {
    
    [PFUser logOut];
    self.currentUser = [PFUser currentUser];
    
    if (self.currentUser) {
        self.loginLogoutButton.title = @"Logout";
    } else if (!self.currentUser) {
        self.loginLogoutButton.title = @"Login";
    }

    
}



- (IBAction)loginLogoutUser:(UIBarButtonItem *)sender {
    if ([PFUser currentUser]) {
        [self logoutUser];
    } else {
        [self loginUser];
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





#pragma mark - User Profile Picture

- (IBAction)buttonPressed:(UIBarButtonItem *)sender {
    NSLog(@"button pressed");
    
//    // save dummy image to parse for user
//    UIImage *image = [UIImage imageNamed:@"Batman.jpg"];
//    NSData *imageData = UIImagePNGRepresentation(image);
//    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
//    self.currentUser[@"profilePicture"] = imageFile;
//    [self.currentUser saveInBackground];
    
    
    
    // implementing UIImagePickerController
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
   }


- (void)saveProfilePictureToParse:(UIImage *)profilePicture{
    UIImage *image = profilePicture;
    NSData *imageData = UIImagePNGRepresentation(image);
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    self.currentUser[@"profilePicture"] = imageFile;
    [self.currentUser saveInBackground];
}




#pragma mark - imagePickerController


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//    self.pictureFromAlbum.image = chosenImage;
    [self saveProfilePictureToParse:chosenImage];
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
