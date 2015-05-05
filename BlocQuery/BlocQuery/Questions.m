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

@dynamic questionText;
@dynamic createdBy;
@dynamic questionImage;




+ (void)load {
    [self registerSubclass];
    NSLog(@"questions class loaded");
}

+ (NSString *)parseClassName {
    return @"Questions";
}


+ (Questions *)makeNewQuestion:(NSString *)question withImage:(UIImage *)image{
    Questions *newQuestion = [Questions object];
    newQuestion.questionText = question;
    
    
    // image
    if (image) {
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
        newQuestion.questionImage = [PFFile fileWithName:@"image.jpg" data:imageData];
    }
    
    [newQuestion setObject:[PFUser currentUser] forKey:@"createdBy"];
    
    
    [newQuestion saveInBackground];
    return newQuestion;
}




@end