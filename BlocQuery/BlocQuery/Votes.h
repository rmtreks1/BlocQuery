//
//  Votes.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 10/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <Parse/Parse.h>


@interface Votes : PFObject <PFSubclassing>

+ (NSString *)parseClassName;

@property (nonatomic, strong) NSString *answerID;
@property (nonatomic, strong) NSString *qestionID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, assign) BOOL vote;


+ (Votes *)vote: (BOOL)vote forAnswer:(NSString *)answer toQuestion: (NSString *)question byUser:(NSString *)user;

@end
