//
//  AllAnswersViewController.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 6/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "Questions.h" // replace is @class


@interface AllAnswersViewController : PFQueryTableViewController


@property (nonatomic, strong) Questions *question;


@end
