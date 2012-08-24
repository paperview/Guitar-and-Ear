//
//  GIViewController.h
//  GuitarIdea
//
//  Created by Phillip Pape on 6/12/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import "GIBarCreatorView.h"

@class GIViewController;

@protocol GIBarViewControllerDelegate <NSObject>
@required

-(void)passArraysAlongToSoloView:(NSMutableArray *)quarters :(NSMutableArray *)sixteenths :(NSMutableArray *)triplets withKeyIndex:(NSInteger)keyIndex;
-(void)passTempo:(float)tempo;

-(void)passStringsForSoloAnalyzer:(NSMutableArray *)qStrings :(NSMutableArray *)sStrings :(NSMutableArray *)tStrings withKeyIndex:(NSInteger)keyIndex;
-(void)returnFromBar;

-(void)passNumberOfBarsForOptionsBlocker:(int)numberOfBars;

@end
@interface GIViewController : UIViewController

@property (nonatomic, weak) id<GIBarViewControllerDelegate> viewControllerDelegate;

@property (nonatomic, strong) NSMutableArray *quarterNoteArrayOfEmptyAudioPlayers;
@property (nonatomic, strong) NSMutableArray *sixteenthNoteArrayOfEmptyAudioPlayers;
@property (nonatomic, strong) NSMutableArray *tripletNoteArrayOfEmptyAudioPlayers;

@property (nonatomic, strong) NSMutableArray *qArrayOfStringsForSoloAnalyzer;
@property (nonatomic, strong) NSMutableArray *sArrayOfStringsForSoloAnalyzer;
@property (nonatomic, strong) NSMutableArray *tArrayOfStringsForSoloAnalyzer;

@property (nonatomic, assign) BOOL quickPlayActive;

@property (nonatomic, assign) NSInteger currentKeyIndex;


@property (nonatomic, strong) NSMutableArray *temporaryQuarterNoteArrayOfEmptyAudioPlayers;

@property (nonatomic, strong) NSMutableArray *temporarySixteenthNoteArrayOfEmptyAudioPlayers;

@property (nonatomic, strong) NSMutableArray *temporaryTripletNoteArrayOfEmptyAudioPlayers;

-(void)turnKeyIndexIntoArrayOfChords:(NSInteger)keyIndex fromSender:(GIBarCreatorView *)sender;

-(void)updateProperNoteArraysWithFirst:(NSInteger)selectedRowInFirstComponent second:(NSInteger)selectedRowInSecondComponent andThird:(NSInteger)selectedRowInThirdComponent;

-(void)arraysAreReadyForPlay;

-(void)newBarMethod;


@end
