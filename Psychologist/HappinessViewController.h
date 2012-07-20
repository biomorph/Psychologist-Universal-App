//
//  HappinessViewController.h
//  Happiness
//
//  Created by Ravi Alla on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitViewBarButtonItemPresenter.h"

@interface HappinessViewController : UIViewController <SplitViewBarButtonItemPresenter>

@property(nonatomic) int happiness; //0 is sad,  100 is very happy: this is the model

@end
