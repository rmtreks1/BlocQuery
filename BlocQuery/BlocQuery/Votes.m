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

+ (Votes *)vote: (BOOL)vote forAnswer:(Answers *)answer toQuestion: (Questions *)question byUser:(PFUser *)user{
    Votes *newVote = [Votes object];
    
    
    
    PFQuery *findAnswer = [PFQuery queryWithClassName:@"Votes"];
    [findAnswer whereKey:@"answerID" equalTo:answer];
    
    PFQuery *findQuestion = [PFQuery queryWithClassName:@"Votes"];
    [findAnswer whereKey:@"questionID" equalTo:question];

    PFQuery *findUser = [PFQuery queryWithClassName:@"Votes"];
    [findUser whereKey:@"userID" equalTo:user];

    PFQuery *query = [PFQuery orQueryWithSubqueries:@[findAnswer, findQuestion, findUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {
        // results contains players with lots of wins or only a few wins.
        NSLog(@"result returned is: %lu", (unsigned long)results.count);
        
        
    }];
    
    
    
    
    
    return newVote;
    
}



@end
