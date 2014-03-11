//
//  CForPredictUILabel.h
//  Coder Luck
//
//  Created by Hongtao Cai on 12/30/13.
//  Copyright (c) 2013 Coder Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CForPredictUILabel : UILabel

- (void) intializeWithTexts: (NSArray *) pT withPossibilities: (NSArray *) p withPossibleColors: colors;
- (void) generateNextText;

@end
