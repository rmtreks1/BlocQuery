//
//  QuestionHeaderTableViewCell.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 6/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionHeaderTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *profilePicture;
@property (strong, nonatomic) IBOutlet UIButton *profilePicButton;

@end
