//
//  CForPredictUILabel.m
//  Coder Luck
//
//  Created by Hongtao Cai on 12/30/13.
//  Copyright (c) 2013 Coder Inc. All rights reserved.
//

#import "CForPredictUILabel.h"

@interface CForPredictUILabel ()
{
    double possiblities[20];
}

@property (nonatomic, strong) NSMutableArray *possibleTexts;
@property (nonatomic, strong) NSMutableArray *possibleColors;


@end

@implementation CForPredictUILabel

@synthesize possibleTexts;
@synthesize possibleColors;



- (void) intializeWithTexts: (NSArray *) pT withPossibilities: (NSArray *) p withPossibleColors:(id)colors
{
    if([pT count]!=[p count] || [pT count]!= [colors count] || [pT count]<=1 || [pT count]>20){
        NSLog(@"Bad Initializer for labels");
        return;
    }
    NSNumber *sum = [NSNumber numberWithDouble:0.0];
    for(NSNumber *number in p){
        if([number doubleValue]< 0){
             NSLog(@"Label possibility cant be negative");
            return;
        }
        sum = [NSNumber numberWithDouble:
               ([sum doubleValue] + [number doubleValue])];
    }
    if([sum doubleValue]==0){
        NSLog(@"Label possibility cant be all zero");
        return;
    }
    
    possibleTexts = [NSMutableArray arrayWithArray: pT];
    possibleColors = [NSMutableArray arrayWithArray:colors];
    
    for(int i=0;i<[p count];i++){
        possiblities[i] =  [p[i] doubleValue]/[sum doubleValue];
    }
}

- (void) generateNextText
{
    double a = (double) (arc4random()%1000) / 1000;
    int max = [possibleTexts count];
    for(int i=0;i<max;i++){
        if(a-possiblities[i]<0){
            self.text = possibleTexts[i];
            self.textColor = possibleColors[i];
            return;
        }else{
            a -= possiblities[i];
        }
    }
    self.text = possibleTexts[max-1];
    self.textColor = possibleColors[max-1];
}

@end
