//
//  QuestionTableViewCell.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 4/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "QuestionTableViewCell.h"

@implementation QuestionTableViewCell
@synthesize answerID;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier forAnswer:(Answers *)answer{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    if (self) {
        // self.backgroundColor = [UIColor lightGrayColor];
    }
    
    
    
    
    
    
    return self;
}


- (IBAction)voteButtonPressed:(UIButton *)sender {
    NSLog(@"voted button pressed on tableview cell");
    [self.delegate votingPressed:self];
}


@end
