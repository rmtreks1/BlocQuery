//
//  Questions.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 2/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <Parse/Parse.h>

@interface Questions : PFObject <PFSubclassing>
+ (NSString *)parseClassName;

@property (nonatomic, strong) NSString *questionText;

@end
