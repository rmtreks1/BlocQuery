//
//  SecondViewController.m
//  BlocQuery
//
//  Created by Roshan Mahanama on 1/05/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "MyQuestionsViewController.h"
#import "Votes.h"

@interface MyQuestionsViewController ()

@end

@implementation MyQuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)testingVotesButton:(UIButton *)sender {
    NSString *answer = @"0W8ukxp9yW";
    NSString *question = @"TXz0ai8Y4J";
    NSString *user = @"TRVNT3z4DC";
    BOOL votes = true;
    
    [Votes voteforAnswer:answer toQuestion:question byUser:user];
}





- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"button pressed");
    
    UIImage *image = [UIImage imageNamed:@"talia.jpg"];
    NSData *imageData = UIImagePNGRepresentation(image);
    PFFile *imageFile = [PFFile fileWithName:@"sampleImage_talia.jpg" data:imageData];
    
    PFObject *samplePhoto = [PFObject objectWithClassName:@"samplePhoto"];
    samplePhoto[@"imageFile"] = imageFile;
    [samplePhoto saveInBackground];
}

@end
