//
//  AnswersPFObejct.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 5/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "Answers.h"
#import <Parse/PFObject+Subclass.h>

@implementation Answers

@dynamic answerText;


+ (void)load {
    [self registerSubclass];
    NSLog(@"answers class loaded");
}

+ (NSString *)parseClassName {
    return @"Answers";
}

+ (Answers *)makeNewAnswer:(NSString *)answer forQuestion: (Questions *)question {
    Answers *newAnswer = [Answers object];
    newAnswer.answerText = answer;
    
    
    // link to the question
    [newAnswer setObject:question forKey:@"Question"];
    
    // link to the user
    [newAnswer setObject:[PFUser currentUser] forKey:@"createdBy"];
    
    
    [newAnswer saveInBackground];
    
    return newAnswer;
}






@end
