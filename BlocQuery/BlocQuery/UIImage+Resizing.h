//
//  UIImage+Resizing.h
//  BlocQuery
//
//  Created by Roshan Mahanama on 8/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resizing)

+ (UIImage*)imageWithImage:(UIImage*)sourceImage scaledToWidth:(float)width;

@end
