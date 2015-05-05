//
//  AnswersPFObejct.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 5/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <Parse/Parse.h>

@interface Answers : PFObject <PFSubclassing>

+ (NSString *)parseClassName;

@property (nonatomic, strong) NSString *answerText;

+ (Answers *)makeNewAnswer:(NSString *)answer;

@end
