//
//  Questions.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 2/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "Questions.h"
#import <Parse/PFObject+Subclass.h>

@implementation Questions

+ (void)load {
    [self registerSubclass];
    NSLog(@"questions class loaded");
}

+ (NSString *)parseClassName {
    return @"Questions";
}


@dynamic questionText;
@dynamic userID;




@end
