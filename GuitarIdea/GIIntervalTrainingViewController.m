//
//  GIIntervalTrainingViewController.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/29/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GIIntervalTrainingViewController.h"

#define degreesToRadian(x) (M_PI * (x) / 180.0)

@interface GIIntervalTrainingViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) GIScaleSelector *scaleSelector;

@property (nonatomic, strong) CALayer *lowEStringGraphic;
@property (nonatomic, strong) CALayer *aStringGraphic;
@property (nonatomic, strong) CALayer *dStringGraphic;
@property (nonatomic, strong) CALayer *buttonBarLayerOne;
@property (nonatomic, strong) CALayer *buttonBarLayerTwo;
@property (nonatomic, strong) NSArray *colorArray;

@property (nonatomic, strong) CATextLayer *successRatio;
@property (nonatomic, strong) CATextLayer *choiceOneTracker;
@property (nonatomic, strong) CATextLayer *choiceTwoTracker;
@property (nonatomic, strong) CATextLayer *choiceThreeTracker;

@property (nonatomic, strong) CATextLayer *resultScreen;
@property (nonatomic, strong) CATextLayer *bannerOfShameOrPraise;

@property (nonatomic, strong) NSArray *arrayOfNoteStrings;
@property (nonatomic, strong) NSArray *ionianArrayOfNoteStrings;
@property (nonatomic, strong) NSArray *dorianArray;
@property (nonatomic, strong) NSArray *phrygianArray;
@property (nonatomic, strong) NSArray *lydianArray;
@property (nonatomic, strong) NSArray *mixolydianArray;
@property (nonatomic, strong) NSArray *aeolianArray;
@property (nonatomic, strong) NSArray *locrianArray;

@property (nonatomic, assign) int chosenScale;

@property (nonatomic, assign) int chosenIndexOne;
@property (nonatomic, assign) int chosenIndexTwo;

@property (nonatomic, assign) int userSelectionOne;
@property (nonatomic, assign) int userSelectionTwo;

@property (nonatomic, assign) BOOL isInMiddleOfTurn;

@property (nonatomic, assign) BOOL isFirstSelection;

@property (nonatomic, strong) AVAudioPlayer *rootPlayer;
@property (nonatomic, strong) AVAudioPlayer *indexOnePlayer;
@property (nonatomic, strong) AVAudioPlayer *indexTwoPlayer;

@property (nonatomic, strong) AVAudioPlayer *playItem;
@property (nonatomic, strong) AVAudioPlayer *secondPlayItem;
@property (nonatomic, strong) AVAudioPlayer *thirdPlayItem;
@property (nonatomic, assign) BOOL playItemInPlay;
@property (nonatomic, assign) BOOL secondItemInPLay;

@property (nonatomic, strong) NSMutableArray *arrayOfCorrectIntervals;
@property (nonatomic, strong) NSMutableArray *arrayOfChoices;

@property (nonatomic, assign) double successes;
@property (nonatomic, assign) int attempts;

@property (nonatomic, strong) UIButton *buttonForExitOfDisplay;

@property (nonatomic, assign) int choiceCounter;

@property (nonatomic, strong) UIPickerView *pickerViewOfScales;
@property (nonatomic, strong) NSArray *pickerViewArrayOfScaleNames;
@property (nonatomic, strong) UIButton *logScaleButton;
@property (nonatomic, strong) UIView *blurWhileLoggingScale;

@property (nonatomic, strong) NSMutableDictionary *intervalButtonDictionary;
@property (nonatomic, strong) NSMutableDictionary *titleForButtonDictionary;
@property (nonatomic, strong) NSMutableDictionary *intervalLayerDicionary;

@end

@implementation GIIntervalTrainingViewController

@synthesize intervalDelegate;

@synthesize scaleSelector;
@synthesize lowEStringGraphic;
@synthesize aStringGraphic;
@synthesize dStringGraphic;
@synthesize buttonBarLayerOne;
@synthesize buttonBarLayerTwo;
@synthesize colorArray;
@synthesize arrayOfNoteStrings;
@synthesize resultScreen;
@synthesize chosenScale;
@synthesize chosenIndexOne;
@synthesize chosenIndexTwo;
@synthesize isInMiddleOfTurn;
@synthesize isFirstSelection;
@synthesize rootPlayer;
@synthesize indexOnePlayer;
@synthesize indexTwoPlayer;
@synthesize playItem;
@synthesize secondPlayItem;
@synthesize playItemInPlay;
@synthesize userSelectionOne;
@synthesize userSelectionTwo;
@synthesize successRatio;
@synthesize arrayOfCorrectIntervals;
@synthesize arrayOfChoices;
@synthesize successes;
@synthesize attempts;
@synthesize buttonForExitOfDisplay;
@synthesize choiceCounter;
@synthesize bannerOfShameOrPraise;
@synthesize secondItemInPLay;
@synthesize thirdPlayItem;
@synthesize choiceOneTracker;
@synthesize choiceTwoTracker;
@synthesize choiceThreeTracker;
@synthesize pickerViewOfScales;
@synthesize pickerViewArrayOfScaleNames;
@synthesize logScaleButton;
@synthesize blurWhileLoggingScale;
@synthesize intervalButtonDictionary;
@synthesize titleForButtonDictionary;
@synthesize ionianArrayOfNoteStrings;
@synthesize intervalLayerDicionary;
@synthesize dorianArray;
@synthesize phrygianArray;
@synthesize lydianArray;
@synthesize mixolydianArray;
@synthesize aeolianArray;
@synthesize locrianArray;

- (id)init{
    
    if (self = [super init]) {
        
        self.colorArray = [NSArray arrayWithObjects:[UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1], [UIColor colorWithRed:1 green:0.25 blue:0.05 alpha:0.9], [UIColor colorWithRed:1 green:.4 blue:0 alpha:1], [UIColor colorWithRed:1 green:.6 blue:0 alpha:.9], [UIColor colorWithRed:1 green:1 blue:0 alpha:1], [UIColor colorWithRed:.5 green:1 blue:0 alpha:1],/*tritone:*/ [UIColor colorWithRed:0.1 green:1 blue:0.1 alpha:.8],  [UIColor colorWithRed:0 green:1 blue:1 alpha:1], [UIColor colorWithRed:0 green:.7 blue:1 alpha:.9], [UIColor colorWithRed:0 green:0 blue:1 alpha:1], [UIColor colorWithRed:.6 green:0 blue:.9 alpha:.9], [UIColor colorWithRed:.5 green:0 blue:.7 alpha:1], nil];
        
        self.scaleSelector = [[GIScaleSelector alloc] init];
     
        self.pickerViewOfScales = [[UIPickerView alloc] init];
        self.pickerViewOfScales.delegate = self;
        self.pickerViewOfScales.dataSource = self;
        [self.pickerViewOfScales setFrame:CGRectMake(200, 105, 280, 240)];
        self.pickerViewOfScales.showsSelectionIndicator = YES;
        
        self.pickerViewArrayOfScaleNames = [[NSArray alloc] initWithObjects:@"Chromatic", @"Ionian (Major)", @"Dorian", @"Phrygian", @"Lydian", @"Mixolydian", @"Aeolian (Natural Minor)", @"Locrian", nil];
        
        self.logScaleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.logScaleButton.frame = CGRectMake(200, 0, 280, 105);
        [self.logScaleButton setBackgroundImage:[UIImage imageNamed:@"GIIntervalLogScale.png"] forState:UIControlStateNormal];
    //    self.logScaleButton.backgroundColor = [UIColor grayColor];
    //    [self.logScaleButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:40]];
    //    [self.logScaleButton.titleLabel setTextColor:[UIColor whiteColor]];
    //    [self.logScaleButton setTitle:@"Log Scale" forState:UIControlStateNormal];
        [self.logScaleButton setBackgroundImage:[UIImage imageNamed:@"GIIntervalLogScaleH.png"] forState:UIControlStateHighlighted];
        [self.logScaleButton addTarget:self action:@selector(logScale) forControlEvents:UIControlEventTouchUpInside];
        
        self.blurWhileLoggingScale = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 320)];
        self.blurWhileLoggingScale.backgroundColor = [UIColor whiteColor];
        self.blurWhileLoggingScale.alpha = 0.5f;
        
        self.lowEStringGraphic = [CALayer layer];
        self.lowEStringGraphic.frame = CGRectMake(0, 234, 480, 7);
        self.lowEStringGraphic.backgroundColor = [UIColor grayColor].CGColor;
        self.lowEStringGraphic.shadowOffset = CGSizeMake(0, 2);
        self.lowEStringGraphic.shadowRadius = 1.5;
        self.lowEStringGraphic.shadowColor = [UIColor blackColor].CGColor;
        self.lowEStringGraphic.shadowOpacity = 0.7;
        
        self.aStringGraphic = [CALayer layer];
        self.aStringGraphic.frame = CGRectMake(0, 147, 480, 7);
        self.aStringGraphic.backgroundColor = [UIColor grayColor].CGColor;
        self.aStringGraphic.shadowOffset = CGSizeMake(0, 2);
        self.aStringGraphic.shadowRadius = 1.5;
        self.aStringGraphic.shadowColor = [UIColor blackColor].CGColor;
        self.aStringGraphic.shadowOpacity = 0.7;
        
        self.dStringGraphic = [CALayer layer];
        self.dStringGraphic.frame = CGRectMake(0, 60, 480, 7);
        self.dStringGraphic.backgroundColor = [UIColor grayColor].CGColor;
        self.dStringGraphic.shadowOffset = CGSizeMake(0, 2);
        self.dStringGraphic.shadowRadius = 1.5;
        self.dStringGraphic.shadowColor = [UIColor blackColor].CGColor;
        self.dStringGraphic.shadowOpacity = 0.7;
        
        self.buttonBarLayerOne = [CALayer layer];
        self.buttonBarLayerOne.backgroundColor = [UIColor lightGrayColor].CGColor;
        self.buttonBarLayerOne.frame = CGRectMake(0, 0, 40, 320);
        self.buttonBarLayerOne.shadowOffset = CGSizeMake(0, 3);
        self.buttonBarLayerOne.shadowRadius = 5.0;
        self.buttonBarLayerOne.shadowColor = [UIColor blackColor].CGColor;
        self.buttonBarLayerOne.shadowOpacity = 0.8;
        
        self.buttonForExitOfDisplay = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonForExitOfDisplay.frame = CGRectMake(0, 0, 480, 320);
        self.buttonForExitOfDisplay.backgroundColor = [UIColor clearColor];
        self.buttonForExitOfDisplay.alpha = 0.1;
        [self.buttonForExitOfDisplay addTarget:self action:@selector(exitDisplay) forControlEvents:UIControlEventTouchUpInside];
        
     /*  UIButton *scale = [UIButton buttonWithType:UIButtonTypeCustom];
        scale.frame = CGRectMake(410, 0, 70, 67);
        scale.backgroundColor = [UIColor grayColor];
        [scale.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
        [scale.titleLabel setTextColor:[UIColor whiteColor]];
        [scale setTitle:@"" forState:UIControlStateNormal];
        [scale addTarget:self action:@selector(intervalButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        [scale setBackgroundImage:highlighter forState:UIControlStateHighlighted];*/
        

        
        self.arrayOfNoteStrings = [NSArray arrayWithObjects:@"R", @"m2", @"2", @"m3", @"3", @"P4", @"tt", @"P5", @"m6", @"6", @"m7", @"7", nil];
        self.ionianArrayOfNoteStrings = [NSArray arrayWithObjects:@"R", @"2", @"3", @"P4", @"P5", @"6", @"7", nil];
        self.dorianArray = [NSArray arrayWithObjects:@"R", @"2", @"m3", @"P4", @"P5", @"6", @"m7", nil];
        self.phrygianArray = [NSArray arrayWithObjects:@"R", @"m2", @"m3", @"P4", @"P5", @"m6", @"m7", nil];
        self.lydianArray = [NSArray arrayWithObjects:@"R", @"2", @"3", @"tt", @"P5", @"6", @"7", nil];
        self.mixolydianArray = [NSArray arrayWithObjects:@"R", @"2", @"3", @"P4", @"P5", @"6", @"m7", nil];
        self.aeolianArray = [NSArray arrayWithObjects:@"R", @"2", @"m3", @"P4", @"P5", @"m6", @"m7", nil];
        self.locrianArray = [NSArray arrayWithObjects:@"R", @"m2", @"m3", @"P4", @"tt", @"m6", @"m7", nil];
        
        self.isInMiddleOfTurn = NO;
        
        self.isFirstSelection = YES;
        
        self.playItemInPlay = NO;
        self.secondItemInPLay = NO;
        
        self.arrayOfChoices = [[NSMutableArray alloc] init];
        self.arrayOfCorrectIntervals = [[NSMutableArray alloc] init];
        
        self.successes = 0;
        self.attempts = 0;
        
        self.choiceCounter = 0;
        
        self.intervalButtonDictionary = [[NSMutableDictionary alloc] init];
        self.titleForButtonDictionary = [[NSMutableDictionary alloc] init];
        self.intervalLayerDicionary = [[NSMutableDictionary alloc] init];
        
        
    }
    return self;
    
}

-(void)loadView{
    
    

    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    self.view.transform = CGAffineTransformIdentity;
    self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(90));
    self.view.bounds = CGRectMake(0.0, 0.0, 480, 320);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    backgroundImage.alpha = 1;
    backgroundImage.image = [UIImage imageNamed:@"GIIntervalBackground.png"];
    [self.view addSubview:backgroundImage];
    
    
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    frame.origin.y = 0;
    
    for (int i = 90; i < 480; i+=80) {
        CALayer *fretLayer = [CALayer layer];
        fretLayer.frame = CGRectMake(i, 0, 10, 250);
        fretLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.view.layer addSublayer:fretLayer];
    }

    
    [self.view.layer addSublayer:self.lowEStringGraphic];
    [self.view.layer addSublayer:self.aStringGraphic];
    [self.view.layer addSublayer:self.dStringGraphic];

    [self.view.layer addSublayer:self.buttonBarLayerOne];
    
    UIImageView *barGloss = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GIIntervalBar.png"]];
    barGloss.frame = CGRectMake(0, 0, 40, 320);
    [self.view addSubview:barGloss];

    
    
    for (int i = 0; i < 4; i ++) {
        
    CALayer *circleLayer = [CALayer layer];
    circleLayer.backgroundColor = [[self.colorArray objectAtIndex:i] CGColor];
    //[circleLayer setCornerRadius:30.0f];
    [circleLayer setBounds:CGRectMake(0, 0, 60.0f, 60.0f)];
    circleLayer.position = CGPointMake(215 + i*80, 240);
    circleLayer.shadowOffset = CGSizeMake(0, 2);
    circleLayer.shadowRadius = 4.0;
    circleLayer.shadowColor = [UIColor blackColor].CGColor;
    circleLayer.shadowOpacity = 0.7;
    circleLayer.opacity = .65;
    
    [self.intervalLayerDicionary setObject:circleLayer forKey:[self.arrayOfNoteStrings objectAtIndex:i]];
    [self.view.layer addSublayer:circleLayer];
    }
    

    for (int i = 0; i < 5; i ++) {
        
        CALayer *circleLayer = [CALayer layer];
        circleLayer.backgroundColor = [[self.colorArray objectAtIndex:i + 4] CGColor];
        //[circleLayer setCornerRadius:30.0f];
        [circleLayer setBounds:CGRectMake(0, 0, 60.0f, 60.0f)];
        circleLayer.position = CGPointMake(135 + i*80, 150);
        circleLayer.shadowOffset = CGSizeMake(0, 2);
        circleLayer.shadowRadius = 4.0;
        circleLayer.shadowColor = [UIColor blackColor].CGColor;
        circleLayer.shadowOpacity = 0.7;
        circleLayer.opacity = .65;
        
        [self.intervalLayerDicionary setObject:circleLayer forKey:[self.arrayOfNoteStrings objectAtIndex:i+4]];
        [self.view.layer addSublayer:circleLayer];
    }
    
    for (int i = 0; i < 3; i ++) {
        
        CALayer *circleLayer = [CALayer layer];
        circleLayer.backgroundColor = [[self.colorArray objectAtIndex:i + 9] CGColor];
        //[circleLayer setCornerRadius:30.0f];
        [circleLayer setBounds:CGRectMake(0, 0, 60.0f, 60.0f)];
        circleLayer.position = CGPointMake(135 + i*80, 60);
        circleLayer.shadowOffset = CGSizeMake(0, 2);
        circleLayer.shadowRadius = 4.0;
        circleLayer.shadowColor = [UIColor blackColor].CGColor;
        circleLayer.shadowOpacity = 0.7;
        circleLayer.opacity = .65;
        
        [self.intervalLayerDicionary setObject:circleLayer forKey:[self.arrayOfNoteStrings objectAtIndex:i+9]];
        [self.view.layer addSublayer:circleLayer];
    }
    
    
    CATextLayer *rootText = [CATextLayer layer];
    rootText.backgroundColor = [UIColor clearColor].CGColor;
    rootText.foregroundColor = [UIColor whiteColor].CGColor;
    rootText.opacity = .2;
    rootText.alignmentMode = kCAAlignmentCenter;
    //[textLayer setCornerRadius:16.0f];
    [rootText setFont:@"STHeitiTC-Medium"];
    [rootText setFontSize:30];
    [rootText setBounds:CGRectMake(0, 0, 32.0f, 32.0f)];
    rootText.position = CGPointMake(215, 240);
    rootText.string = @"R";
    rootText.wrapped = NO;
    [self.view.layer addSublayer:rootText];
    [self.titleForButtonDictionary setObject:rootText forKey:rootText.string];
    
    CATextLayer *m2Text = [CATextLayer layer];
    m2Text.backgroundColor = [UIColor clearColor].CGColor;
    m2Text.foregroundColor = [UIColor whiteColor].CGColor;
    m2Text.opacity = .2;
    m2Text.alignmentMode = kCAAlignmentCenter;
    //[textLayer setCornerRadius:16.0f];
    [m2Text setFont:@"STHeitiTC-Medium"];
    [m2Text setFontSize:30];
    [m2Text setBounds:CGRectMake(0, 0, 50.0f, 32.0f)];
    m2Text.position = CGPointMake(215 + 80, 240);
    m2Text.string = @"m2";
    m2Text.wrapped = NO;
    [self.view.layer addSublayer:m2Text];
    [self.titleForButtonDictionary setObject:m2Text forKey:m2Text.string];
    
    CATextLayer *maj2Text = [CATextLayer layer];
    maj2Text.backgroundColor = [UIColor clearColor].CGColor;
    maj2Text.foregroundColor = [UIColor whiteColor].CGColor;
    maj2Text.opacity = .2;
    maj2Text.alignmentMode = kCAAlignmentCenter;
    //[textLayer setCornerRadius:16.0f];
    [maj2Text setFont:@"STHeitiTC-Medium"];
    [maj2Text setFontSize:30];
    [maj2Text setBounds:CGRectMake(0, 0, 50.0f, 32.0f)];
    maj2Text.position = CGPointMake(375, 240);
    maj2Text.string = @"2";
    maj2Text.wrapped = NO;
    [self.view.layer addSublayer:maj2Text];
    [self.titleForButtonDictionary setObject:maj2Text forKey:maj2Text.string];
    
    CATextLayer *m3Text = [self drawText];
    m3Text.string = @"m3";
    m3Text.position = CGPointMake(455, 240);
    [self.view.layer addSublayer:m3Text];
    [self.titleForButtonDictionary setObject:m3Text forKey:m3Text.string];
    
    CATextLayer *maj3Text = [self drawText];
    maj3Text.string = @"3";
    maj3Text.position = CGPointMake(135, 150);
    [self.view.layer addSublayer:maj3Text];
    [self.titleForButtonDictionary setObject:maj3Text forKey:maj3Text.string];
    
    CATextLayer *p4Text = [self drawText];
    p4Text.string = @"P4";
    p4Text.position = CGPointMake(135 + 80, 150);
    [self.view.layer addSublayer:p4Text];
    [self.titleForButtonDictionary setObject:p4Text forKey:p4Text.string];
    
    CATextLayer *ttText = [self drawText];
    ttText.string = @"tt";
    ttText.position = CGPointMake(295, 150);
    [self.view.layer addSublayer:ttText];
    [self.titleForButtonDictionary setObject:ttText forKey:ttText.string];
    
    CATextLayer *p5Text = [self drawText];
    p5Text.string = @"P5";
    p5Text.position = CGPointMake(375, 150);
    [self.view.layer addSublayer:p5Text];
    [self.titleForButtonDictionary setObject:p5Text forKey:p5Text.string];
    
    CATextLayer *m6Text = [self drawText];
    m6Text.string = @"m6";
    m6Text.position = CGPointMake(455, 150);
    [self.view.layer addSublayer:m6Text];
    [self.titleForButtonDictionary setObject:m6Text forKey:m6Text.string];
    
    CATextLayer *maj6Text = [self drawText];
    maj6Text.string = @"6";
    maj6Text.position = CGPointMake(135, 60);
    [self.view.layer addSublayer:maj6Text];
    [self.titleForButtonDictionary setObject:maj6Text forKey:maj6Text.string];
    
    CATextLayer *m7Text = [self drawText];
    m7Text.string = @"m7";
    m7Text.position = CGPointMake(135 + 80, 60);
    [self.view.layer addSublayer:m7Text];
    [self.titleForButtonDictionary setObject:m7Text forKey:m7Text.string];
    
    CATextLayer *maj7Text = [self drawText];
    maj7Text.string = @"7";
    maj7Text.position = CGPointMake(295, 60);
    [self.view.layer addSublayer:maj7Text];
    [self.titleForButtonDictionary setObject:maj7Text forKey:maj7Text.string];
    
    UIButton *playSound = [UIButton buttonWithType:UIButtonTypeCustom];
    playSound.frame = CGRectMake(0, 20, 40, 130);
    [playSound setBackgroundImage:[UIImage imageNamed:@"GIIntervalPlay.png"] forState:UIControlStateNormal];
 //   playSound.backgroundColor = [UIColor grayColor];
 //   [playSound.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
 //   [playSound.titleLabel setTextColor:[UIColor whiteColor]];
 //   [playSound setTitle:@"|>" forState:UIControlStateNormal];
    [playSound addTarget:self action:@selector(playButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [playSound setBackgroundImage:[UIImage imageNamed:@"GIIntervalPlayH.png"] forState:UIControlStateHighlighted];
    
    UIButton *exit = [UIButton buttonWithType:UIButtonTypeCustom];
    exit.frame = CGRectMake(0, 170, 40, 130);
    [exit setBackgroundImage:[UIImage imageNamed:@"GIIntervalSound.png"] forState:UIControlStateNormal];
 //   exit.backgroundColor = [UIColor grayColor];
//    [exit.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
//    [exit.titleLabel setTextColor:[UIColor whiteColor]];
//    [exit setTitle:@"<-" forState:UIControlStateNormal];
    [exit addTarget:self action:@selector(exitPushed) forControlEvents:UIControlEventTouchUpInside];
    [exit setBackgroundImage:[UIImage imageNamed:@"GIIntervalSoundH.png"] forState:UIControlStateHighlighted];
    
    UIButton *scale = [UIButton buttonWithType:UIButtonTypeCustom];
    scale.frame = CGRectMake(410, 0, 70, 67);
    [scale setBackgroundImage:[UIImage imageNamed:@"GIIntervalSelectScale.png"] forState:UIControlStateNormal];
//    scale.backgroundColor = [UIColor grayColor];
 //   [scale.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
 //   [scale.titleLabel setTextColor:[UIColor whiteColor]];
 //   [scale setTitle:@"" forState:UIControlStateNormal];
    [scale addTarget:self action:@selector(chooseScaleButtonPushed) forControlEvents:UIControlEventTouchUpInside];
    [scale setBackgroundImage:[UIImage imageNamed:@"GIIntervalSelectScaleH.png"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:playSound];
    [self.view addSubview:exit];
    [self.view addSubview:scale];
    
    for (int i = 0; i < 4; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBounds:CGRectMake(0, 0, 60.0f, 60.0f)];
        button.tag = i;
        button.center = CGPointMake(215 + i*80, 240);
        button.backgroundColor = [UIColor clearColor];
        //        [button.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
        //    [button.titleLabel setTextColor:[UIColor whiteColor]];
        //        [button setTitle:@"|>" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(intervalButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        // [playSound setBackgroundImage:highlighter forState:UIControlStateHighlighted];
        [self.intervalButtonDictionary setObject:button forKey:[self.arrayOfNoteStrings objectAtIndex:i]];
        [self.view addSubview:button];
        
    }
    for (int i = 4; i < 9; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBounds:CGRectMake(0, 0, 60.0f, 60.0f)];
        button.tag = i;
        button.center = CGPointMake(135 + (i-4)*80, 150);
        button.backgroundColor = [UIColor clearColor];
        //        [button.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
        //    [button.titleLabel setTextColor:[UIColor whiteColor]];
        //        [button setTitle:@"|>" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(intervalButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        // [playSound setBackgroundImage:highlighter forState:UIControlStateHighlighted];
        [self.intervalButtonDictionary setObject:button forKey:[self.arrayOfNoteStrings objectAtIndex:i]];
        [self.view addSubview:button];
        
    }
    
    for (int i = 9; i < 12; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBounds:CGRectMake(0, 0, 60.0f, 60.0f)];
        button.tag = i;
        button.center = CGPointMake(135 + (i-9)*80, 60);
        button.backgroundColor = [UIColor clearColor];
        //        [button.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
        //    [button.titleLabel setTextColor:[UIColor whiteColor]];
        //        [button setTitle:@"|>" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(intervalButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        // [playSound setBackgroundImage:highlighter forState:UIControlStateHighlighted];
        [self.intervalButtonDictionary setObject:button forKey:[self.arrayOfNoteStrings objectAtIndex:i]];
        [self.view addSubview:button];
        
    }
    
    [self updateSuccessRatio];
    
    
}

-(void)exitPushed{
    
    [self.intervalDelegate returnFromInterval];
    
}

-(void)filterScale:(NSInteger)selectedRow{
    
    self.chosenScale = selectedRow;
    
    if (selectedRow == 0) {
        for (NSString *key in self.intervalButtonDictionary) {
            
            // need to check for superview first
            if ([[self.intervalLayerDicionary objectForKey:key] superlayer] != nil) {
                [[self.intervalLayerDicionary objectForKey:key] removeFromSuperlayer];
            }
            if ([[self.intervalButtonDictionary objectForKey:key] superview] != nil) {
                [[self.intervalButtonDictionary objectForKey:key] removeFromSuperview];
            }
            if ([[self.titleForButtonDictionary objectForKey:key] superlayer] != nil) {
                [[self.titleForButtonDictionary objectForKey:key] removeFromSuperlayer];
            }
            
            
            [[self.intervalLayerDicionary objectForKey:key] removeFromSuperlayer];
            [self.view.layer addSublayer:[self.intervalLayerDicionary objectForKey:key]];
            [[self.titleForButtonDictionary objectForKey:key] removeFromSuperlayer];
            [self.view.layer addSublayer:[self.titleForButtonDictionary objectForKey:key]]; // and titles
            [[self.intervalButtonDictionary objectForKey:key] removeFromSuperview];
            [self.view addSubview:[self.intervalButtonDictionary objectForKey:key]]; // specified interval buttons
                            
        }
    } else if (selectedRow == 1) {
        for (NSString *key in self.intervalButtonDictionary) {
            
            if ([[self.titleForButtonDictionary objectForKey:key] superlayer] != nil) {
                [[self.titleForButtonDictionary objectForKey:key] removeFromSuperlayer];
            }
            if ([[self.intervalButtonDictionary objectForKey:key] superview] != nil) {
                [[self.intervalButtonDictionary objectForKey:key] removeFromSuperview];
            }
            if ([[self.intervalLayerDicionary objectForKey:key] superlayer] != nil) {
                [[self.intervalLayerDicionary objectForKey:key] removeFromSuperlayer];
            }
            
            if ([self.ionianArrayOfNoteStrings containsObject:key]) {
                [self.view.layer addSublayer:[self.intervalLayerDicionary objectForKey:key]];
                [self.view.layer addSublayer:[self.titleForButtonDictionary objectForKey:key]];
                [self.view addSubview:[self.intervalButtonDictionary objectForKey:key]];

                
            }
            
            
        }
        
    } else if (selectedRow == 2) {
        for (NSString *key in self.intervalButtonDictionary) {
            
            if ([[self.titleForButtonDictionary objectForKey:key] superlayer] != nil) {
                [[self.titleForButtonDictionary objectForKey:key] removeFromSuperlayer];
            }
            if ([[self.intervalButtonDictionary objectForKey:key] superview] != nil) {
                [[self.intervalButtonDictionary objectForKey:key] removeFromSuperview];
            }
            if ([[self.intervalLayerDicionary objectForKey:key] superlayer] != nil) {
                [[self.intervalLayerDicionary objectForKey:key] removeFromSuperlayer];
            }
            
            if ([self.dorianArray containsObject:key]) {
                [self.view.layer addSublayer:[self.intervalLayerDicionary objectForKey:key]];
                [self.view.layer addSublayer:[self.titleForButtonDictionary objectForKey:key]];
                [self.view addSubview:[self.intervalButtonDictionary objectForKey:key]];
                
                
            }
            
            
        }
        
    } else if (selectedRow == 3) {
        for (NSString *key in self.intervalButtonDictionary) {
            
            if ([[self.titleForButtonDictionary objectForKey:key] superlayer] != nil) {
                [[self.titleForButtonDictionary objectForKey:key] removeFromSuperlayer];
            }
            if ([[self.intervalButtonDictionary objectForKey:key] superview] != nil) {
                [[self.intervalButtonDictionary objectForKey:key] removeFromSuperview];
            }
            if ([[self.intervalLayerDicionary objectForKey:key] superlayer] != nil) {
                [[self.intervalLayerDicionary objectForKey:key] removeFromSuperlayer];
            }
            
            if ([self.phrygianArray containsObject:key]) {
                [self.view.layer addSublayer:[self.intervalLayerDicionary objectForKey:key]];
                [self.view.layer addSublayer:[self.titleForButtonDictionary objectForKey:key]];
                [self.view addSubview:[self.intervalButtonDictionary objectForKey:key]];
            }
        }
    }else if (selectedRow == 4) {
        for (NSString *key in self.intervalButtonDictionary) {
            
            if ([[self.titleForButtonDictionary objectForKey:key] superlayer] != nil) {
                [[self.titleForButtonDictionary objectForKey:key] removeFromSuperlayer];
            }
            if ([[self.intervalButtonDictionary objectForKey:key] superview] != nil) {
                [[self.intervalButtonDictionary objectForKey:key] removeFromSuperview];
            }
            if ([[self.intervalLayerDicionary objectForKey:key] superlayer] != nil) {
                [[self.intervalLayerDicionary objectForKey:key] removeFromSuperlayer];
            }
            
            if ([self.lydianArray containsObject:key]) {
                [self.view.layer addSublayer:[self.intervalLayerDicionary objectForKey:key]];
                [self.view.layer addSublayer:[self.titleForButtonDictionary objectForKey:key]];
                [self.view addSubview:[self.intervalButtonDictionary objectForKey:key]];
                
            }
        }
    } else if (selectedRow == 5) {
        for (NSString *key in self.intervalButtonDictionary) {
            
            if ([[self.titleForButtonDictionary objectForKey:key] superlayer] != nil) {
                [[self.titleForButtonDictionary objectForKey:key] removeFromSuperlayer];
            }
            if ([[self.intervalButtonDictionary objectForKey:key] superview] != nil) {
                [[self.intervalButtonDictionary objectForKey:key] removeFromSuperview];
            }
            if ([[self.intervalLayerDicionary objectForKey:key] superlayer] != nil) {
                [[self.intervalLayerDicionary objectForKey:key] removeFromSuperlayer];
            }
            
            if ([self.mixolydianArray containsObject:key]) {
                [self.view.layer addSublayer:[self.intervalLayerDicionary objectForKey:key]];
                [self.view.layer addSublayer:[self.titleForButtonDictionary objectForKey:key]];
                [self.view addSubview:[self.intervalButtonDictionary objectForKey:key]];
                
            }
        }
    } else if (selectedRow == 6) {
        for (NSString *key in self.intervalButtonDictionary) {
            
            if ([[self.titleForButtonDictionary objectForKey:key] superlayer] != nil) {
                [[self.titleForButtonDictionary objectForKey:key] removeFromSuperlayer];
            }
            if ([[self.intervalButtonDictionary objectForKey:key] superview] != nil) {
                [[self.intervalButtonDictionary objectForKey:key] removeFromSuperview];
            }
            if ([[self.intervalLayerDicionary objectForKey:key] superlayer] != nil) {
                [[self.intervalLayerDicionary objectForKey:key] removeFromSuperlayer];
            }
            
            if ([self.aeolianArray containsObject:key]) {
                [self.view.layer addSublayer:[self.intervalLayerDicionary objectForKey:key]];
                [self.view.layer addSublayer:[self.titleForButtonDictionary objectForKey:key]];
                [self.view addSubview:[self.intervalButtonDictionary objectForKey:key]];
                
            }
        }
    } else if (selectedRow == 7) {
        for (NSString *key in self.intervalButtonDictionary) {
            
            if ([[self.titleForButtonDictionary objectForKey:key] superlayer] != nil) {
                [[self.titleForButtonDictionary objectForKey:key] removeFromSuperlayer];
            }
            if ([[self.intervalButtonDictionary objectForKey:key] superview] != nil) {
                [[self.intervalButtonDictionary objectForKey:key] removeFromSuperview];
            }
            if ([[self.intervalLayerDicionary objectForKey:key] superlayer] != nil) {
                [[self.intervalLayerDicionary objectForKey:key] removeFromSuperlayer];
            }
            
            if ([self.locrianArray containsObject:key]) {
                [self.view.layer addSublayer:[self.intervalLayerDicionary objectForKey:key]];
                [self.view.layer addSublayer:[self.titleForButtonDictionary objectForKey:key]];
                [self.view addSubview:[self.intervalButtonDictionary objectForKey:key]];
                
            }
        }
    }
    
    // end
}



-(void)intervalButtonPushed:(UIButton *)sender{
    
    NSLog(@"intervalButtonPushed:");
    
    
    if (self.isInMiddleOfTurn) {
        [self.arrayOfChoices addObject:[NSNumber numberWithInt:sender.tag]];
        
        
        

        self.choiceCounter += 1;
        
        if (self.choiceCounter == 1) {
            
            [self updateFirstChoiceDisplayWithString:[self.arrayOfNoteStrings objectAtIndex:sender.tag]  andColor:[self.colorArray objectAtIndex:sender.tag]];
        }
        if (self.choiceCounter == 2) {
            
            if (sender.tag == self.chosenIndexOne) {
                self.successes += 0.5;
                [self updateSuccessRatio];
            }
            
            [self updateSecondChoiceDisplayWithString:[self.arrayOfNoteStrings objectAtIndex:sender.tag]  andColor:[self.colorArray objectAtIndex:sender.tag]];
        }
        if (self.choiceCounter == 3) {
            
            if (sender.tag == self.chosenIndexTwo) {
                
                self.successes += 0.5;
                [self updateSuccessRatio];
            } 
            
            [self updateThirdChoiceDisplayWithString:[self.arrayOfNoteStrings objectAtIndex:sender.tag]  andColor:[self.colorArray objectAtIndex:sender.tag]];
        }
        
        if (self.choiceCounter == 3) {
            GIGuitarSource *localGuitarSource = [[GIGuitarSource alloc] init];
            self.playItem = [localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:sender.tag];
            [self.playItem playAtTime:localGuitarSource.guitarC3Player.deviceCurrentTime];
            self.attempts += 1;
            [self displayResults];
            
            self.choiceCounter = 0;
        } else {
            
            GIGuitarSource *localGuitarSource = [[GIGuitarSource alloc] init];
            if (!self.playItemInPlay) {
                
                self.playItem = [localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:sender.tag];
                [self.playItem playAtTime:localGuitarSource.guitarC3Player.deviceCurrentTime];
                self.playItemInPlay = YES;
            } else {
                
                self.secondPlayItem = [localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:sender.tag];
                [self.secondPlayItem playAtTime:localGuitarSource.guitarC3Player.deviceCurrentTime];
                self.playItemInPlay = NO;
            }
            

 
            
              
        }
        

   //      if (sender.tag == self.chosenIndexOne || sender.tag == self.chosenIndexTwo) {
    //        
     //       self.successes += 0.5;
      //       [self updateSuccessRatio];
       // } 
        
  //      if (sender.tag == self.chosenIndexOne) {
   //         self.successes += 0.5;
   //         [self updateSuccessRatio];
    //    }
        
    
    } else {
    
    GIGuitarSource *localGuitarSource = [[GIGuitarSource alloc] init];
        if (!self.playItemInPlay) {
            
            self.playItem = [localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:sender.tag];
            [self.playItem playAtTime:localGuitarSource.guitarC3Player.deviceCurrentTime];
            self.playItemInPlay = YES;
        } else {
            
            if (!self.secondItemInPLay){
            
                self.secondPlayItem = [localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:sender.tag];
                [self.secondPlayItem playAtTime:localGuitarSource.guitarC3Player.deviceCurrentTime];
               // self.playItemInPlay = NO;
                self.secondItemInPLay = YES;
                    } else {
                        
                        self.thirdPlayItem = [localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:sender.tag];
                        [self.thirdPlayItem playAtTime:localGuitarSource.guitarC3Player.deviceCurrentTime];
                        self.playItemInPlay = NO;
                        self.secondItemInPLay = NO;
                
                    }
        }
    
                                        
    
    } 
    
}

-(void)playButtonPressed{
    
  //  [self.blurBeforePlayView removeFromSuperview];
    
    if (!self.isInMiddleOfTurn) {
         
        if (self.chosenScale == 0) {
            int random;
            int roll = arc4random()%10;
            if (roll < 7) {
                random = arc4random()%11;
            } else if (roll >= 7 && roll <9){
                random = 7;
            } else{
                random = 11;
            }
            int random2;
            int roll2 = arc4random()%10;
            if (roll2 < 7) {
                random2 = arc4random()%11;
            } else if (roll2 >= 7 && roll2 <9){
                random2 = 7;
            } else{
                random2 = 11;
            }
            self.chosenIndexOne = random;
            NSLog(@"%d", self.chosenIndexOne);
            self.chosenIndexTwo = random2;
            NSLog(@"%d", self.chosenIndexTwo);
            
        } else if (self.chosenScale == 1){
            //ionian
            int roll = arc4random()%10;
            if (roll < 7) {
            
            int random = arc4random()%5;
            self.chosenIndexOne = [[self.scaleSelector.ionianScale objectAtIndex:random] intValue];
            NSLog(@"%d", self.chosenIndexOne);
            int random2 = arc4random()%5;
            self.chosenIndexTwo = [[self.scaleSelector.ionianScale objectAtIndex:random2] intValue];
            NSLog(@"%d", self.chosenIndexTwo);
                
            } else if (roll > 6 && roll <= 8){
                int random = arc4random()%5;

                
                
                
                self.chosenIndexOne = [[self.scaleSelector.majMajModalArray objectAtIndex:1] intValue];
                 self.chosenIndexTwo = [[self.scaleSelector.ionianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else {
                int random = arc4random()%5;
                int modalRandom = arc4random()%1;
                
                self.chosenIndexOne = [[self.scaleSelector.ionianScale objectAtIndex:random] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.majMajModalArray objectAtIndex:modalRandom] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
            }
            
        } else if (self.chosenScale == 2) {
            
            
            int roll = arc4random()%10;
            if (roll < 7) {
                
                int random = arc4random()%5;
                self.chosenIndexOne = [[self.scaleSelector.dorianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                int random2 = arc4random()%5;
                self.chosenIndexTwo = [[self.scaleSelector.dorianScale objectAtIndex:random2] intValue];
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else if (roll > 6 && roll <= 8){
                int random = arc4random()%5;

                
                self.chosenIndexOne = [[self.scaleSelector.majMajModalArray objectAtIndex:1] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.dorianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else {
                int random = arc4random()%5;
                int modalRandom = arc4random()%1;
                
                self.chosenIndexOne = [[self.scaleSelector.dorianScale objectAtIndex:random] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.majMajModalArray objectAtIndex:modalRandom] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
            }
            
            
        } else if (self.chosenScale == 3) {
            int roll = arc4random()%10;
            if (roll < 7) {
                
                int random = arc4random()%5;
                self.chosenIndexOne = [[self.scaleSelector.phrygianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                int random2 = arc4random()%5;
                self.chosenIndexTwo = [[self.scaleSelector.phrygianScale objectAtIndex:random2] intValue];
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else if (roll > 6 && roll <= 8){
                int random = arc4random()%5;

                
                self.chosenIndexOne = [[self.scaleSelector.minMinModalArray objectAtIndex:1] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.phrygianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else {
                int random = arc4random()%5;
                int modalRandom = arc4random()%1;
                
                self.chosenIndexOne = [[self.scaleSelector.phrygianScale objectAtIndex:random] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.minMinModalArray objectAtIndex:modalRandom] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
            }
            
            
        } else if (self.chosenScale == 4) {
            int roll = arc4random()%10;
            if (roll < 7) {
                
                int random = arc4random()%5;
                self.chosenIndexOne = [[self.scaleSelector.lydianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                int random2 = arc4random()%5;
                self.chosenIndexTwo = [[self.scaleSelector.lydianScale objectAtIndex:random2] intValue];
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else if (roll > 6 && roll <= 8){
                int random = arc4random()%5;

                
                self.chosenIndexOne = [[self.scaleSelector.majMajModalArray objectAtIndex:1] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.lydianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else {
                int random = arc4random()%5;
                int modalRandom = arc4random()%1;
                
                self.chosenIndexOne = [[self.scaleSelector.lydianScale objectAtIndex:random] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.majMajModalArray objectAtIndex:modalRandom] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
            }
            
            
            
            
            
        } else if (self.chosenScale == 5) {
            int roll = arc4random()%10;
            if (roll < 7) {
                
                int random = arc4random()%5;
                self.chosenIndexOne = [[self.scaleSelector.mixolydianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                int random2 = arc4random()%5;
                self.chosenIndexTwo = [[self.scaleSelector.mixolydianScale objectAtIndex:random2] intValue];
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else if (roll > 6 && roll <= 8){
                int random = arc4random()%5;

                
                self.chosenIndexOne = [[self.scaleSelector.majMajModalArray objectAtIndex:1] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.mixolydianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else {
                int random = arc4random()%5;
                int modalRandom = arc4random()%1;
                
                self.chosenIndexOne = [[self.scaleSelector.mixolydianScale objectAtIndex:random] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.majMajModalArray objectAtIndex:modalRandom] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
            }
            
        } else if (self.chosenScale == 6) {
            int roll = arc4random()%10;
            if (roll < 7) {
                
                int random = arc4random()%5;
                self.chosenIndexOne = [[self.scaleSelector.aeolianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                int random2 = arc4random()%5;
                self.chosenIndexTwo = [[self.scaleSelector.aeolianScale objectAtIndex:random2] intValue];
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else if (roll > 6 && roll <= 8){
                int random = arc4random()%5;
              //  int modalRandom = arc4random()%1;
                
                self.chosenIndexOne = [[self.scaleSelector.majMinModalArray objectAtIndex:1] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.aeolianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else {
                int random = arc4random()%5;
                int modalRandom = arc4random()%1;
                
                self.chosenIndexOne = [[self.scaleSelector.aeolianScale objectAtIndex:random] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.majMinModalArray objectAtIndex:modalRandom] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
            }
            
            
            
        } else if (self.chosenScale == 7) {
            int roll = arc4random()%10;
            if (roll < 7) {
                
                int random = arc4random()%5;
                self.chosenIndexOne = [[self.scaleSelector.locrianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                int random2 = arc4random()%5;
                self.chosenIndexTwo = [[self.scaleSelector.locrianScale objectAtIndex:random2] intValue];
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else if (roll > 6 && roll <= 8){
                int random = arc4random()%5;
              //  int modalRandom = arc4random()%1;
                
                self.chosenIndexOne = [[self.scaleSelector.minMinModalArray objectAtIndex:1] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.locrianScale objectAtIndex:random] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
                
            } else {
                int random = arc4random()%5;
                int modalRandom = arc4random()%1;
                
                self.chosenIndexOne = [[self.scaleSelector.locrianScale objectAtIndex:random] intValue];
                self.chosenIndexTwo = [[self.scaleSelector.minMinModalArray objectAtIndex:modalRandom] intValue];
                NSLog(@"%d", self.chosenIndexOne);
                NSLog(@"%d", self.chosenIndexTwo);
            }
        }
        
        
        [self.arrayOfCorrectIntervals removeAllObjects];
        [self.arrayOfCorrectIntervals addObject:[NSNumber numberWithInt:self.chosenIndexOne]];
        [self.arrayOfCorrectIntervals addObject:[NSNumber numberWithInt:self.chosenIndexTwo]];
        self.isInMiddleOfTurn = YES;
        // other scales take indeces from random of scaleSelector array.
    }
    GIGuitarSource *localGuitarSource = [[GIGuitarSource alloc] init];
    self.rootPlayer = [localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:0];
    
    GIGuitarSource *localGuitarSource2 = [[GIGuitarSource alloc] init];
    self.indexOnePlayer = [localGuitarSource2.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:self.chosenIndexOne];
    
    GIGuitarSource *localGuitarSource3 = [[GIGuitarSource alloc] init];
    self.indexTwoPlayer = [localGuitarSource3.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:self.chosenIndexTwo];
    
    [self.rootPlayer playAtTime:(localGuitarSource.guitarC3Player.deviceCurrentTime)];
    [self.indexOnePlayer playAtTime:(localGuitarSource.guitarC3Player.deviceCurrentTime + quarterNoteTime(80))];
    [self.indexTwoPlayer playAtTime:(localGuitarSource.guitarC3Player.deviceCurrentTime + quarterNoteTime(80)) + quarterNoteTime(80)];
    
}

-(void)displayResults{
    
    //display: intervals were:  you picked: 
    [self updateSuccessRatio];
    [self displayResultScreen];
    NSLog(@"%d", [[self.arrayOfChoices objectAtIndex:2] intValue]);
    
    if ([self.arrayOfChoices objectAtIndex:1] == [NSNumber numberWithInt:self.chosenIndexOne] && [self.arrayOfChoices objectAtIndex:2] == [NSNumber numberWithInt:self.chosenIndexTwo]) {
        
        [self bannerOfPraiseOrShameWithText:@"Nice!" andColor:[UIColor greenColor]];
        
    } else if ([self.arrayOfChoices objectAtIndex:1] == [NSNumber numberWithInt:self.chosenIndexOne] ||[self.arrayOfChoices objectAtIndex:2] == [NSNumber numberWithInt:self.chosenIndexTwo]) {
        
        [self bannerOfPraiseOrShameWithText:@"Almost!" andColor:[UIColor yellowColor]];
        
    } else {
        
        [self bannerOfPraiseOrShameWithText:@"Failure!" andColor:[UIColor redColor]];
        
    }
    
    self.chosenIndexTwo = arc4random()%10;
    self.chosenIndexOne = arc4random()%10;
    self.chosenIndexTwo = arc4random()%10;
    self.chosenIndexOne = arc4random()%10;
    
    [self.arrayOfChoices removeAllObjects];
    [self.arrayOfCorrectIntervals removeAllObjects];
    self.isInMiddleOfTurn = NO;
    
}

-(CATextLayer *)drawText{
    
    CATextLayer *text = [CATextLayer layer];
    text.backgroundColor = [UIColor clearColor].CGColor;
    text.foregroundColor = [UIColor whiteColor].CGColor;
    text.opacity = .2;
    text.alignmentMode = kCAAlignmentCenter;
    //[textLayer setCornerRadius:16.0f];
    [text setFont:@"STHeitiTC-Medium"];
    [text setFontSize:30];
    [text setBounds:CGRectMake(0, 0, 50.0f, 32.0f)];
//    maj2Text.position = CGPointMake(375, 240);
//    maj2Text.string = @"2";
    text.wrapped = NO;
    [self.view.layer addSublayer:text];
    
    return text;
    
    
}
-(void)bannerOfPraiseOrShameWithText:(NSString *)string andColor:(UIColor *)color{
    
    CATextLayer *banner = [CATextLayer layer];
    banner.frame = CGRectMake(0, 0, 480, 120);
    banner.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5].CGColor;
    banner.foregroundColor = color.CGColor;
    banner.string = [NSString stringWithFormat:@"%@", string];
    [banner setFont:@"Arial-BoldItalicMT"];
    [banner setFontSize:60];
    banner.wrapped = NO;
    
    self.bannerOfShameOrPraise = banner;
    
    [self.view.layer addSublayer:self.bannerOfShameOrPraise];
    
    
    
    
    
}

-(void)displayResultScreen{
    
    self.resultScreen = [CATextLayer layer];
    self.resultScreen.frame = CGRectMake(0.0, 120, 480, 80);

    self.resultScreen.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5].CGColor;
    self.resultScreen.foregroundColor  = [UIColor grayColor].CGColor;
    self.resultScreen.string = [NSString stringWithFormat:@"Correct: %@, %@", [self.arrayOfNoteStrings objectAtIndex:self.chosenIndexOne], [self.arrayOfNoteStrings objectAtIndex:self.chosenIndexTwo]];
    [self.resultScreen setFont:@"STHeitiTC-Medium"];
    [self.resultScreen setFontSize:60];
    self.resultScreen.wrapped = NO;

    [self.view.layer addSublayer:self.resultScreen];
    [self.view addSubview:self.buttonForExitOfDisplay];
    
    
    
}

-(void)exitDisplay{
    
    [self.buttonForExitOfDisplay removeFromSuperview];
    [self.resultScreen removeFromSuperlayer];
    [self.bannerOfShameOrPraise removeFromSuperlayer];
    
    [self updateFirstChoiceDisplayWithString:@"" andColor:[UIColor clearColor]];
    [self updateSecondChoiceDisplayWithString:@"" andColor:[UIColor clearColor]];
    [self updateThirdChoiceDisplayWithString:@"" andColor:[UIColor clearColor]];
    
    [self.choiceOneTracker removeFromSuperlayer];
    [self.choiceTwoTracker removeFromSuperlayer];
    [self.choiceThreeTracker removeFromSuperlayer];
    
    self.chosenIndexOne = 0;
    self.chosenIndexTwo = 0;

    [self updateSuccessRatio];
    
}

-(void)updateSuccessRatio{
    

    if ([self.successRatio superlayer] != nil) {
        [self.successRatio removeFromSuperlayer];
    }
    
    self.successRatio = [CATextLayer layer];
    self.successRatio.frame = CGRectMake(380, 280, 120, 40);
    [self.successRatio setFontSize:30];
    [self.successRatio setFont:@"STHeitiTC-Medium"];
    self.successRatio.backgroundColor = [UIColor clearColor].CGColor;
    self.successRatio.foregroundColor = [UIColor darkGrayColor].CGColor;    
    self.successRatio.string = [NSString stringWithFormat:@"%.1f/%d", self.successes, self.attempts];

    [self.view.layer addSublayer:self.successRatio];
    
    
}

-(void)updateFirstChoiceDisplayWithString:(NSString *)string andColor:(UIColor *)color{
    
    if ([self.choiceOneTracker superlayer] != nil) {
        [self.choiceOneTracker removeFromSuperlayer];
    }
    
    self.choiceOneTracker = [CATextLayer layer];
    self.choiceOneTracker.frame = CGRectMake(100, 280, 50, 40);
    [self.choiceOneTracker setFontSize:30];
    [self.choiceOneTracker setFont:@"STHeitiTC-Medium"];
    self.choiceOneTracker.backgroundColor = [UIColor grayColor].CGColor;
    self.choiceOneTracker.foregroundColor = color.CGColor;    
    self.choiceOneTracker.alignmentMode = kCAAlignmentCenter;
    self.choiceOneTracker.string = [NSString stringWithFormat:string];
    
    [self.view.layer addSublayer:self.choiceOneTracker];
    
}
-(void)updateSecondChoiceDisplayWithString:(NSString *)string andColor:(UIColor *)color{
    
    if ([self.choiceTwoTracker superlayer] != nil) {
        [self.choiceTwoTracker removeFromSuperlayer];
    }
    
    self.choiceTwoTracker = [CATextLayer layer];
    self.choiceTwoTracker.frame = CGRectMake(150, 280, 50, 40);
    [self.choiceTwoTracker setFontSize:30];
    [self.choiceTwoTracker setFont:@"STHeitiTC-Medium"];
    self.choiceTwoTracker.backgroundColor = [UIColor grayColor].CGColor;
    self.choiceTwoTracker.foregroundColor = color.CGColor;    
    self.choiceTwoTracker.alignmentMode = kCAAlignmentNatural;
    self.choiceTwoTracker.string = [NSString stringWithFormat:string];
    
    [self.view.layer addSublayer:self.choiceTwoTracker];
    
    
}
-(void)updateThirdChoiceDisplayWithString:(NSString *)string andColor:(UIColor *)color{
    
    if ([self.choiceThreeTracker superlayer] != nil) {
        [self.choiceThreeTracker removeFromSuperlayer];
    }
    
    self.choiceThreeTracker = [CATextLayer layer];
    self.choiceThreeTracker.frame = CGRectMake(200, 280, 50, 40);
    [self.choiceThreeTracker setFontSize:30];
    [self.choiceThreeTracker setFont:@"STHeitiTC-Medium"];
    self.choiceThreeTracker.backgroundColor = [UIColor grayColor].CGColor;
    self.choiceThreeTracker.foregroundColor = color.CGColor; 
    self.choiceThreeTracker.alignmentMode = kCAAlignmentLeft;
    self.choiceThreeTracker.string = [NSString stringWithFormat:string];
    
    [self.view.layer addSublayer:self.choiceThreeTracker];
    
}

#pragma mark PICKERVIEW_STUFF

-(void)chooseScaleButtonPushed{
    
    [self.view addSubview:self.pickerViewOfScales];
    [self.view addSubview:self.logScaleButton];
    [self.view addSubview:self.blurWhileLoggingScale];
    
}

-(void)logScale{
    
    [self filterScale:[self.pickerViewOfScales selectedRowInComponent:0]];
    
    [self.pickerViewOfScales removeFromSuperview];
    [self.logScaleButton removeFromSuperview];
    [self.blurWhileLoggingScale removeFromSuperview];
    
    
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
    
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 8;

}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.pickerViewArrayOfScaleNames objectAtIndex:row];

}
// Do something with the selected row.
/*-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
 
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{

}*/


@end
