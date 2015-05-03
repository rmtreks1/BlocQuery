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

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton2;
@property (weak, nonatomic) IBOutlet UITextView *question;
@property (weak, nonatomic) IBOutlet UILabel *sampleQuestion;


@end

@implementation CreateQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.questionLabel.text = NSLocalizedString(@"Ask For Answers", @"question prompt");
    
    self.sampleQuestion.text = NSLocalizedString(@"ask anything, e.g. : Is it bad if my baby's poo is green?", @"sample question");

    self.doneButton.enabled = false;
    [self.question becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - submitting a question

- (IBAction)enteringQuestion:(UITextField *)sender {
    if (![self.question.text  isEqual: @""]) {
        self.doneButton.enabled = true;
    }
}

- (IBAction)doneAndDismiss:(UIButton *)sender {
    [self.question resignFirstResponder];
    NSLog(self.question.text);
    
    
    // create parse object
    if (![self.question.text  isEqual: @""]) {
        Questions *newQuestion = [Questions makeNewQuestion:self.question.text withImage:nil];
    }
    
    // dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];

}






@end
