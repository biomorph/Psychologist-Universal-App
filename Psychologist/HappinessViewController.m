//
//  HappinessViewController.m
//  Happiness
//
//  Created by Ravi Alla on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"
@interface HappinessViewController()<FaceViewDataSource>
@property (nonatomic,weak) IBOutlet FaceView *faceView;
@property (nonatomic, weak) IBOutlet UIToolbar *toolbar;
@end

@implementation HappinessViewController

@synthesize happiness = _happiness;
@synthesize faceView = _faceView;
@synthesize splitViewBarButtonItem = _splitViewBarButtonItem;
@synthesize toolbar = _toolbar;

- (void) setSplitViewBarButtonItem:(UIBarButtonItem *)splitViewBarButtonItem {
    if (_splitViewBarButtonItem != splitViewBarButtonItem){
        NSMutableArray *toolbarItems = [self.toolbar.items mutableCopy];
        if (_splitViewBarButtonItem)[toolbarItems removeObject:_splitViewBarButtonItem];
        if (splitViewBarButtonItem) [toolbarItems insertObject:splitViewBarButtonItem atIndex:0];
        self.toolbar.items = toolbarItems;
        _splitViewBarButtonItem = splitViewBarButtonItem;
        
    }
}


- (void)setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceView setNeedsDisplay];
}

-(void) setFaceView:(FaceView *)faceView
{
    _faceView = faceView;
    
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc]initWithTarget:self.faceView action:@selector(pinch:)]];//adding pinch recognizor
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleHappinessGesture:)]];//adding pinch recognizor

    self.faceView.dataSource = self;
}

- (void) handleHappinessGesture:(UIPanGestureRecognizer *) gesture
{
        if ((gesture.state==UIGestureRecognizerStateChanged)||
            (gesture.state==UIGestureRecognizerStateEnded)){
            CGPoint translation = [gesture translationInView:self.faceView];
            self.happiness = self.happiness - (translation.y/2);
            [gesture setTranslation:CGPointZero inView:self.faceView];
        }
}

- (float) smileForFaceView:(FaceView *)sender
{
    return (self.happiness - 50)/50.0;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
@end