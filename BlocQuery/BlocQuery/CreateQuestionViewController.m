//
//  CreateQuestionViewController.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 1/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "CreateQuestionViewController.h"
#import "Questions.h"

@interface CreateQuestionViewController ()
@property (weak, nonatomic) IBOutlet UITextField *question;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation CreateQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.question becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - submitting a question

- (IBAction)submitQuestion:(UIBarButtonItem *)sender {
    [self.question resignFirstResponder];
    NSLog(self.question.text);
    
    Questions *newQuestion = [Questions makeNewQuestion:self.question.text withImage:nil];
    NSLog(newQuestion.questionText);
}








@end
