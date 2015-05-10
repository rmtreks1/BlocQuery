//
//  QuestionTableViewCell.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 4/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <ParseUI/ParseUI.h>
#import <UIKit/UIKit.h>


@class QuestionTableViewCell;
@class Answers;

@protocol questionTableViewCelldelegate <NSObject>

@optional
- (void) votingPressed: (QuestionTableViewCell *)cell;

@end

@interface QuestionTableViewCell : PFTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) id<questionTableViewCelldelegate> delegate;
@property (nonatomic, strong) Answers *answerID;

@end
