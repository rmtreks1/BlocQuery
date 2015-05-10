//
//  Votes.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 10/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <Parse/Parse.h>


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


+ (Votes *)voteforAnswer:(NSString *)answer toQuestion: (NSString *)question;

@end
