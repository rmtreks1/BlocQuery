//
//  DetailedQuestionViewController.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 4/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "DetailedQuestionViewController.h"
#import "CreateAnswersViewController.h"

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



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"replyWithAnswer"]) {
        CreateAnswersViewController *createAnswerViewController = [segue destinationViewController];
        createAnswerViewController.question = self.question;
    }
}





@end
