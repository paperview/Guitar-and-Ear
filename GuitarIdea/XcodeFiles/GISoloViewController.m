//
//  GISoloViewController.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/17/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GISoloViewController.h"
#import "GIFretView.h"
#import "GIFretBoardGraphics.h"
#import "GITempoConstructs.h"
#import "GIChroma.h"
#import "GIGuitarSource.h"
#import "GIScaleSelector.h"

@interface GISoloViewController ()

@property (nonatomic, strong) GIScaleSelector *scaleSelector;

@property (nonatomic, strong) GIFretView *fretView;
@property (nonatomic, strong) UIScrollView *fretBoardScrollView;

@property (nonatomic, strong) CALayer *fretBoardLayer;
@property (nonatomic, strong) CALayer *infoBarLayer;
@property (nonatomic, strong) CATextLayer *keyIndicator;
@property (nonatomic, strong) GIFretBoardGraphics *graphicsForFretboard;
@property (nonatomic, strong) CALayer *testLayer;

@property (nonatomic, strong) NSMutableArray *sixteenthNoteSequenceArray;
@property (nonatomic, assign) int sixteenthNoteSequence;
@property (nonatomic, strong) NSMutableArray *tripletNoteSequenceArray;
@property (nonatomic, assign) int tripletNoteSequence;

@property (nonatomic, assign) float tempo;

@property (nonatomic, strong) NSMutableArray *testArrayQs;
@property (nonatomic, strong) NSMutableArray *testArraySs;
@property (nonatomic, strong) NSMutableArray *testArrayTs;

@property (nonatomic, strong) NSMutableArray *qArrayOfStrings;
@property (nonatomic, strong) NSMutableArray *sArrayOfStrings;
@property (nonatomic, strong) NSMutableArray *tArrayOfStrings;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSInvocation *invoker;

@property (nonatomic, strong) GIGuitarSource *guitarSource;

@property (nonatomic, assign) CGPoint E3LowEDot;
@property (nonatomic, assign) CGPoint F3LowEDot;
@property (nonatomic, assign) CGPoint FSharp3LowEDot;
@property (nonatomic, assign) CGPoint G3LowEDot;
@property (nonatomic, assign) CGPoint GSharp3LowEDot;
@property (nonatomic, assign) CGPoint A3LowEDot;
@property (nonatomic, assign) CGPoint ASharp3LowEDot;
@property (nonatomic, assign) CGPoint B3LowEDot;
@property (nonatomic, assign) CGPoint C4LowEDot;
@property (nonatomic, assign) CGPoint CSharp4LowEDot;
@property (nonatomic, assign) CGPoint D4LowEDot;
@property (nonatomic, assign) CGPoint DSharp4LowEDot;
@property (nonatomic, assign) CGPoint E4LowEDot;

@property (nonatomic, strong) NSMutableDictionary *dictionaryOfLowE;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfAString;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfGString;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfDString;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfBString;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfHighEString;

@property (nonatomic, strong) NSMutableDictionary *dictionaryOfLabelsLowE;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfLabelsA;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfLabelsD;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfLabelsG;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfLabelsB;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfLabelsHighE;

@property (nonatomic, strong) NSArray *arrayOfNoteNames;

@property (nonatomic, strong) NSMutableArray *arrayOfGuitarSources;
@property (nonatomic, assign) int arrayOfGuitarSourcesIndexer;

@property (nonatomic, assign) NSInteger keyIndexHere;

@property (nonatomic, strong) NSArray *colorArray;

@property (nonatomic, strong) NSMutableArray *modeNameArray;
@property (nonatomic, strong) NSMutableArray *timerArrayForVisuals;
@property (nonatomic, strong) NSMutableArray *timerAddayForScaleVisuals;
// maybe one for chord visuals.

@property (nonatomic, strong) NSArray *guitarPlayerArrayOfQuarters;
@property (nonatomic, strong) NSArray *guitarPlayerArrayOEighths;
@property (nonatomic, strong) NSArray *guitarPlayerArrayOfTriplets;

@property (nonatomic, assign) double tempoConstant;
@property (nonatomic, assign) float quarterNotesPresent;
@property (nonatomic, assign) double tempoConstantTwo;

//@property (nonatomic, strong) GIGuitarSource *localGuitarSource;
@property (nonatomic, strong) NSMutableArray *setOfKeyNames;
@property (nonatomic, strong) NSMutableArray *setOfKeyNames2;

@property (nonatomic, strong) CAKeyframeAnimation *scaleIn;
@property (nonatomic, strong) NSCharacterSet *intervalicCharacters;

@property (nonatomic, strong) CATextLayer *firstScaleNameLayer;
@property (nonatomic, strong) CATextLayer *secondScaleNameLayer;

@property (nonatomic, strong) UIColor *firstScaleNameColor;
@property (nonatomic, strong) UIColor *secondScaleNameColor;
@property (nonatomic, assign) BOOL switchScaleDisplay;

@property (nonatomic, strong) NSMutableArray *repeatTimerArray;

@property (nonatomic, assign) BOOL fastMode;
@property (nonatomic, strong) NSMutableArray *eTimerArrayForVisuals;

@property (nonatomic, strong) UIView *blurOptions;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *mainMenuButton;

@property (nonatomic, strong) NSMutableArray *dataArrayQuarters;
@property (nonatomic, strong) NSMutableArray *dataArrayEighths;

@property (nonatomic, strong) UIView *blockOptionsButton;
@property (nonatomic, assign) int numberOfBarros;



@end

@implementation GISoloViewController
@synthesize numberOfBarros;

@synthesize blockOptionsButton;

@synthesize soloDelegate;

@synthesize tempoConstant;
@synthesize tempoConstantTwo;
@synthesize quarterNotesPresent;

@synthesize guitarPlayerArrayOfQuarters;
@synthesize guitarPlayerArrayOfTriplets;
@synthesize guitarPlayerArrayOEighths;

@synthesize scaleSelector;

@synthesize fretView;
@synthesize fretBoardScrollView;
@synthesize fretBoardLayer;
@synthesize infoBarLayer;
@synthesize keyIndicator;
@synthesize graphicsForFretboard;
@synthesize sixteenthNoteSequence;
@synthesize tripletNoteSequence;
@synthesize tripletNoteSequenceArray;
@synthesize sixteenthNoteSequenceArray;

@synthesize testLayer;

@synthesize tempo;

@synthesize testArrayQs;
@synthesize testArraySs;
@synthesize testArrayTs;

@synthesize qArrayOfStrings;
@synthesize sArrayOfStrings;
@synthesize tArrayOfStrings;

@synthesize timer;
@synthesize invoker;

@synthesize guitarSource;

@synthesize E3LowEDot;
@synthesize F3LowEDot;
@synthesize FSharp3LowEDot;
@synthesize G3LowEDot;
@synthesize GSharp3LowEDot;
@synthesize A3LowEDot;
@synthesize ASharp3LowEDot;
@synthesize B3LowEDot;
@synthesize C4LowEDot;
@synthesize CSharp4LowEDot;
@synthesize D4LowEDot;
@synthesize DSharp4LowEDot;
@synthesize E4LowEDot;

@synthesize dictionaryOfLowE;
@synthesize dictionaryOfAString;
@synthesize dictionaryOfBString;
@synthesize dictionaryOfDString;
@synthesize dictionaryOfGString;
@synthesize dictionaryOfHighEString;

@synthesize dictionaryOfLabelsLowE;
@synthesize dictionaryOfLabelsA;
@synthesize dictionaryOfLabelsB;
@synthesize dictionaryOfLabelsD;
@synthesize dictionaryOfLabelsG;
@synthesize dictionaryOfLabelsHighE;

@synthesize arrayOfNoteNames;

@synthesize arrayOfGuitarSources;
@synthesize arrayOfGuitarSourcesIndexer;

@synthesize keyIndexHere;

@synthesize colorArray;

@synthesize modeNameArray;
@synthesize timerArrayForVisuals;
@synthesize timerAddayForScaleVisuals;

//@synthesize localGuitarSource;
@synthesize setOfKeyNames;
@synthesize setOfKeyNames2;

@synthesize scaleIn;

@synthesize intervalicCharacters;

@synthesize firstScaleNameLayer;
@synthesize secondScaleNameLayer;

@synthesize firstScaleNameColor;
@synthesize secondScaleNameColor;
@synthesize switchScaleDisplay;

@synthesize repeatTimerArray;

@synthesize fastMode = _fastMode;
@synthesize eTimerArrayForVisuals;

@synthesize blurOptions;
@synthesize cancelButton;
@synthesize saveButton;
@synthesize mainMenuButton;

@synthesize dataArrayEighths;
@synthesize dataArrayQuarters;

-(id)init{
    
    if (self = [super init]) {
        
    }
    return self;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
        self.graphicsForFretboard = [[GIFretBoardGraphics alloc] init];
        
        self.infoBarLayer = [CALayer layer];
        // self.infoBarLayer.backgroundColor = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1].CGColor;
        self.infoBarLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        self.infoBarLayer.frame = CGRectMake(0, 0, 320, 80);
        self.infoBarLayer.shadowOffset = CGSizeMake(0, 3);
        self.infoBarLayer.shadowRadius = 5.0;
        self.infoBarLayer.shadowColor = [UIColor blackColor].CGColor;
        self.infoBarLayer.shadowOpacity = 0.8;
        
        self.blurOptions = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        self.blurOptions.backgroundColor = [UIColor whiteColor];
        self.blurOptions.alpha = 0.9f;
        
      
        self.blockOptionsButton = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 70, 60)];
        self.blockOptionsButton.backgroundColor = [UIColor whiteColor];
        self.blockOptionsButton.alpha = 0.2f;
        
        self.numberOfBarros = 4;
  
        
        self.fretBoardLayer = [CALayer layer];
       // self.fretBoardLayer.backgroundColor = [UIColor clearColor].CGColor;
        self.fretBoardLayer.frame = CGRectMake(0, 0, 660, 480);  // whatever fretboardScrollView is
        self.fretBoardLayer.contents = (id)[UIImage imageNamed:@"GISoloViewBackground.png"].CGImage;
        
        //self.fretBoardLayer.contents = (id)backRef;
        
        
        self.sixteenthNoteSequenceArray = [[NSMutableArray alloc] init];
        self.sixteenthNoteSequence = 0;
        self.tripletNoteSequenceArray = [[NSMutableArray alloc] init];
        self.tripletNoteSequence = 0;
        
        self.tempo = 80;
        self.tempoConstant = 1.1;
        self.tempoConstantTwo = 1.1;
        
        
        self.modeNameArray = [[NSMutableArray alloc] init];
        self.timerArrayForVisuals = [[NSMutableArray alloc] init];
        self.timerAddayForScaleVisuals = [[NSMutableArray alloc] init];

        self.invoker = [[NSInvocation alloc] init];
        self.timer = [NSTimer timerWithTimeInterval:4 invocation:self.invoker repeats:NO];  
        
        self.scaleSelector = [[GIScaleSelector alloc] init];
        
        self.intervalicCharacters = [NSCharacterSet characterSetWithCharactersInString:@"/RPm234567t"];
        
        self.guitarSource = [[GIGuitarSource alloc] init];
        
       // self.localGuitarSource = [[GIGuitarSource alloc] init];
        
        self.arrayOfGuitarSources = [[NSMutableArray alloc] init];
        [self.arrayOfGuitarSources addObject:[GIGuitarSource class]];
        self.arrayOfGuitarSourcesIndexer = 0;
        
        self.keyIndexHere = 0;
        
        self.switchScaleDisplay = NO;
        
        self.colorArray = [NSArray arrayWithObjects:[UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1], [UIColor colorWithRed:1 green:0.25 blue:0.05 alpha:0.9], [UIColor colorWithRed:1 green:.4 blue:0 alpha:1], [UIColor colorWithRed:1 green:.6 blue:0 alpha:.9], [UIColor colorWithRed:1 green:1 blue:0 alpha:1], [UIColor colorWithRed:.5 green:1 blue:0 alpha:1],/*tritone:*/ [UIColor colorWithRed:0.1 green:1 blue:0.1 alpha:.8],  [UIColor colorWithRed:0 green:1 blue:1 alpha:1], [UIColor colorWithRed:0 green:.7 blue:1 alpha:.9], [UIColor colorWithRed:0 green:0 blue:1 alpha:1], [UIColor colorWithRed:.6 green:0 blue:.9 alpha:.9], [UIColor colorWithRed:.5 green:0 blue:.7 alpha:1], nil];
        self.setOfKeyNames = [[NSMutableArray alloc] init];
        self.setOfKeyNames2 = [[NSMutableArray alloc] init];
 
        self.scaleIn = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        self.scaleIn.removedOnCompletion = NO;
        self.scaleIn.fillMode = kCAFillModeBoth;
        self.scaleIn.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:1], [NSNumber numberWithFloat:1], [NSNumber numberWithFloat:0.0], nil];
        self.scaleIn.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.1], [NSNumber numberWithFloat:0.6], [NSNumber numberWithFloat:1], nil];
        self.scaleIn.timingFunctions = [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], nil];
        
        self.repeatTimerArray = [[NSMutableArray alloc] init];
        
        self.eTimerArrayForVisuals = [[NSMutableArray alloc] init];
        
        self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.saveButton.frame = CGRectMake(10, 15, 300, 140);
        [self.saveButton setBackgroundImage:[UIImage imageNamed:@"GISoloOptionsSave"] forState:UIControlStateNormal];
        [self.saveButton setBackgroundImage:[UIImage imageNamed:@"GISoloOptionsSaveH"] forState:UIControlStateHighlighted];
        [self.saveButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.frame = CGRectMake(10, 170, 300, 140);
        [self.cancelButton setBackgroundImage:[UIImage imageNamed:@"GISoloOptionsCancel"] forState:UIControlStateNormal];
        [self.cancelButton setBackgroundImage:[UIImage imageNamed:@"GISoloOptionsCancelH"] forState:UIControlStateHighlighted];
        [self.cancelButton addTarget:self action:@selector(cancelPressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.mainMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mainMenuButton.frame = CGRectMake(10, 325, 300, 140);
        [self.mainMenuButton setBackgroundImage:[UIImage imageNamed:@"GISoloOptionsMM"] forState:UIControlStateNormal];
        [self.mainMenuButton setBackgroundImage:[UIImage imageNamed:@"GISoloViewOptionsMMH"] forState:UIControlStateHighlighted];
        [self.mainMenuButton addTarget:self action:@selector(mainMenu) forControlEvents:UIControlEventTouchUpInside];
        
        self.dataArrayQuarters = [[NSMutableArray alloc] init];
        self.dataArrayEighths = [[NSMutableArray alloc] init];
        
    }
    return self;
}

-(void)loadView{
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    frame.origin.y = 0;
    
    self.fretView = [[GIFretView alloc] initWithFrame:frame];
    [self.view addSubview:self.fretView];
    
//    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 660, 480)];//
//    [background setImage:[UIImage imageNamed:@"GISoloViewBackGround.png"]];
//    [self.view addSubview:background];

    
    self.fretBoardScrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.fretBoardScrollView.contentSize=CGSizeMake(660,480);
    self.fretBoardScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.fretBoardScrollView];
    

    
    [self.fretBoardScrollView.layer addSublayer:self.fretBoardLayer];
    
    [self.view.layer addSublayer:self.infoBarLayer];
    
    UIImageView *barGlare = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    barGlare.image = [UIImage imageNamed:@"GISoloViewBar.png"];
    [self.view addSubview:barGlare];
    

    
    /*textLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
     textLayer.foregroundColor = [UIColor darkGrayColor].CGColor;
     
     CALayer *lowEKeyLayer = [self.dictionaryOfLowE objectForKey:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:self.keyIndexHere]]];
     textLayer.position = CGPointMake(lowEKeyLayer.position.x + 90, 150);
     
     textLayer.alignmentMode = kCAAlignmentCenter;
     textLayer.opacity = 0.0f;
     [textLayer setFont:@"Arial-BoldMT"];
     [textLayer setFontSize:30];
     [textLayer setBounds:CGRectMake(0, 0, 230.0f, 32.0f)];
     textLayer.wrapped = NO;*/
    
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(240, 10, 70, 60);
    [playButton setBackgroundImage:[UIImage imageNamed:@"GISoloViewPlay.png"] forState:UIControlStateNormal];
//    playButton.backgroundColor = [UIColor darkGrayColor];
//    [playButton.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:30]];
 //   [playButton.titleLabel setTextColor:[UIColor whiteColor]];
  //  [playButton setTitle:@"| |" forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(playButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [playButton setBackgroundImage:[UIImage imageNamed:@"GISoloViewPlayPressed"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:playButton];
    
    UIButton *optionsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    optionsButton.frame = CGRectMake(10, 10, 70, 60);
    [optionsButton setBackgroundImage:[UIImage imageNamed:@"GISoloViewOptions.png"] forState:UIControlStateNormal];
    //    playButton.backgroundColor = [UIColor darkGrayColor];
    //    [playButton.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:30]];
    //   [playButton.titleLabel setTextColor:[UIColor whiteColor]];
    //  [playButton setTitle:@"| |" forState:UIControlStateNormal];
    [optionsButton addTarget:self action:@selector(optionsButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [optionsButton setBackgroundImage:[UIImage imageNamed:@"GISoloViewOptionsPressed"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:optionsButton];
    
    
    
    //add frets, then
    
    for (int i = 45; i < 620; i+=45) {
        CALayer *fretLayer = [CALayer layer];
        fretLayer.frame = CGRectMake(i, 195, 5, 240);
        fretLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.fretBoardLayer addSublayer:fretLayer];
    }
    CALayer *neckLayer = [CALayer layer];
    neckLayer.frame = CGRectMake(45, 195, 5, 240);
    neckLayer.backgroundColor = [UIColor blackColor].CGColor;
    [self.fretBoardLayer addSublayer:neckLayer];
    
    CALayer *thirdFretMarker = [CALayer layer];
    thirdFretMarker.backgroundColor = [UIColor lightGrayColor].CGColor;
    [thirdFretMarker setCornerRadius:10.0f];
    [thirdFretMarker setBounds:CGRectMake(0, 0, 20.0f, 20.0f)];
    thirdFretMarker.position = CGPointMake(160, 315);
    [self.fretBoardLayer addSublayer:thirdFretMarker];
    
    CALayer *fifthFretMarker = [CALayer layer];
    fifthFretMarker.backgroundColor = [UIColor lightGrayColor].CGColor;
    [fifthFretMarker setCornerRadius:10.0f];
    [fifthFretMarker setBounds:CGRectMake(0, 0, 20.0f, 20.0f)];
    fifthFretMarker.position = CGPointMake(250, 315);
    [self.fretBoardLayer addSublayer:fifthFretMarker];
    
    CALayer *seventhFretMarker = [CALayer layer];
    seventhFretMarker.backgroundColor = [UIColor lightGrayColor].CGColor;
    [seventhFretMarker setCornerRadius:10.0f];
    [seventhFretMarker setBounds:CGRectMake(0, 0, 20.0f, 20.0f)];
    seventhFretMarker.position = CGPointMake(340, 315);
    [self.fretBoardLayer addSublayer:seventhFretMarker];
    
    CALayer *twelfthFretMarker = [CALayer layer];
    twelfthFretMarker.backgroundColor = [UIColor lightGrayColor].CGColor;
    [twelfthFretMarker setCornerRadius:10.0f];
    [twelfthFretMarker setBounds:CGRectMake(0, 0, 20.0f, 20.0f)];
    twelfthFretMarker.position = CGPointMake(340 + 225, 227);
    [self.fretBoardLayer addSublayer:twelfthFretMarker];
    
    CALayer *twelfthFretMarker2 = [CALayer layer];
    twelfthFretMarker2.backgroundColor = [UIColor lightGrayColor].CGColor;
    [twelfthFretMarker2 setCornerRadius:10.0f];
    [twelfthFretMarker2 setBounds:CGRectMake(0, 0, 20.0f, 20.0f)];
    twelfthFretMarker2.position = CGPointMake(340 + 225, 315 + 92);
    [self.fretBoardLayer addSublayer:twelfthFretMarker2];
    
    [self.fretBoardLayer addSublayer:self.graphicsForFretboard.lowEstring];
    [self.fretBoardLayer addSublayer:self.graphicsForFretboard.aString];
    [self.fretBoardLayer addSublayer:self.graphicsForFretboard.dString];
    [self.fretBoardLayer addSublayer:self.graphicsForFretboard.gString];
    [self.fretBoardLayer addSublayer:self.graphicsForFretboard.bString];
    [self.fretBoardLayer addSublayer:self.graphicsForFretboard.higheString];
    
    [self.fretBoardLayer addSublayer:self.graphicsForFretboard.testCircle];
    
    self.E3LowEDot = CGPointMake(25, 430);
    self.F3LowEDot = CGPointMake(70, 430);
    self.FSharp3LowEDot = CGPointMake(115, 430);
    self.G3LowEDot = CGPointMake(160, 430);
    self.GSharp3LowEDot = CGPointMake(205, 430);
    self.A3LowEDot = CGPointMake(250, 430);
    self.ASharp3LowEDot = CGPointMake(295, 430);
    self.B3LowEDot = CGPointMake(340, 430);
    self.C4LowEDot = CGPointMake(385, 430);
    self.CSharp4LowEDot = CGPointMake(430, 430);
    self.D4LowEDot = CGPointMake(475, 430);
    self.DSharp4LowEDot = CGPointMake(520, 430);
    self.E4LowEDot = CGPointMake(565, 430);
    
    NSArray *arrayOfCGPointValuesForLowE = [[NSArray alloc] initWithObjects:[NSValue valueWithCGPoint:self.E3LowEDot], [NSValue valueWithCGPoint:self.F3LowEDot], [NSValue valueWithCGPoint:self.FSharp3LowEDot], [NSValue valueWithCGPoint:self.G3LowEDot], [NSValue valueWithCGPoint:self.GSharp3LowEDot], [NSValue valueWithCGPoint:self.A3LowEDot], [NSValue valueWithCGPoint:self.ASharp3LowEDot], [NSValue valueWithCGPoint:self.B3LowEDot], [NSValue valueWithCGPoint:self.C4LowEDot], [NSValue valueWithCGPoint:self.CSharp4LowEDot], [NSValue valueWithCGPoint:self.D4LowEDot], [NSValue valueWithCGPoint:self.DSharp4LowEDot], [NSValue valueWithCGPoint:self.E4LowEDot], nil];
    
    self.arrayOfNoteNames = [[NSArray alloc] initWithObjects:@"C", @"C#", @"D", @"D#", @"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", @"B", @"C", @"C#", @"D", @"D#", @"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", @"B", nil];
    
    NSArray *lowEStringArrayOfNoteNames = [[NSArray alloc] initWithObjects: @"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", @"B", @"C", @"C#", @"D", @"D#", nil];
    NSArray *aStringArrayOfNoteNames = [[NSArray alloc] initWithObjects:@"A", @"A#", @"B", @"C", @"C#", @"D", @"D#", @"E", @"F", @"F#", @"G", @"G#", nil];
    NSArray *dStringArrayOfNoteNames = [[NSArray alloc] initWithObjects:@"D", @"D#", @"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", @"B", @"C", @"C#", nil];
    NSArray *gStringArrayOfNoteNames = [[NSArray alloc] initWithObjects:@"G", @"G#", @"A", @"A#", @"B", @"C", @"C#", @"D", @"D#", @"E", @"F", @"F#", nil];
    NSArray *bStringArrayOfNoteNames = [[NSArray alloc] initWithObjects:@"B", @"C", @"C#", @"D", @"D#", @"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", nil];
    NSArray *highEStringArrayOfNoteNames = [[NSArray alloc] initWithObjects:@"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", @"B", @"C", @"C#", @"D", @"D#", nil];
    
    NSMutableArray *mutableArrayOfLowELayers = [[NSMutableArray alloc] init];

    
    for (int i = 0; i < 12; i++) {
        CALayer *loopLayer = [self spawnCircleLayer];  
        loopLayer.position = [[arrayOfCGPointValuesForLowE objectAtIndex:i] CGPointValue];
        //loopLayer.hidden = YES;
        loopLayer.opacity = 0.0f;
        [mutableArrayOfLowELayers addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    
    NSArray *arrayOfLowELayers = [NSArray arrayWithArray:mutableArrayOfLowELayers];
    self.dictionaryOfLowE = [[NSMutableDictionary alloc] initWithObjects:arrayOfLowELayers forKeys:lowEStringArrayOfNoteNames];
    
    NSMutableArray *indicatorMutableArrayLowE = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; i++) {
        
        CATextLayer *loopLayer = [self spawnTextLayer];
        loopLayer.position = CGPointMake((25 + 45*i), 433);
        //       loopLayer.string = [[lowEStringArrayOfNoteNames objectAtIndex:i] stringByAppendingFormat:@"/m2"];
        loopLayer.string = [lowEStringArrayOfNoteNames objectAtIndex:i];
        loopLayer.opacity = 0.0f;
        [indicatorMutableArrayLowE addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    self.dictionaryOfLabelsLowE = [[NSMutableDictionary alloc] initWithObjects:indicatorMutableArrayLowE forKeys:lowEStringArrayOfNoteNames];
    
    //
    NSMutableArray *mutableArrayOfAStringLayers = [[NSMutableArray alloc] init];

   for (int i = 0; i < 12; i++) {
        CALayer *loopLayer = [self spawnCircleLayer];  
        loopLayer.position = CGPointMake((25 + 45*i), 385);
        //loopLayer.hidden = YES; 
        loopLayer.opacity = 0.0f; 
        [mutableArrayOfAStringLayers addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    NSArray *arrayOfAStringLayers = [NSArray arrayWithArray:mutableArrayOfAStringLayers];
    self.dictionaryOfAString = [[NSMutableDictionary alloc] initWithObjects:arrayOfAStringLayers forKeys:aStringArrayOfNoteNames];
    NSMutableArray *indicatorMutableArrayA = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; i++) {
        
        CATextLayer *loopLayer = [self spawnTextLayer];
        loopLayer.position = CGPointMake((25 + 45*i), 388);
        loopLayer.string = [aStringArrayOfNoteNames objectAtIndex:i];
        loopLayer.opacity = 0.0f;
        [indicatorMutableArrayA addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    self.dictionaryOfLabelsA = [[NSMutableDictionary alloc] initWithObjects:indicatorMutableArrayA forKeys:aStringArrayOfNoteNames];
    
    
    //
    
    NSMutableArray *mutableArrayOfDStringLayers = [[NSMutableArray alloc] init];

    for (int i = 0; i < 12; i++) {
        CALayer *loopLayer = [self spawnCircleLayer];  
        loopLayer.position = CGPointMake((25 + 45*i), 340);
        //loopLayer.hidden = YES; 
        loopLayer.opacity = 0.0f;
        [mutableArrayOfDStringLayers addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    NSArray *arrayOfDStringLayers = [NSArray arrayWithArray:mutableArrayOfDStringLayers];
    self.dictionaryOfDString = [[NSMutableDictionary alloc] initWithObjects:arrayOfDStringLayers forKeys:dStringArrayOfNoteNames];
    NSMutableArray *indicatorMutableArrayD = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; i++) {
        
        CATextLayer *loopLayer = [self spawnTextLayer];
        loopLayer.position = CGPointMake((25 + 45*i), 343);
        loopLayer.string = [dStringArrayOfNoteNames objectAtIndex:i];
        loopLayer.opacity = 0.0f;
        [indicatorMutableArrayD addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    self.dictionaryOfLabelsD = [[NSMutableDictionary alloc] initWithObjects:indicatorMutableArrayD forKeys:dStringArrayOfNoteNames];
    
    
    //
    
    NSMutableArray *mutableArrayOfGStringLayers = [[NSMutableArray alloc] init];

    for (int i = 0; i < 12; i++) {
        CALayer *loopLayer = [self spawnCircleLayer];  
        loopLayer.position = CGPointMake((25 + 45*i), 295);
        //loopLayer.hidden = YES; 
        loopLayer.opacity = 0.0f;
        [mutableArrayOfGStringLayers addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    NSArray *arrayOfGStringLayers = [NSArray arrayWithArray:mutableArrayOfGStringLayers];
    self.dictionaryOfGString = [[NSMutableDictionary alloc] initWithObjects:arrayOfGStringLayers forKeys:gStringArrayOfNoteNames];
    NSMutableArray *indicatorMutableArrayG = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; i++) {
        
        CATextLayer *loopLayer = [self spawnTextLayer];
        loopLayer.position = CGPointMake((25 + 45*i), 298);
        loopLayer.string = [gStringArrayOfNoteNames objectAtIndex:i];
        loopLayer.opacity = 0.0f;
        [indicatorMutableArrayG addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    self.dictionaryOfLabelsG = [[NSMutableDictionary alloc] initWithObjects:indicatorMutableArrayG forKeys:gStringArrayOfNoteNames];
    
    
    //
    
    NSMutableArray *mutableArrayOfBStringLayers = [[NSMutableArray alloc] init];

    for (int i = 0; i < 12; i++) {
        CALayer *loopLayer = [self spawnCircleLayer];  
        loopLayer.position = CGPointMake((25 + 45*i), 250);
        //loopLayer.hidden = YES; 
        loopLayer.opacity = 0.0f;
        [mutableArrayOfBStringLayers addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    NSArray *arrayOfBStringLayers = [NSArray arrayWithArray:mutableArrayOfBStringLayers];
    self.dictionaryOfBString = [[NSMutableDictionary alloc] initWithObjects:arrayOfBStringLayers forKeys:bStringArrayOfNoteNames];
    NSMutableArray *indicatorMutableArrayB = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; i++) {
        
        CATextLayer *loopLayer = [self spawnTextLayer];
        loopLayer.position = CGPointMake((25 + 45*i), 253);
        loopLayer.string = [bStringArrayOfNoteNames objectAtIndex:i];
        loopLayer.opacity = 0.0f;
        [indicatorMutableArrayB addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    self.dictionaryOfLabelsB = [[NSMutableDictionary alloc] initWithObjects:indicatorMutableArrayB forKeys:bStringArrayOfNoteNames];
    
    
    //
    
    NSMutableArray *mutableArrayOfHighEStringLayers = [[NSMutableArray alloc] init];

    for (int i = 0; i < 12; i++) {
        CALayer *loopLayer = [self spawnCircleLayer];  
        loopLayer.position = CGPointMake((25 + 45*i), 205);
        //loopLayer.hidden = YES; 
        loopLayer.opacity = 0.0f;
        [mutableArrayOfHighEStringLayers addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    NSArray *arrayOfHighEStringLayers = [NSArray arrayWithArray:mutableArrayOfHighEStringLayers];
    self.dictionaryOfHighEString = [[NSMutableDictionary alloc] initWithObjects:arrayOfHighEStringLayers forKeys:highEStringArrayOfNoteNames];
    NSMutableArray *indicatorMutableArrayHighE = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; i++) {
        
        CATextLayer *loopLayer = [self spawnTextLayer];
        loopLayer.position = CGPointMake((25 + 45*i), 208);
        loopLayer.string = [highEStringArrayOfNoteNames objectAtIndex:i];
        loopLayer.opacity = 0.0f;
        [indicatorMutableArrayHighE addObject:loopLayer];
        [self.fretBoardLayer addSublayer:loopLayer];
    }
    self.dictionaryOfLabelsHighE = [[NSMutableDictionary alloc] initWithObjects:indicatorMutableArrayHighE forKeys:highEStringArrayOfNoteNames];
    
    

    
    
}

-(void)incrementArrayNamed:(NSString *)arrayName{
    
    
    if (arrayName == @"GSA") {
        
    [self.arrayOfGuitarSources addObject:[GIGuitarSource class]];
    }
    self.arrayOfGuitarSourcesIndexer += 1;
    
    
}
-(void)testPause{
    
}

-(void)setFastMode:(BOOL)fastMode{
    
    fastMode = self.fastMode;

}

-(void)optionsButtonPressed{
    
    [self.view addSubview:self.blurOptions];
    [self.view addSubview:self.saveButton];
    [self.view addSubview:self.cancelButton];
    [self.view addSubview:self.mainMenuButton];
    
}
-(void)cancelPressed{
    
    [self.cancelButton removeFromSuperview];
    [self.saveButton removeFromSuperview];
    [self.mainMenuButton removeFromSuperview];
    [self.blurOptions removeFromSuperview];
    
}
-(void)mainMenu{
    
    [self.cancelButton removeFromSuperview];
    [self.saveButton removeFromSuperview];
    [self.mainMenuButton removeFromSuperview];
    [self.blurOptions removeFromSuperview];
    
    [self.soloDelegate returnFromSoloView];
    
}
-(void)save{

//    NSArray *backArray = [NSArray arrayWithArray:self.qArrayOfStrings];

    // these are all strings that must be decoded in load.  then played direcly in playbacking... ie set the proper properties here, skip bar creator.
    NSArray *solidB = [NSArray arrayWithArray:self.qArrayOfStrings];
    NSArray *solidQ = [NSArray arrayWithArray:self.dataArrayQuarters];
    NSArray *solidE = [NSArray arrayWithArray:self.dataArrayEighths];
    
    [self.soloDelegate saveTheArraysWithBackingArray:solidB quarterSoloArray:solidQ andEighthSoloArray:solidE];
    [self.soloDelegate saveTheTempo:self.tempo];
    
    
    
}

#pragma mark PLAY_

-(void)playButtonPressed{
    
    NSLog(@"Paused");
  /*  self.testLayer = [CALayer layer];
    self.testLayer.backgroundColor = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1].CGColor;
    [self.testLayer setCornerRadius:16.0f];
    [self.testLayer setBounds:CGRectMake(0, 0, 32.0f, 32.0f)];
    self.testLayer.position = CGPointMake(205, 200);
    self.testLayer.shadowOffset = CGSizeMake(0, 2);
    self.testLayer.shadowRadius = 4.0;
    self.testLayer.shadowColor = [UIColor blackColor].CGColor;
    self.testLayer.shadowOpacity = 0.7;
    
    CALayer *layer2 = [CALayer layer];
    layer2.backgroundColor = [UIColor colorWithRed:.5 green:.8 blue:.3 alpha:1].CGColor;
    [layer2 setCornerRadius:16.0f];
    [layer2 setBounds:CGRectMake(0, 0, 32.0f, 32.0f)];
    layer2.position = CGPointMake(205, 245);
    layer2.shadowOffset = CGSizeMake(0, 2);
    layer2.shadowRadius = 4.0;
    layer2.shadowColor = [UIColor blackColor].CGColor;
    layer2.shadowOpacity = 0.7;
    
  // ****  layer.hidden = NO;

    [self.fretBoardLayer addSublayer:layer2];*/
    
    // PUT ON PLAY BUTTON
    
    for (id key in self.dictionaryOfLowE) {
        [[self.dictionaryOfLowE objectForKey:key] removeAllAnimations];
    }
    for (id key in self.dictionaryOfAString) {
        [[self.dictionaryOfAString objectForKey:key] removeAllAnimations];
    }
    for (id key in self.dictionaryOfDString) {
        [[self.dictionaryOfDString objectForKey:key] removeAllAnimations];
    }
    for (id key in self.dictionaryOfGString) {
        [[self.dictionaryOfGString objectForKey:key] removeAllAnimations];
    }
    for (id key in self.dictionaryOfBString) {
        [[self.dictionaryOfBString objectForKey:key] removeAllAnimations];
    }
    for (id key in self.dictionaryOfHighEString) {
        [[self.dictionaryOfHighEString objectForKey:key] removeAllAnimations];
    }
    
    [self.view addSubview:self.blockOptionsButton];

   // [self.graphicsForFretboard.testCircle addAnimation:self.graphicsForFretboard.inAndOut forKey:@"inAndOut"];
    

    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(callMyMethod:) userInfo:[NSDictionary dictionaryWithObjectsAndKeys:self.testArrayQs, @"value1", nil] repeats:NO];
    
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(redDotTimerMethod:) userInfo:nil repeats:NO]; // this time will have to be percentage
                                                                                                                            // of tempo or something constant to work
    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(scaleDelay) userInfo:nil repeats:NO];     // for all times in tempo range
    
    [NSTimer scheduledTimerWithTimeInterval:1 + wholeNoteTime(self.tempo)*self.numberOfBarros*self.tempoConstant target:self selector:@selector(removeBlocker) userInfo:nil repeats:NO];
    
}

-(void)setUpBlockerTimerWithNumberOfBars:(int)numberOfBars{
    
    self.numberOfBarros = numberOfBars;
    NSLog(@"Number Of bars %i", self.numberOfBarros);
    
}
-(void)removeBlocker{
    
    [self.blockOptionsButton removeFromSuperview];
    
}

- (void)callMyMethod:(NSTimer *)theTimer {
    NSMutableArray *value1 = [[theTimer userInfo] objectForKey:@"value1"];
 //   NSMutableArray *value2 = [[theTimer userInfo] objectForKey:@"value2"];
 //   NSMutableArray *value3 = [[theTimer userInfo] objectForKey:@"value3"];

    [self performSelectorInBackground:@selector(playSoloBackingWithArrays:) withObject:value1];
    
    
}
- (void)redDotTimerMethod:(NSTimer *)theRedTimer{
    
     [self unloadTimerArrays];
    [self unloadETimerArrays];
    
    [[NSTimer scheduledTimerWithTimeInterval:quarterNoteTime(self.tempo)*1.1 target:self selector:@selector(timedDot:) userInfo:nil repeats:YES] fire];
    //[NSTimer scheduledTimerWithTimeInterval:quarterNoteTime(self.tempo)*1.1 target:self selector:@selector(timedDot:) userInfo:nil repeats:YES];
   // [NSTimer scheduledTimerWithTimeInterval:halfNoteTime(self.tempo) target:self selector:@selector(timedDot:) userInfo:nil repeats:NO];
      
}

-(void)scaleDelay{
    [self setUpScaleVisuals];
}

- (void)timedDot:(NSTimer *)theTimer{
;
    

    // set root note in gray here.
    
    
    
    if ([self.testLayer superlayer] != nil) {
        [self.testLayer removeFromSuperlayer];
    } else {
    
    [self.fretBoardLayer addSublayer:self.testLayer];
    }
}


-(void)setTempoForSoloAlgorithm:(float)tempoHere{
    
    self.tempo = tempoHere;
    
    if (tempoHere >=90) {
        self.tempoConstant = 1.2;
    } else if (tempoHere <= 40) {
        self.tempoConstant = 1.05;
    } else {
        self.tempoConstant = 1.1;
    }
    
    if (tempoHere >= 80 && tempoHere < 100) {
        self.tempoConstantTwo = 1.1;
    } else if (tempoHere > 99) {
        self.tempoConstantTwo = 1.07;
    } else {
        self.tempoConstantTwo = 1.0;
    }
    
}

#pragma mark SOLO_ALGORITHM

-(void)setUpBackingArraysWith:(NSMutableArray *)q with:(NSMutableArray *)s with:(NSMutableArray *)t{
    
    NSLog(@"okay");
    self.testArrayQs = [NSMutableArray arrayWithArray:q];
    self.testArraySs = [NSMutableArray arrayWithArray:s];
   self.testArrayTs = [NSMutableArray arrayWithArray:t];
    
    
}

-(void)setUpArraysOfStringsForAnalysis:(NSMutableArray *)qArray with:(NSMutableArray *)sArray with:(NSMutableArray *)tArray withKeyIndex:(NSInteger)keyIndex{
    
    self.qArrayOfStrings = [[NSMutableArray alloc] initWithArray:qArray];
    self.sArrayOfStrings = [[NSMutableArray alloc] initWithArray:sArray];
    self.tArrayOfStrings = [[NSMutableArray alloc] initWithArray:tArray];
    
    self.keyIndexHere = keyIndex;
    
    [self soloTimersAndColorsAlgorithmWithArraysOfStrings:self.qArrayOfStrings :self.sArrayOfStrings :self.tArrayOfStrings];
    
    self.keyIndicator = [CATextLayer layer];
    self.keyIndicator.backgroundColor = [UIColor clearColor].CGColor;
    self.keyIndicator.foregroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
    self.keyIndicator.frame = CGRectMake(100, 30, 200, 36);
    self.keyIndicator.opacity = 0.8f;
    [self.keyIndicator setFont:@"STHeitiTC-Medium"];
    [self.keyIndicator setFontSize:25];
    self.keyIndicator.wrapped = NO;
    if (self.keyIndexHere < 12) {
    
        self.keyIndicator.string = [NSString stringWithFormat:@"Key: %@", [self.arrayOfNoteNames objectAtIndex:self.keyIndexHere]];
    }else {
        
        self.keyIndicator.string = [NSString stringWithFormat:@"Key: %@m", [self.arrayOfNoteNames objectAtIndex:self.keyIndexHere]];
    }
    [self.view.layer addSublayer:self.keyIndicator];
    
    
}

-(void)arraysHaveBeenLoadedWith:(NSMutableArray *)backing :(NSMutableArray *)quarters :(NSMutableArray *)eighths{
    
    self.testArrayQs = [NSMutableArray arrayWithArray:backing];
    self.guitarPlayerArrayOfQuarters = [NSMutableArray arrayWithArray:quarters];
    self.guitarPlayerArrayOEighths = [NSMutableArray arrayWithArray:eighths];
    
}




-(void)playSoloBackingWithArrays:(NSMutableArray *)quartersArray{
    
    // add a sleep/timer here that clicks off the performance or do it in delegate...it will be after the solo-parameter/go page...
    
    int localQuarterClicker = 0;
 //   int localSixteenthClicker = 0;
 //   int localTripletClicker = 0;
    
    //self.sixteenthNoteSequence = 0;
    //self.tripletNoteSequence = 0;
    
    for (NSArray *arrayOfChords in quartersArray) {
        if (![arrayOfChords isKindOfClass:[NSArray class]]) {
           // self.sixteenthNoteSequence += 4;
           // self.tripletNoteSequence += 3;
            localQuarterClicker += 1;
            continue;
        }else { // when loaded, these go beyond indeces
        
         
            if (![[self.guitarPlayerArrayOfQuarters objectAtIndex:[quartersArray indexOfObject:arrayOfChords]] isKindOfClass:[AVAudioPlayer class]]) {
                [self.guitarSource.emptyAudioPlayer playAtTime:self.guitarSource.emptyAudioPlayer.deviceCurrentTime + quarterNoteTime(self.tempo)*localQuarterClicker]; 
            }   else {
                
                [[self.guitarPlayerArrayOfQuarters objectAtIndex:[quartersArray indexOfObject:arrayOfChords]] playAtTime:self.guitarSource.guitarC3Player.deviceCurrentTime + quarterNoteTime(self.tempo)*localQuarterClicker];
            }
            
            if (![[self.guitarPlayerArrayOEighths objectAtIndex:[quartersArray indexOfObject:arrayOfChords]] isKindOfClass:[AVAudioPlayer class]]) {
                [self.guitarSource.emptyAudioPlayer playAtTime:self.guitarSource.emptyAudioPlayer.deviceCurrentTime + eighthNoteTime(self.tempo)*localQuarterClicker];
            } else {
                [[self.guitarPlayerArrayOEighths objectAtIndex:[quartersArray indexOfObject:arrayOfChords]] playAtTime:self.guitarSource.guitarC3Player.deviceCurrentTime  + quarterNoteTime(self.tempo)*localQuarterClicker + eighthNoteTime(self.tempo)*self.tempoConstant];
            }
            
            
  
        for (AVAudioPlayer *player in arrayOfChords) {
            [player playAtTime:player.deviceCurrentTime + quarterNoteTime(self.tempo)*localQuarterClicker];
            
            
        }
        localQuarterClicker += 1;   
        
        
    }
    }

    
    
}








-(void)soloTimersAndColorsAlgorithmWithArraysOfStrings:(NSMutableArray *)qStringsArray :(NSMutableArray *)sStringsArray :(NSMutableArray *)tStringsArray{
    
  // this method needs to fill up arrays to be fed and chunked in the solo player and backer player as well as set up visuals, which will be played in sync with an avplayer with a time observer. one for each key?  AVPlayer will not work with variable tempos.  decided on one key only for now.
    

    int localKeyIndex;
    if (self.keyIndexHere > 11) {
        localKeyIndex = self.keyIndexHere - 12;
    } else localKeyIndex = self.keyIndexHere;
    
    NSArray *majorOrMinor = [[NSArray alloc] init];
    
    if (self.keyIndexHere < 12) {
        majorOrMinor = [NSArray arrayWithObjects:self.scaleSelector.ionianScale, self.scaleSelector.lydianScale, self.scaleSelector.mixolydianScale, self.scaleSelector.mixolydianScale, nil];
    } else {
        majorOrMinor = [NSArray arrayWithObjects:self.scaleSelector.dorianScale, self.scaleSelector.phrygianScale, self.scaleSelector.aeolianScale, self.scaleSelector.locrianScale, nil];
    }
    
    // COLOR FOR TIMERS
    
    for (int i = 0; i < 12; i++) {
        
       // this should be okay since each string has all the notes
    
       CALayer *layer = [self.dictionaryOfLowE valueForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        
       layer.backgroundColor = [[self.colorArray objectAtIndex:i] CGColor];
        
      // [self.dictionaryOfLowE removeObjectForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
       [self.dictionaryOfLowE setObject:layer forKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        
    }
    
    for (int i = 0; i < 12; i++) {
        CALayer *layer = [self.dictionaryOfAString valueForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];        
        layer.backgroundColor = [[self.colorArray objectAtIndex:i] CGColor];
      //  [self.dictionaryOfAString removeObjectForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        [self.dictionaryOfAString setObject:layer forKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        
    }
    
    for (int i = 0; i < 12; i++) {
        CALayer *layer = [self.dictionaryOfDString valueForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];        
        layer.backgroundColor = [[self.colorArray objectAtIndex:i] CGColor];
      //  [self.dictionaryOfDString removeObjectForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        [self.dictionaryOfDString setObject:layer forKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        
    }
    for (int i = 0; i < 12; i++) {
        CALayer *layer = [self.dictionaryOfGString valueForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];        
        layer.backgroundColor = [[self.colorArray objectAtIndex:i] CGColor];
      //  [self.dictionaryOfGString removeObjectForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        [self.dictionaryOfGString setObject:layer forKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        
    }
    for (int i = 0; i < 12; i++) {
        CALayer *layer = [self.dictionaryOfBString valueForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];        
        layer.backgroundColor = [[self.colorArray objectAtIndex:i] CGColor];
       // [self.dictionaryOfBString removeObjectForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        [self.dictionaryOfBString setObject:layer forKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        
    }
    for (int i = 0; i < 12; i++) {
        CALayer *layer = [self.dictionaryOfHighEString valueForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];        
        layer.backgroundColor = [[self.colorArray objectAtIndex:i] CGColor];
     //   [self.dictionaryOfHighEString removeObjectForKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        [self.dictionaryOfHighEString setObject:layer forKey:[self.arrayOfNoteNames objectAtIndex:i + localKeyIndex]];
        
    }
    
    // SET UP OF ARRAYS AND TIMERS
    NSMutableArray *quarterPlayers = [[NSMutableArray alloc] init]; // fill with null?  we'll see
    NSMutableArray *eighthPlayers = [[NSMutableArray alloc] init];
  //  NSMutableArray *tripletPlayers = [[NSMutableArray alloc] init];
    
    int localIndexOfQuarterStringArray;
    int firstScaleRoll = arc4random()%40;
    NSArray *chosenArray = [[NSArray alloc] init];
    if (firstScaleRoll <= 10) {
        chosenArray = [majorOrMinor objectAtIndex:0];
        if (self.keyIndexHere < 12) {
            [self.modeNameArray addObject:@"Ionian"];
        } else [self.modeNameArray addObject:@"Dorian"];
        
    } else if (firstScaleRoll > 10 && firstScaleRoll <= 20) {
        chosenArray = [majorOrMinor objectAtIndex:1];
        if (self.keyIndexHere < 12) {
            [self.modeNameArray addObject:@"Lydian"];
        } else [self.modeNameArray addObject:@"Phrygian"];
    } else if (firstScaleRoll > 20 && firstScaleRoll <= 30) {
        chosenArray = [majorOrMinor objectAtIndex:2];
        if (self.keyIndexHere < 12) {
            [self.modeNameArray addObject:@"Mixolydian"];
        } else [self.modeNameArray addObject:@"Aeolian"];
    } else if (firstScaleRoll > 30) {
        chosenArray = [majorOrMinor objectAtIndex:3];
        if (self.keyIndexHere < 12) {
            [self.modeNameArray addObject:@"Mixolydian"];
        } else [self.modeNameArray addObject:@"Locrian"];
    }
    NSLog(@"%@", [self.modeNameArray objectAtIndex:0]);
    
    if ([[self.modeNameArray objectAtIndex:0] isEqualToString:@"Ionian"]) { // must append these with interval names
        
        self.setOfKeyNames = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 2] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 4] stringByAppendingString:@"/3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 5] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 7] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 9] stringByAppendingString:@"/6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 11] stringByAppendingString:@"/7"], nil];

        self.firstScaleNameColor = [self.colorArray objectAtIndex:0];
        
    } else if ([[self.modeNameArray objectAtIndex:0] isEqualToString:@"Dorian"]) {
        self.setOfKeyNames = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major2ndIntervalFromRoot] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor3rdIntervalFromRoot] stringByAppendingString:@"/m3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect4thIntervalFromRoot] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect5thIntervalFromRoot] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major6thIntervalFromRoot] stringByAppendingString:@"/6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor7thIntervalFromRoot] stringByAppendingString:@"/7"], nil];
        
        self.firstScaleNameColor = [self.colorArray objectAtIndex:2];
        
    } else if ([[self.modeNameArray objectAtIndex:0] isEqualToString:@"Phrygian"]) {
        
        self.setOfKeyNames = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor2ndIntervalFromRoot] stringByAppendingString:@"/m2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor3rdIntervalFromRoot] stringByAppendingString:@"/m3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect4thIntervalFromRoot] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect5thIntervalFromRoot] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor6thIntervalFromRoot] stringByAppendingString:@"/m6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor7thIntervalFromRoot] stringByAppendingString:@"/m7"], nil];
        
            self.firstScaleNameColor = [self.colorArray objectAtIndex:4];
        
    } else if ([[self.modeNameArray objectAtIndex:0] isEqualToString:@"Lydian"]) {
        
        self.setOfKeyNames = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major2ndIntervalFromRoot] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major3rdIntervalFromRoot] stringByAppendingString:@"/3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + tritoneIntervalFromRoot] stringByAppendingString:@"/tt"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect5thIntervalFromRoot] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major6thIntervalFromRoot] stringByAppendingString:@"/6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major7thIntervalFromRoot] stringByAppendingString:@"/7"], nil];
        
            self.firstScaleNameColor = [self.colorArray objectAtIndex:5];
        
    } else if ([[self.modeNameArray objectAtIndex:0] isEqualToString:@"Mixolydian"]) {
        
        self.setOfKeyNames = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 2] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 4] stringByAppendingString:@"/3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 5] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 7] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 9] stringByAppendingString:@"/6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 10] stringByAppendingString:@"/m7"], nil];
        
            self.firstScaleNameColor = [self.colorArray objectAtIndex:7];
        
    } else if ([[self.modeNameArray objectAtIndex:0] isEqualToString:@"Aeolian"]) {
        
        self.setOfKeyNames = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major2ndIntervalFromRoot] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor3rdIntervalFromRoot] stringByAppendingString:@"/m3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect4thIntervalFromRoot] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect5thIntervalFromRoot] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor6thIntervalFromRoot] stringByAppendingString:@"/m6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor7thIntervalFromRoot] stringByAppendingString:@"/m7"], nil];
        
            self.firstScaleNameColor = [self.colorArray objectAtIndex:9];
        
    } else if ([[self.modeNameArray objectAtIndex:0] isEqualToString:@"Locrian"]) {
        
        self.setOfKeyNames = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor2ndIntervalFromRoot] stringByAppendingString:@"/m2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor3rdIntervalFromRoot] stringByAppendingString:@"/m3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect4thIntervalFromRoot] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + tritoneIntervalFromRoot] stringByAppendingString:@"/tt"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor6thIntervalFromRoot] stringByAppendingString:@"/m6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor7thIntervalFromRoot] stringByAppendingString:@"/m7"], nil];
       
            self.firstScaleNameColor = [self.colorArray objectAtIndex:11];
    
    }
    [self.timerAddayForScaleVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerScaleDisplay:) userInfo:self.setOfKeyNames repeats:NO]];
    for (NSString *keyNameWithSuffix in self.setOfKeyNames) {
        
        NSString *keyName = [keyNameWithSuffix stringByTrimmingCharactersInSet:self.intervalicCharacters];
        
        [[self.dictionaryOfLabelsHighE objectForKey:keyName] setString:keyNameWithSuffix];
        //[[self.dictionaryOfLabelsHighE objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsB objectForKey:keyName] setString:keyNameWithSuffix];
        //  [[self.dictionaryOfLabelsB objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsG objectForKey:keyName] setString:keyNameWithSuffix];
        // [[self.dictionaryOfLabelsG objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsD objectForKey:keyName] setString:keyNameWithSuffix];
        //[[self.dictionaryOfLabelsD objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsA objectForKey:keyName] setString:keyNameWithSuffix];
        //  [[self.dictionaryOfLabelsA objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsLowE objectForKey:keyName] setString:keyNameWithSuffix];
        //  [[self.dictionaryOfLabelsLowE objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
    }
    
    self.dataArrayQuarters = [[NSMutableArray alloc] init];
    self.dataArrayEighths = [[NSMutableArray alloc] init];
    
    
    
    double number = qStringsArray.count / 2;
    self.quarterNotesPresent = number;
    int firstStringArrayPiece = floor(number);
    
    for (int i = 0; i < firstStringArrayPiece; i++) {
        
        
        
        if (![[qStringsArray objectAtIndex:i] isKindOfClass:[NSString class]]) {
            [quarterPlayers addObject:[NSNull null]];
            [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:@"nil"] repeats:NO]];
            
            [self.dataArrayQuarters addObject:[NSString stringWithFormat:@""]];
            
            continue;
        } else {
            
            
            int silenceRoll = arc4random()%4;
            if (silenceRoll < 2) {
                [quarterPlayers addObject:[NSNull null]];
                [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:@"nil"] repeats:NO]];
                
                [self.dataArrayQuarters addObject:[NSString stringWithFormat:@""]];
                
            } else {
        
                GIGuitarSource *localGuitarSource = [[[self.arrayOfGuitarSources lastObject] alloc] init]; 
               // self.arrayOfGuitarSourcesIndexer += 1;
            
            int roll = arc4random()%6;
            if (roll >= 3) {

                if (self.repeatTimerArray.count == 2) {
                    
                    int arcRandomFinal = arc4random()%2 + 1;
                    
                    [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRandomFinal] intValue])]];
                    [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRandomFinal] intValue])]] repeats:NO]];
                    
                    [self.repeatTimerArray removeAllObjects];
                    
                    [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:arcRandomFinal] intValue])]];
                    
                } else {
                    
                    [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:localKeyIndex]];
                    
                    [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:localKeyIndex]] repeats:NO]]; 
                    [self.repeatTimerArray addObject:[NSNumber numberWithInt:1]];
                    
                    [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", localKeyIndex]];
                    
                }
            }
            else if (roll >= 1 && roll < 3) {
                
                int modalRoll = arc4random()%10;
                
                if (modalRoll < 6) {
                    
                    if (modalRoll >= 2 ) {
                        [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]];
                        [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]] repeats:NO]];
                        
                        [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]];
                        
                    } else {
                        [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]];
                        [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]] repeats:NO]];
                        
                        [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]];
                    }
                    
                }else {
                    
                    
                    
                    int arcRandHere = (arc4random()%3);
                    [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRandHere + 2] intValue])]];
                    
                    [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRandHere + 2] intValue])]] repeats:NO]];  
                    
                    [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:arcRandHere + 2] intValue])]];
                }
            } else {
                
//                int arcRandHereTwo = arc4random()%1;
                [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:localKeyIndex + [[chosenArray objectAtIndex:2] intValue]]];
                
                [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:localKeyIndex + [[chosenArray objectAtIndex:2] intValue]]] repeats:NO]];
                
                [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:2] intValue])]];
                
            }
            
            
            
            
            }}
        [self incrementArrayNamed:@"GSA"];
        localIndexOfQuarterStringArray = i;
    }
    
    
    for (int i = 0; i < firstStringArrayPiece; i++) {
        
        GIGuitarSource *localGuitarSource  = [[[self.arrayOfGuitarSources lastObject] alloc] init]; 
        
        int silenceRoll = arc4random()%8;
        if (silenceRoll < 6) {
            [eighthPlayers addObject:[NSNull null]];
            [self.eTimerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerSixteenthDot:) userInfo:[NSString stringWithFormat:@"nil"] repeats:NO]];
            
            [self.dataArrayEighths addObject:[NSString stringWithFormat:@""]];
        } else {
            
            int modalRoll = arc4random()%10;
            if(modalRoll >= 7){
                
                [eighthPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]];
                [self.eTimerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerSixteenthDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]] repeats:NO]];
                
                [self.dataArrayEighths addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]];
                
            } else if (modalRoll >= 3 && modalRoll < 7) {
                [eighthPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]];
                [self.eTimerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerSixteenthDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]] repeats:NO]];
                
                [self.dataArrayEighths addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]];
                
            } else{
                int arcRand = arc4random()%2 + 3;
                [eighthPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRand] intValue])]];
                [self.eTimerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerSixteenthDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRand] intValue])]] repeats:NO]];
                
                [self.dataArrayEighths addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:arcRand] intValue])]];
            }
            
        }
        [self incrementArrayNamed:@"GSA"];
    }
    
    // DO first round of 16ths and TRIPS here
    [self.repeatTimerArray removeAllObjects];
    // add chosen mode to mode name array
    // choose new array
    //start for loop from i to finish with different scale.
    int singleScaleMoreLikely = arc4random()%50;
    int secondScaleRoll;
    if (singleScaleMoreLikely < 30) {
        
        secondScaleRoll = firstScaleRoll;
        
    } else {
        secondScaleRoll = arc4random()%40;
    }
    
   // int secondScaleRoll = arc4random()%40;
    if (secondScaleRoll <= 10) {
        chosenArray = [majorOrMinor objectAtIndex:0];
        if (self.keyIndexHere < 12) {
            [self.modeNameArray addObject:@"Ionian"];
        } else [self.modeNameArray addObject:@"Dorian"];
        
    } else if (secondScaleRoll > 10 && secondScaleRoll <= 20 ) {
        chosenArray = [majorOrMinor objectAtIndex:1];
        if (self.keyIndexHere < 12) {
            [self.modeNameArray addObject:@"Lydian"];
        } else [self.modeNameArray addObject:@"Phrygian"];
    } else if (secondScaleRoll > 20 && secondScaleRoll <= 30) {
        chosenArray = [majorOrMinor objectAtIndex:2];
        if (self.keyIndexHere < 12) {
            [self.modeNameArray addObject:@"Mixolydian"];
        } else [self.modeNameArray addObject:@"Aeolian"];
    } else if (secondScaleRoll > 30) {
        chosenArray = [majorOrMinor objectAtIndex:3];
        if (self.keyIndexHere < 12) {
            [self.modeNameArray addObject:@"Mixolydian"];
        } else [self.modeNameArray addObject:@"Locrian"];
    }
    NSLog(@"%@", [self.modeNameArray objectAtIndex:1]);
    
    
    if ([[self.modeNameArray objectAtIndex:1] isEqualToString:@"Ionian"]) { // must append these with interval names
        
        self.setOfKeyNames2 = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 2] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 4] stringByAppendingString:@"/3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 5] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 7] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 9] stringByAppendingString:@"/6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 11] stringByAppendingString:@"/7"], nil];
        
        self.secondScaleNameColor = [self.colorArray objectAtIndex:0];
        
    } else if ([[self.modeNameArray objectAtIndex:1] isEqualToString:@"Dorian"]) {
        self.setOfKeyNames2 = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major2ndIntervalFromRoot] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor3rdIntervalFromRoot] stringByAppendingString:@"/m3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect4thIntervalFromRoot] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect5thIntervalFromRoot] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major6thIntervalFromRoot] stringByAppendingString:@"/6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor7thIntervalFromRoot] stringByAppendingString:@"/7"], nil];
        
        self.secondScaleNameColor = [self.colorArray objectAtIndex:2];
        
    } else if ([[self.modeNameArray objectAtIndex:1] isEqualToString:@"Phrygian"]) {
        
        self.setOfKeyNames2 = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor2ndIntervalFromRoot] stringByAppendingString:@"/m2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor3rdIntervalFromRoot] stringByAppendingString:@"/m3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect4thIntervalFromRoot] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect5thIntervalFromRoot] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor6thIntervalFromRoot] stringByAppendingString:@"/m6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor7thIntervalFromRoot] stringByAppendingString:@"/m7"], nil];
        
        self.secondScaleNameColor = [self.colorArray objectAtIndex:4];
        
    } else if ([[self.modeNameArray objectAtIndex:1] isEqualToString:@"Lydian"]) {
        
        self.setOfKeyNames2 = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major2ndIntervalFromRoot] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major3rdIntervalFromRoot] stringByAppendingString:@"/3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + tritoneIntervalFromRoot] stringByAppendingString:@"/tt"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect5thIntervalFromRoot] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major6thIntervalFromRoot] stringByAppendingString:@"/6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major7thIntervalFromRoot] stringByAppendingString:@"/7"], nil];
        
        self.secondScaleNameColor = [self.colorArray objectAtIndex:5];
        
    } else if ([[self.modeNameArray objectAtIndex:1] isEqualToString:@"Mixolydian"]) {
        
        self.setOfKeyNames2 = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 2] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 4] stringByAppendingString:@"/3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 5] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 7] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 9] stringByAppendingString:@"/6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + 10] stringByAppendingString:@"/m7"], nil];
        
        self.secondScaleNameColor = [self.colorArray objectAtIndex:7];
        
    } else if ([[self.modeNameArray objectAtIndex:1] isEqualToString:@"Aeolian"]) {
        
        self.setOfKeyNames2 = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + major2ndIntervalFromRoot] stringByAppendingString:@"/2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor3rdIntervalFromRoot] stringByAppendingString:@"/m3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect4thIntervalFromRoot] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect5thIntervalFromRoot] stringByAppendingString:@"/P5"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor6thIntervalFromRoot] stringByAppendingString:@"/m6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor7thIntervalFromRoot] stringByAppendingString:@"/m7"], nil];
        
        self.secondScaleNameColor = [self.colorArray objectAtIndex:9];
        
    } else if ([[self.modeNameArray objectAtIndex:1] isEqualToString:@"Locrian"]) {
        
        self.setOfKeyNames2 = [[NSMutableArray alloc] initWithObjects:[[self.arrayOfNoteNames objectAtIndex:localKeyIndex] stringByAppendingString:@"/R"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor2ndIntervalFromRoot] stringByAppendingString:@"/m2"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor3rdIntervalFromRoot] stringByAppendingString:@"/m3"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + perfect4thIntervalFromRoot] stringByAppendingString:@"/P4"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + tritoneIntervalFromRoot] stringByAppendingString:@"/tt"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor6thIntervalFromRoot] stringByAppendingString:@"/m6"], [[self.arrayOfNoteNames objectAtIndex:localKeyIndex + minor7thIntervalFromRoot] stringByAppendingString:@"/m7"], nil];
        
        self.secondScaleNameColor = [self.colorArray objectAtIndex:11];
        
    }
    [self.timerAddayForScaleVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerScaleDisplay:) userInfo:self.setOfKeyNames2 repeats:NO]];
    for (NSString *keyNameWithSuffix in self.setOfKeyNames2) {
        
        NSString *keyName = [keyNameWithSuffix stringByTrimmingCharactersInSet:self.intervalicCharacters];
        
        [[self.dictionaryOfLabelsHighE objectForKey:keyName] setString:keyNameWithSuffix];
        //[[self.dictionaryOfLabelsHighE objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsB objectForKey:keyName] setString:keyNameWithSuffix];
      //  [[self.dictionaryOfLabelsB objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsG objectForKey:keyName] setString:keyNameWithSuffix];
       // [[self.dictionaryOfLabelsG objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsD objectForKey:keyName] setString:keyNameWithSuffix];
        //[[self.dictionaryOfLabelsD objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsA objectForKey:keyName] setString:keyNameWithSuffix];
      //  [[self.dictionaryOfLabelsA objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [[self.dictionaryOfLabelsLowE objectForKey:keyName] setString:keyNameWithSuffix];
      //  [[self.dictionaryOfLabelsLowE objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
    }
    
    
    for (int i = localIndexOfQuarterStringArray; i < qStringsArray.count - 1; i++) {
        
        
        if (![[qStringsArray objectAtIndex:i] isKindOfClass:[NSString class]]) {
            [quarterPlayers addObject:[NSNull null]];
            [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:@"nil"] repeats:NO]];
            
            [self.dataArrayQuarters addObject:[NSString stringWithFormat:@""]];
            continue;
        }else {
            
            
             int silenceRollHere = arc4random()%4;
           
      //  self.arrayOfGuitarSourcesIndexer += 1;
        
            if (silenceRollHere == 0) {
                [quarterPlayers addObject:[NSNull null]];
                [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:@"nil"] repeats:NO]];
                
                [self.dataArrayQuarters addObject:[NSString stringWithFormat:@""]];
            } else {
            
             GIGuitarSource *localGuitarSource  = [[[self.arrayOfGuitarSources lastObject] alloc] init];
            
            int roll = arc4random()%6;
            if (roll >= 3) {
                
                if (self.repeatTimerArray.count == 2) {
                    
                    int arcRandomFinal = arc4random()%2 + 1;
    
                        [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRandomFinal] intValue])]];
                        [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRandomFinal] intValue])]] repeats:NO]];
                    
                    [self.repeatTimerArray removeAllObjects];
                    
                    [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:arcRandomFinal] intValue])]];
                } else {
                
                [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:localKeyIndex]];
                
                [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:localKeyIndex]] repeats:NO]]; 
                [self.repeatTimerArray addObject:[NSNumber numberWithInt:1]];
                    
                    [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", localKeyIndex]];
                
                }
              
            }
            else if (roll >= 1 && roll < 3) {
                
                int modalRoll = arc4random()%10;
                
                if (modalRoll <= 6) {
                    
                    if (modalRoll > 2 ) {
                        [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]];
                        [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]] repeats:NO]];
                        
                        [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]];
                    } else {
                        [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]];
                        [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]] repeats:NO]];
                        
                        [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]];
                    }
                    
                }else {
                    
            
                
                int arcRandHere = (arc4random()%3);
                [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRandHere + 2] intValue])]];
                
                [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRandHere + 2] intValue])]] repeats:NO]];  
                    
                    [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:arcRandHere + 2] intValue])]];
                }
             
                
            } else {
                
                int arcRandHereTwo = arc4random()%1;
                [quarterPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:localKeyIndex + [[chosenArray objectAtIndex:arcRandHereTwo] intValue]]];
                
               [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:localKeyIndex + [[chosenArray objectAtIndex:arcRandHereTwo] intValue]]] repeats:NO]];
                
                [self.dataArrayQuarters addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:arcRandHereTwo] intValue])]];
           
            }
            
            // adding to array of timers for visual ques.
            // FIX
           // [self.timerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:quarterNoteTime(self.tempo)*i/*add constant logic*/ target:self selector:@selector(triggerDot) userInfo:[NSDictionary dictionaryWithObjectsAndKeys: nil] repeats:NO]]; // trigger can look at arrays for which layer to animate
            
            
            }}
        [self incrementArrayNamed:@"GSA"];
        
    }
    
    for (int i = localIndexOfQuarterStringArray; i < qStringsArray.count - 1; i++) {
        
        GIGuitarSource *localGuitarSource  = [[[self.arrayOfGuitarSources lastObject] alloc] init]; 
        
        int silenceRoll = arc4random()%8;
        if (silenceRoll < 6) {
            [eighthPlayers addObject:[NSNull null]];
            [self.eTimerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerSixteenthDot:) userInfo:[NSString stringWithFormat:@"nil"] repeats:NO]];
            [self.dataArrayEighths addObject:[NSString stringWithFormat:@""]];
        } else {
            
            int modalRoll = arc4random()%10;
            if(modalRoll >= 8){
                
                [eighthPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]];
                [self.eTimerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerSixteenthDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]] repeats:NO]];
                
                [self.dataArrayEighths addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:5] intValue])]];
                
            } else if (modalRoll >= 4 && modalRoll < 8) {
                [eighthPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]];
                [self.eTimerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerSixteenthDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]] repeats:NO]];
                
                [self.dataArrayEighths addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:3] intValue])]];
            } else{
                int arcRand = arc4random()%1;
                [eighthPlayers addObject:[localGuitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRand] intValue])]];
                [self.eTimerArrayForVisuals addObject:[NSTimer timerWithTimeInterval:0 target:self selector:@selector(triggerSixteenthDot:) userInfo:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:(localKeyIndex + [[chosenArray objectAtIndex:arcRand] intValue])]] repeats:NO]];
                
                [self.dataArrayEighths addObject:[NSString stringWithFormat:@"%i", (localKeyIndex + [[chosenArray objectAtIndex:arcRand] intValue])]];
            }
            
        }
        [self incrementArrayNamed:@"GSA"];
    }
     
    
    self.guitarPlayerArrayOEighths = [NSArray arrayWithArray:eighthPlayers];
    self.guitarPlayerArrayOfQuarters = [NSArray arrayWithArray:quarterPlayers];
    
    
    NSLog(@"Check");
    
    
}


-(void)unloadTimerArrays{

    //this is for quarter notes.  need other timerarrays for other timed notes.
    for (NSTimer *timerEnum in self.timerArrayForVisuals) {

        NSTimer *thisTimer = [NSTimer timerWithTimeInterval:quarterNoteTime(self.tempo)*[self.timerArrayForVisuals indexOfObject:timerEnum]*self.tempoConstant*self.tempoConstantTwo target:self selector:@selector(triggerDot:) userInfo:[timerEnum userInfo] repeats:NO];
        [[NSRunLoop mainRunLoop] addTimer:thisTimer forMode:NSRunLoopCommonModes];
        
    }
    
}

-(void)unloadETimerArrays{
    
    for (NSTimer *timerEnum in self.eTimerArrayForVisuals) {
        
        NSTimer *thisTimer = [NSTimer timerWithTimeInterval:quarterNoteTime(self.tempo)*[self.eTimerArrayForVisuals indexOfObject:timerEnum]*self.tempoConstant*self.tempoConstantTwo + eighthNoteTime(self.tempo)*self.tempoConstant target:self selector:@selector(triggerEDot:) userInfo:[timerEnum userInfo] repeats:NO];
        [[NSRunLoop mainRunLoop] addTimer:thisTimer forMode:NSRunLoopCommonModes];
        
    }
    
}

-(void)triggerDot:(NSTimer *)theTimer{
    
    [self performSelectorInBackground:@selector(animateDot:) withObject:[NSString stringWithFormat:[theTimer userInfo]]];
    
}

-(void)triggerEDot:(NSTimer *)theTimer{
    
    [self performSelectorInBackground:@selector(animateEDot:) withObject:[NSString stringWithFormat:[theTimer userInfo]]];
    
}


-(void)animateDot:(NSString *)theString{
    
    // select object for key identical to theString in dictionaries
    [[self.dictionaryOfHighEString objectForKey:theString] addAnimation:self.graphicsForFretboard.inAndOut forKey:theString];
    [[self.dictionaryOfAString objectForKey:theString] addAnimation:self.graphicsForFretboard.inAndOut forKey:theString];
    [[self.dictionaryOfDString objectForKey:theString] addAnimation:self.graphicsForFretboard.inAndOut forKey:theString];
    [[self.dictionaryOfGString objectForKey:theString] addAnimation:self.graphicsForFretboard.inAndOut forKey:theString];
    [[self.dictionaryOfBString objectForKey:theString] addAnimation:self.graphicsForFretboard.inAndOut forKey:theString];
    [[self.dictionaryOfLowE objectForKey:theString] addAnimation:self.graphicsForFretboard.inAndOut forKey:theString];
        
}

-(void)animateEDot:(NSString *)theString{
    
    [[self.dictionaryOfHighEString objectForKey:theString] addAnimation:self.graphicsForFretboard.eInAndOut forKey:theString];
    [[self.dictionaryOfAString objectForKey:theString] addAnimation:self.graphicsForFretboard.eInAndOut forKey:theString];
    [[self.dictionaryOfDString objectForKey:theString] addAnimation:self.graphicsForFretboard.eInAndOut forKey:theString];
    [[self.dictionaryOfGString objectForKey:theString] addAnimation:self.graphicsForFretboard.eInAndOut forKey:theString];
    [[self.dictionaryOfBString objectForKey:theString] addAnimation:self.graphicsForFretboard.eInAndOut forKey:theString];
    [[self.dictionaryOfLowE objectForKey:theString] addAnimation:self.graphicsForFretboard.eInAndOut forKey:theString];
    
}



-(void)setUpScaleVisuals{
    
    for (NSTimer *timerEnum in self.timerAddayForScaleVisuals) {
        
        NSTimer *thisTimer = [NSTimer timerWithTimeInterval:self.quarterNotesPresent*quarterNoteTime(self.tempo)*[self.timerAddayForScaleVisuals indexOfObject:timerEnum]*self.tempoConstant target:self selector:@selector(triggerScaleDisplay:) userInfo:[timerEnum userInfo] repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:thisTimer forMode:NSRunLoopCommonModes];
        
    }
    
}
-(void)triggerScaleDisplay:(NSTimer *)theTimerHere{
    // add options block?
    [self performSelectorInBackground:@selector(displayScaleInformation:) withObject:[theTimerHere userInfo]];
    NSLog(@"%@", theTimerHere.userInfo);
}
-(void)displayScaleInformation:(NSMutableArray *)scaleName{
    

    self.scaleIn.duration = self.quarterNotesPresent*quarterNoteTime(self.tempo)*self.tempoConstant*1.5;
    self.scaleIn.removedOnCompletion = YES;
    CATextLayer * scaleText = [[CATextLayer alloc] init];
    
 /*   self.firstScaleNameLayer = [self spawnScaleNameTextLayer];
    self.firstScaleNameLayer.foregroundColor = self.firstScaleNameColor.CGColor;
    self.firstScaleNameLayer.string = [self.modeNameArray objectAtIndex:0];
    [self.fretBoardLayer addSublayer:self.firstScaleNameLayer];*/
    
     if (self.switchScaleDisplay == NO) {
        self.firstScaleNameLayer = [self spawnScaleNameTextLayer];
        self.firstScaleNameLayer.foregroundColor = self.firstScaleNameColor.CGColor;
        self.firstScaleNameLayer.string = [[self.arrayOfNoteNames objectAtIndex:self.keyIndexHere] stringByAppendingFormat:@" %@", [[self.modeNameArray objectAtIndex:0] description]];
        self.switchScaleDisplay = YES;    
        scaleText = self.firstScaleNameLayer;
        [self.fretBoardLayer addSublayer:scaleText];
    } else {
        self.secondScaleNameLayer = [self spawnScaleNameTextLayer];
        self.secondScaleNameLayer.foregroundColor = self.secondScaleNameColor.CGColor;
        self.secondScaleNameLayer.string = [[self.arrayOfNoteNames objectAtIndex:self.keyIndexHere] stringByAppendingFormat:@" %@", [[self.modeNameArray objectAtIndex:1] description]];
        self.switchScaleDisplay = NO;
        scaleText = self.secondScaleNameLayer;
        [self.fretBoardLayer addSublayer:scaleText];
    }
    
    
    
    for (NSString *keyNameWithSuffix in scaleName) {
        
        NSString *keyName = [keyNameWithSuffix stringByTrimmingCharactersInSet:self.intervalicCharacters];
        
     //   [[self.dictionaryOfLabelsHighE objectForKey:keyName] setString:keyNameWithSuffix];
        [[self.dictionaryOfLabelsHighE objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
     //   [[self.dictionaryOfLabelsB objectForKey:keyName] setString:keyNameWithSuffix];
        [[self.dictionaryOfLabelsB objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
    //    [[self.dictionaryOfLabelsG objectForKey:keyName] setString:keyNameWithSuffix];
        [[self.dictionaryOfLabelsG objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
   //     [[self.dictionaryOfLabelsD objectForKey:keyName] setString:keyNameWithSuffix];
        [[self.dictionaryOfLabelsD objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
  //      [[self.dictionaryOfLabelsA objectForKey:keyName] setString:keyNameWithSuffix];
        [[self.dictionaryOfLabelsA objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
  //      [[self.dictionaryOfLabelsLowE objectForKey:keyName] setString:keyNameWithSuffix];
        [[self.dictionaryOfLabelsLowE objectForKey:keyName] addAnimation:self.scaleIn forKey:keyName];
        
        [scaleText addAnimation:self.scaleIn forKey:keyName];
        
    }
    

}




-(CALayer *)spawnCircleLayer{
    
    CALayer *circleLayer = [CALayer layer];
    circleLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [circleLayer setCornerRadius:20.0f];
    [circleLayer setBounds:CGRectMake(0, 0, 40.0f, 40.0f)];
    circleLayer.shadowOffset = CGSizeMake(0, 2);
    circleLayer.shadowRadius = 4.0;
    circleLayer.shadowColor = [UIColor blackColor].CGColor;
    circleLayer.shadowOpacity = 0.7;
    circleLayer.opacity = 1;
    //[self.fretBoardLayer addSublayer:circleLayer];
    
    return circleLayer;
    
}

-(CATextLayer *)spawnTextLayer{
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.backgroundColor = [UIColor clearColor].CGColor;
    textLayer.foregroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
    textLayer.alignmentMode = kCAAlignmentCenter;
    //[textLayer setCornerRadius:16.0f];
    [textLayer setFont:@"Arial-BoldMT"];
    [textLayer setFontSize:14];
    [textLayer setBounds:CGRectMake(0, 0, 45.0f, 32.0f)];
    textLayer.wrapped = NO;

    
    return textLayer;
    
    
    /*self.quarterOneText = [CATextLayer layer];
     [self.quarterOneText setFont:@"Arial-BoldMT"];
     [self.quarterOneText setFontSize:13];
     quarterOneText.frame = CGRectMake(-35, 50, 100, 30);
     quarterOneText.string = @"";
     quarterOneText.transform = CATransform3DMakeRotation( - 90.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
     quarterOneText.backgroundColor = [UIColor clearColor].CGColor;
     // testText.position = CGPointMake(0, 0);
     quarterOneText.wrapped = NO;*/
    
}

-(CATextLayer *)spawnScaleNameTextLayer{
    
    int localKeyIndex;
    if (self.keyIndexHere > 11) {
        localKeyIndex = self.keyIndexHere - 12;
    } else localKeyIndex = self.keyIndexHere;
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    textLayer.foregroundColor = [UIColor darkGrayColor].CGColor;
    
    CALayer *lowEKeyLayer = [self.dictionaryOfLowE objectForKey:[NSString stringWithFormat:[self.arrayOfNoteNames objectAtIndex:self.keyIndexHere]]];
    textLayer.position = CGPointMake(lowEKeyLayer.position.x + 90, 150);
    
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.opacity = 0.0f;
    [textLayer setFont:@"Arial-BoldMT"];
    [textLayer setFontSize:30];
    [textLayer setBounds:CGRectMake(0, 0, 230.0f, 32.0f)];
    textLayer.wrapped = NO;
    
    
    return textLayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
