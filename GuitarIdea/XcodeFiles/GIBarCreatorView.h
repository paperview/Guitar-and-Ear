//
//  GIBarCreatorView.h
//  GuitarIdea
//
//  Created by Phillip Pape on 6/12/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class GIBarCreatorView;

@protocol GIBarCreatorViewDelegate <NSObject>
@required

-(void)turnKeyIndexIntoArrayOfChords:(NSInteger)keyIndex fromSender:(GIBarCreatorView *)sender;
-(void)updateProperNoteArraysWithFirst:(NSInteger)selectedRowInFirstComponent second:(NSInteger)selectedRowInSecondComponent andThird:(NSInteger)selectedRowInThirdComponent;
-(void)playCurrentBar;
-(void)setTempoWithRowsOne:(NSInteger)firstRow two:(NSInteger)secondRow; //three:(NSInteger)thirdRow five:(NSInteger)fifthRow;
-(void)repeatTheCurrentBar;
-(void)newBarMethod;

-(void)returnToMainMenu;

-(void)arraysAreReadyForPlay;

@end

@interface GIBarCreatorView : UIView

@property (nonatomic, weak) id<GIBarCreatorViewDelegate> delegate;

@property (nonatomic, strong) NSArray *keyPickerViewChoices;
@property (nonatomic, strong) NSArray *minorChordsForPicker;
@property (nonatomic, strong) NSArray *arrayOfMajorSevenths;
@property (nonatomic, strong) NSArray *arrayOfMinorSevenths;




-(void)constructTheChordPickerViewWithChords:(NSArray *)chordProgressionArray fromRoot:(NSInteger)root;

-(void)updateBarDisplayWithFirst:(NSInteger)chordRow second:(NSInteger)quarterNoteRow andThird:(NSInteger)fractionsRow andWithKeyIndex:(NSInteger)keyIndex;
-(void)updateBarDisplayUsingTemporaryQuarterNoteArray:(NSMutableArray *)tempQuarter temporarySixteenthNoteArray:(NSMutableArray *)temp16th temporaryTripletArray:(NSMutableArray *)tempTrips andKeyIndex:(NSInteger)keyIndex andChordRow:(NSInteger)chordRow;

-(void)killNewBarOption;

@end
