//
//  GISoloViewController.h
//  GuitarIdea
//
//  Created by Phillip Pape on 6/17/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import "GIChroma.h"
#import "GIChordLibrary.h"
#import "GIScaleSelector.h"

@class UIViewController;
@protocol GISoloViewProtocol <NSObject>
@required

-(void)returnFromSoloView;
-(void)saveTheArraysWithBackingArray:(NSArray *)backing quarterSoloArray:(NSArray *)quarterSolo andEighthSoloArray:(NSArray *)eighthSolo;
-(void)saveTheTempo:(float)tempoSave;

@end



@interface GISoloViewController : UIViewController

@property (nonatomic, weak) id<GISoloViewProtocol>soloDelegate;

-(void)arraysHaveBeenLoadedWith:(NSMutableArray *)backing :(NSMutableArray *)quarters :(NSMutableArray *)eighths;

//-(void)playSoloAlgorithmWithArrays:(NSMutableArray *)quartersArray :(NSMutableArray *)sixteenthsArray :(NSMutableArray *)tripletsArray andKeyIndex:(NSInteger)keyIndex;
-(void)playSoloBackingWithArrays:(NSMutableArray *)quartersArray; // this is only backing track
// handle key index aka color modification elsewhere

-(void)setUpBackingArraysWith:(NSMutableArray *)q with:(NSMutableArray *)s with:(NSMutableArray *)t;
-(void)setTempoForSoloAlgorithm:(float)tempoHere;

-(void)setUpArraysOfStringsForAnalysis:(NSMutableArray *)qArray with:(NSMutableArray *)sArray with:(NSMutableArray *)tArray withKeyIndex:(NSInteger)keyIndex;
-(void)soloTimersAndColorsAlgorithmWithArraysOfStrings:(NSMutableArray *)qStringsArray :(NSMutableArray *)sStringsArray :(NSMutableArray *)tStringsArray;

-(void)setUpBlockerTimerWithNumberOfBars:(int)numberOfBars;

@end
