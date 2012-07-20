//
//  RotatableViewController.m
//  Psychologist
//
//  Created by Ravi Alla on 7/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RotatableViewController.h"
#import "SplitViewBarButtonItemPresenter.h"

@interface RotatableViewController ()

@end

@implementation RotatableViewController

- (void) awakeFromNib {
    [super awakeFromNib];
    self.splitViewController.delegate = self;
}

- (id <SplitViewBarButtonItemPresenter>) SplitViewBarButtonItemPresenter
{
    id detailVC = [self.splitViewController.viewControllers lastObject];
    if (![detailVC conformsToProtocol:@protocol(SplitViewBarButtonItemPresenter)]) {
        detailVC = nil;
    }
return detailVC;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (BOOL)splitViewController:(UISplitViewController *)svc 
   shouldHideViewController:(UIViewController *)vc 
              inOrientation:(UIInterfaceOrientation)orientation 
{
    BOOL buttonDance;
    if (![self SplitViewBarButtonItemPresenter])
    buttonDance = NO;
    else if ([self SplitViewBarButtonItemPresenter] && UIInterfaceOrientationIsPortrait(orientation)){
        buttonDance = YES;
    }
    return buttonDance;
}

- (void) splitViewController:(UISplitViewController *)svc 
      willHideViewController:(UIViewController *)aViewController 
           withBarButtonItem:(UIBarButtonItem *)barButtonItem 
        forPopoverController:(UIPopoverController *)pc 
{
    barButtonItem.title = @"Psychologist";
    [self SplitViewBarButtonItemPresenter].splitViewBarButtonItem = barButtonItem;

}

- (void) splitViewController:(UISplitViewController *)svc 
      willShowViewController:(UIViewController *)aViewController 
   invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem 
{
    [self SplitViewBarButtonItemPresenter].splitViewBarButtonItem = nil;
}

@end

