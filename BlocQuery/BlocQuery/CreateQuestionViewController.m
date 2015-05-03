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
@property (weak, nonatomic) IBOutlet UILabel *questionAsked;

@end

@implementation CreateQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.question.placeholder = NSLocalizedString(@"what does black baby poo mean?", @"placeholder question");
    
    
    self.questionAsked.hidden = true;
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



- (IBAction)submitQuestion:(UIBarButtonItem *)sender {
    [self.question resignFirstResponder];
    NSLog(self.question.text);
    
    
    if (![self.question.text  isEqual: @""]) {
        Questions *newQuestion = [Questions makeNewQuestion:self.question.text withImage:nil];
        NSLog(newQuestion.questionText);
        
        if (newQuestion) {
            self.question.hidden = true;
            self.doneButton.enabled = false;
            self.questionAsked.text = newQuestion.questionText;
            self.questionAsked.hidden = false;
            
        }

    }
    
   }








@end
