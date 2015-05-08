//
//  UIImage+Resizing.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 8/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "UIImage+Resizing.h"

@implementation UIImage (Resizing)


+ (UIImage*)imageWithImage:(UIImage*)sourceImage scaledToWidth:(float)width
{
    float oldWidth = sourceImage.size.width;
    float scaleFactor = width / oldWidth;
    
    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
