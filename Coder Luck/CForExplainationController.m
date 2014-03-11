//
//  CForExplainationController.m
//  Coder Luck
//
//  Created by Hongtao Cai on 12/29/13.
//  Copyright (c) 2013 Coder Inc. All rights reserved.
//

#import "CForExplainationController.h"

@interface CForExplainationController ()

@property (nonatomic, strong) NSArray *predictLabelArray;
@property (nonatomic, strong) NSArray *possiblePredicts;
@property NSUInteger aniCount;

@end

@implementation CForExplainationController

@synthesize predict1;
@synthesize predict2;
@synthesize predict3;
@synthesize predict4;
@synthesize predict5;
@synthesize predict6;
@synthesize predict7;
@synthesize predict8;
@synthesize predict9;
@synthesize predictLabelArray;
@synthesize aniCount;
@synthesize possiblePredicts;
@synthesize dateLabel;
@synthesize hourLabel;

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void) viewDidLoad
{
    UIColor *red = [UIColor redColor];
    UIColor *green = [UIColor colorWithRed:0.0f green:100.0f/255.0f blue:0.0f alpha:1.0f];
    [predict1 intializeWithTexts: @[@"大凶",@"凶",@"吉",@"大吉"] withPossibilities: @[@0.1,@0.4,@0.2,@0.3] withPossibleColors: @[red, red, green, green]];
    [predict2 intializeWithTexts: @[@"大凶",@"凶",@"吉",@"大吉"] withPossibilities: @[@0.1,@0.3,@0.2,@0.4] withPossibleColors: @[red, red, green, green]];
    [predict3 intializeWithTexts: @[@"大凶",@"凶",@"吉",@"大吉"] withPossibilities: @[@0.4,@0.2,@0.3,@0.1] withPossibleColors: @[red, red, green, green]];
    [predict4 intializeWithTexts: @[@"大凶",@"凶",@"吉",@"大吉"] withPossibilities: @[@0.3,@0.2,@0.4,@0.1] withPossibleColors: @[red, red, green, green]];
    [predict5 intializeWithTexts: @[@"大凶",@"凶",@"吉",@"大吉"] withPossibilities: @[@0.1,@0.2,@0.3,@0.4] withPossibleColors: @[red, red, green, green]];
    [predict6 intializeWithTexts: @[@"大凶",@"凶",@"吉",@"大吉"] withPossibilities: @[@0.1,@0.3,@0.2,@0.4] withPossibleColors: @[red, red, green, green]];
    [predict7 intializeWithTexts: @[@"大凶",@"凶",@"吉",@"大吉"] withPossibilities: @[@0.1,@0.2,@0.3,@0.4] withPossibleColors: @[red, red, green, green]];
    [predict8 intializeWithTexts: @[@"东南方",@"西南方",@"东北方",@"西北方"] withPossibilities: @[@0.25,@0.25,@0.25,@0.25] withPossibleColors: @[red, red, green, green]];
    [predict9 intializeWithTexts: @[@"Ruby",@"Javascript",@"iOS",@"Node.js",@"Hadoop",@"Photoshop",@"Android",@"R",@".Net",@"Python"] withPossibilities: @[@0.1,@0.1,@0.1,@0.1,@0.1,@0.1,@0.1,@0.1,@0.1,@0.1] withPossibleColors: @[red, red, green, green,red, green,red, green,red, green]];
    
    
    predictLabelArray = @[predict1, predict2, predict3, predict4, predict5, predict6, predict7, predict8, predict9];
    
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"公元yyyy年MM月dd日"];
    
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    dateLabel.text = dateString;
    
    NSArray *shichens = @[@"子",@"丑",@"寅",@"卯",@"辰",@"巳",@"午",@"未",@"申",@"酉",@"戌",@"亥"];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:currDate];
    NSInteger hour = [components hour];
    hourLabel.text = [NSString stringWithFormat: @"%@时", shichens[((hour+1)%24)/2] ];

    [super viewDidLoad];
    [self startAni];
}

- (void) startAni
{
    aniCount = 0;
    [self performSelector:@selector(updatePredictLabels) withObject:nil afterDelay:.1];
}

- (void) updatePredictLabels
{
    aniCount ++;
    if(aniCount>34) return;
    for(int i=0; i<[predictLabelArray count];i++){
        CForPredictUILabel *changeLabel =  (CForPredictUILabel *) (predictLabelArray[i]);
        [changeLabel generateNextText];
    }
    [self performSelector:@selector(updatePredictLabels) withObject:nil afterDelay:0.01*aniCount];
}




@end
