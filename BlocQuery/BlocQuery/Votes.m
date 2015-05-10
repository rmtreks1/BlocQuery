//
//  Votes.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 10/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "Votes.h"
#import "Answers.h"
#import "Questions.h"



@implementation Votes : PFObject


@dynamic answerID;
@dynamic questionID;
@dynamic userID;
@dynamic votedState;


+ (void)load {
    [self registerSubclass];
    NSLog(@"votes class loaded");
}

+ (NSString *)parseClassName {
    return @"Votes";
}





+ (void)voteforAnswer:(Answers *)answer{

    PFUser *user = [PFUser currentUser];
    

    PFQuery *query = [PFQuery queryWithClassName:@"Votes"];
    [query whereKey:@"answerID" equalTo:answer];
    [query whereKey:@"userID" equalTo:user];

    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {

        if (results.count == 0) {
            Votes *newVote = [Votes object];
            newVote.votedState = VotedYes;
            newVote.answerID = answer;
            newVote.userID = user;
            
            [newVote saveInBackground];
            
            
        } else if (results.count == 1) {
            Votes *savedVote = results[0];
            NSInteger resultsVotedState = [results[0][@"votedState"]intValue];
            savedVote.votedState = (resultsVotedState == 1)? VotedNo : VotedYes;
            
            [savedVote saveInBackground];
            
            
            
        } else {
            NSLog(@"investigate could be an error with votes");
        }
        
    }];
}


@end
