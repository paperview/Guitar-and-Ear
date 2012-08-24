//
//  GIMainMenuViewController.h
//  GuitarIdea
//
//  Created by Phillip Pape on 7/1/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@class GIMainMenuViewController;
@protocol GIMainMenuProtocol <NSObject>
@required

-(void)intervalGameViewSelected;

-(void)barModeViewSelected;

-(void)loadTheArrays;

-(void)quickPlaySummons;

@end

@interface GIMainMenuViewController : UIViewController


@property (nonatomic, weak) id<GIMainMenuProtocol> mainMenuDelegate;

@end
