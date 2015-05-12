//
//  Votes.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 10/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <Parse/Parse.h>
#import "Answers.h"
#import "Questions.h"


@interface Votes : PFObject <PFSubclassing>

typedef enum {
    VotedNo,
    VotedYes
}voteState;

+ (NSString *)parseClassName;

@property (nonatomic, strong) PFObject *answerID;
@property (nonatomic, strong) PFObject *questionID;
@property (nonatomic, strong) PFUser *userID;
//@property (nonatomic, assign) BOOL state;
@property (nonatomic, assign) voteState votedState;


- (void)voteforAnswer:(Answers *)answer withBlock:(PF_NULLABLE PFBooleanResultBlock)block;

@end
