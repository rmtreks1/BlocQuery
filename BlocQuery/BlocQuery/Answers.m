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

+ (Answers *)makeNewAnswer:(NSString *)answer{
    Answers *newAnswer = [Answers object];
    newAnswer.answerText = answer;
    
    [newAnswer saveInBackground];
    return newAnswer;
}






@end
