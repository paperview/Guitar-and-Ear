//
//  GIIntervalTrainingViewController.h
//  GuitarIdea
//
//  Created by Phillip Pape on 6/29/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import "GITrainingView.h"
#import "GIGuitarSource.h"
#import "GITempoConstructs.h"
#import "GIScaleSelector.h"
@class GIIntervalTrainingViewController;
@protocol GIIntervalProtocal <NSObject>
@required

-(void)returnFromInterval;

@end

@interface GIIntervalTrainingViewController : UIViewController

@property (nonatomic, weak) id<GIIntervalProtocal>intervalDelegate;

@end
