//
//  Votes.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 10/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "Votes.h"



@implementation Votes : PFObject

@dynamic vote;
@dynamic answerID;
@dynamic qestionID;
@dynamic userID;


+ (void)load {
    [self registerSubclass];
    NSLog(@"votes class loaded");
}

+ (NSString *)parseClassName {
    return @"Votes";
}





+ (Votes *)vote: (BOOL)vote forAnswer:(NSString *)answer toQuestion: (NSString *)question byUser:(NSString *)user{
    Votes *newVote = [Votes object];
    
    PFQuery *findAnswer = [PFQuery queryWithClassName:@"Votes"];
//    [findAnswer whereKey:@"answerID" equalTo:answer];
    [findAnswer whereKey:@"answerID" equalTo:[PFObject objectWithoutDataWithClassName:@"Answers" objectId:answer]];
    
    PFQuery *findQuestion = [PFQuery queryWithClassName:@"Votes"];
//    [findQuestion whereKey:@"questionID" equalTo:question];
    [findQuestion whereKey:@"questionID" equalTo:[PFObject objectWithoutDataWithClassName:@"Questions" objectId:question]];
    

    PFQuery *findUser = [PFQuery queryWithClassName:@"Votes"];
//    [findUser whereKey:@"userID" equalTo:user];
    [findUser whereKey:@"userID" equalTo:[PFObject objectWithoutDataWithClassName:@"User" objectId:user]];

    PFQuery *query = [PFQuery orQueryWithSubqueries:@[findAnswer, findQuestion, findUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {
        // results contains players with lots of wins or only a few wins.
        NSLog(@"result returned is: %lu", (unsigned long)results.count);
        
        PFObject *resultsObject = results[0];
        
        NSLog(@"what's returnd is: %@", resultsObject[@"vote"]);
        
        
    }];
    
    
    
    
    
    return newVote;
    
}



@end
