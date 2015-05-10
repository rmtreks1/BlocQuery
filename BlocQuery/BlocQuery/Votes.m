//
//  Votes.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 10/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "Votes.h"



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





+ (Votes *)voteforAnswer:(NSString *)answer toQuestion: (NSString *)question{
    
    Votes *newVote = [Votes object];

    PFUser *user = [PFUser currentUser];
    

    PFQuery *query = [PFQuery queryWithClassName:@"Votes"];
    [query whereKey:@"answerID" equalTo:[PFObject objectWithoutDataWithClassName:@"Answers" objectId:answer]];
    [query whereKey:@"questionID" equalTo:[PFObject objectWithoutDataWithClassName:@"Questions" objectId:question]];
    [query whereKey:@"userID" equalTo:user];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {
        
        if (results.count == 0) {
            NSLog(@"no votes found");
        } else if (results.count == 1) {
            NSLog(@"vote found");
            NSLog(@"user id is: %@", user.objectId);
//            [newVote voteYes:newVote];
            
        } else {
            NSLog(@"investigate could be an error with votes");
        }
        
    }];
    
    newVote.questionID = [PFObject objectWithoutDataWithClassName:@"Questions" objectId:question];
    newVote.answerID = [PFObject objectWithoutDataWithClassName:@"Answers" objectId:answer];
    newVote.userID = user;

    
    return newVote;
    
}


-(void)voteYes: (Votes *)vote{
    
    vote.votedState = VotedYes;
    [vote saveInBackground];
}



@end
