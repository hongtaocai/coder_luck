//
//  CForViewController.m
//  Coder Luck
//
//  Created by Hongtao Cai on 12/28/13.
//  Copyright (c) 2013 Coder Inc. All rights reserved.
//

#import "CForViewController.h"
#import "CForExplainationController.h"

@interface CForViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) NSUInteger add;

@property (nonatomic) NSUInteger topIndex;
@property (nonatomic) NSUInteger prevTopIndex;
@property (nonatomic, strong)  NSArray *imageArray;

@end

@implementation CForViewController

@synthesize shakingText;
@synthesize timer;
@synthesize pictop1;
@synthesize pictop2;
@synthesize imageArray;

- (void)viewDidLoad
{
    self.add = 0;
    imageArray = @[[UIImage imageNamed:@"pic1.jpg"],
                   [UIImage imageNamed:@"pic2.jpg"],
                   [UIImage imageNamed:@"pic3.jpg"],
                   [UIImage imageNamed:@"pic4.jpg"]];
    pictop1.image = imageArray[0];
    pictop2.image = imageArray[0];
    self.topIndex = 0;
    self.prevTopIndex = 0;
    self.timer = [NSTimer timerWithTimeInterval:5.0
                                         target:self
                                       selector:@selector(onTimer)
                                       userInfo:nil
                                        repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [self becomeFirstResponder];
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void) viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
    
    [super viewWillDisappear:animated];
    
    
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        // Put in code here to handle shake
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                                 bundle: nil];
        
        CForExplainationController *controller = (CForExplainationController*)[mainStoryboard
                                                           instantiateViewControllerWithIdentifier: @"CForExplainationControllerID"];
        [self.navigationController pushViewController:controller animated:YES];
        
    }
    
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)onTimer{
    if(self.add %2 == 0){
        [UIView animateWithDuration:0.7 animations:^
         {
             pictop2.alpha = 0.0;
         }];
        
        pictop2.image = [self.imageArray objectAtIndex:self.prevTopIndex];
        pictop1.image = [self.imageArray objectAtIndex:self.topIndex];
    }else{
        [UIView animateWithDuration:0.7 animations:^
         {
             pictop2.alpha = 1.0;
         }];
        pictop2.image = [self.imageArray objectAtIndex:self.topIndex];
        pictop1.image = [self.imageArray objectAtIndex:self.prevTopIndex];
    }
    self.add = (self.add+1)%2;
    self.prevTopIndex = self.topIndex;
    if(self.topIndex == [self.imageArray count]-1){
        self.topIndex = 0;
    }else{
        self.topIndex++;
    }
}


@end
