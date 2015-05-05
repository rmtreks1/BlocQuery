//
//  CreateAnswersViewController.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 5/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "CreateAnswersViewController.h"
#import "Answers.h"

@interface CreateAnswersViewController ()

@property (strong, nonatomic) IBOutlet UILabel *answerPromptLabel;
@property (strong, nonatomic) IBOutlet UIButton *done;
@property (strong, nonatomic) IBOutlet UITextView *answer;
@property (strong, nonatomic) IBOutlet UILabel *sampleAnswer;





@end

@implementation CreateAnswersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.answerPromptLabel.text = NSLocalizedString(@"Share your insight", @"answer prompt");
    self.sampleAnswer.text = NSLocalizedString(@"e.g. if baby's poo is green it could be an infection", @"sample answer");
    
    [self.answerPromptLabel becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)doneButtonPressed:(UIButton *)sender {
    [self.answer resignFirstResponder];
    
    
    // create the parse object
    if (![self.answer.text isEqualToString:@""]) {
        NSLog(@"make parse object");
    }
    
    
    
    // dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
