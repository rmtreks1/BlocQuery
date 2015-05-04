//
//  DetailedQuestionViewController.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 4/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailedQuestionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) PFObject *question;

@end
