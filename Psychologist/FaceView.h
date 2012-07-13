//
//  FaceView.h
//  Happiness
//
//  Created by Ravi Alla on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;//forward reference, telling compiler I am going to define the class FaceView later.

@protocol FaceViewDataSource
- (float) smileForFaceView:(FaceView *)sender; //has to implement this one method
@end

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;
- (void) pinch:(UIPinchGestureRecognizer *)gesture;

@property (nonatomic, weak) IBOutlet id <FaceViewDataSource> dataSource;

@end
