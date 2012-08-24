//
//  GIBarCreatorView.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/12/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GIBarCreatorView.h"
#import "GIPickerView.h"
#import "GIScaleConstants.h"
#import "GIColorsAndViews.h"

@interface GIBarCreatorView() <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) GIPickerView *keyPickerView;
@property (nonatomic, strong) GIPickerView *chordPickerView;
//@property (nonatomic, strong) NSArray *keyPickerViewChoices;
@property (nonatomic, strong) NSMutableArray *chordPickerViewChoices;

@property (nonatomic, strong) CALayer *barEditorBackroundLayer;

@property (nonatomic, strong) UIButton *closeKeyPickerViewButton;
@property (nonatomic, strong) UIView *blurWhilePickingView;
@property (nonatomic, strong) UIButton *closeChordPickerViewButton;
@property (nonatomic, strong) UIView *blurWhilePickingChordView;

//@property (nonatomic, strong) NSArray *arrayOfMajorSevenths;
//@property (nonatomic, strong) NSArray *arrayOfMinorSevenths;

@property (nonatomic, strong) NSArray *timingChoices;

//@property (nonatomic, strong) NSArray *minorChordsForPicker;

@property (nonatomic, strong) UIButton *barButtonWhichIsClear;
@property (nonatomic, strong) UIView *optionsBackround;
@property (nonatomic, strong) UIButton *nextBarButton;
@property (nonatomic, strong) UIButton *quitToMainMenuButton;
@property (nonatomic, strong) UIButton *readyToPlayButton;
@property (nonatomic, strong) UIButton *setTempoButton;
@property (nonatomic, strong) UIButton *cancelOptionsButton;

@property (nonatomic, strong) GIPickerView *tempoPickerView;
@property (nonatomic, strong) UIButton *logTempoFromPickerViewButton;
@property (nonatomic, strong) UIView *blurWhilePickingTempoView;

@property (nonatomic, strong) UIButton *repeatBarButton;
@property (nonatomic, strong) UIButton *freshBarButton;
@property (nonatomic, strong) UIView *blurWhileNewBarOptions;
@property (nonatomic, strong) UIButton *cancelBarOptions;

@property (nonatomic, strong) GIColorsAndViews *colorView;

@property (nonatomic, strong) UIView *colorTest;
@property (nonatomic, strong) CALayer *quarterNoteBlockOne;
@property (nonatomic, strong) CALayer *quarterNoteBlockTwo;
@property (nonatomic, strong) CALayer *quarterNoteBlockThree;
@property (nonatomic, strong) CALayer *quarterNoteBlockFour;
@property (nonatomic, strong) CALayer *sixteenthNoteBlockOneE;
@property (nonatomic, strong) UIView *sixteenthNoteBlockOneAnd;
@property (nonatomic, strong) UIView *sixteenthNoteBlockOneA;
@property (nonatomic, strong) UIView *sixteenthNoteBlockTwoE;
@property (nonatomic, strong) UIView *sixteenthNoteBlockTwoAnd;
@property (nonatomic, strong) UIView *sixteenthNoteBlockTwoA;
@property (nonatomic, strong) UIView *sixteenthNoteBlockThreeE;
@property (nonatomic, strong) UIView *sixteenthNoteBlockThreeAnd;
@property (nonatomic, strong) UIView *sixteenthNoteBlockThreeA;
@property (nonatomic, strong) UIView *sixteenthNoteBlockFourE;
@property (nonatomic, strong) UIView *sixteenthNoteBlockFourAnd;
@property (nonatomic, strong) UIView *sixteenthNoteBlockFourA;

@property (nonatomic, strong) UIView *tripletNoteBlockOneTrip;
@property (nonatomic, strong) UIView *tripletNoteBlockOneLet;
@property (nonatomic, strong) UIView *tripletNoteBlockTwoTrip;
@property (nonatomic, strong) UIView *tripletNoteBlockTwoLet;
@property (nonatomic, strong) UIView *tripletNoteBlockThreeTrip;
@property (nonatomic, strong) UIView *tripletNoteBlockThreeLet;
@property (nonatomic, strong) UIView *tripletNoteBlockFourTrip;
@property (nonatomic, strong) UIView *tripletNoteBlockFourLet;

@property (nonatomic, strong) CATextLayer *quarterOneText;
@property (nonatomic, strong) CATextLayer *quarterTwoText;
@property (nonatomic, strong) CATextLayer *quarterThreeText;
@property (nonatomic, strong) CATextLayer *quarterFourText;

@property (nonatomic, assign) NSInteger keyIndexHere;

@property (nonatomic, strong) UIButton *keyButton;
@property (nonatomic, strong) UIButton *playBarButton;
@property (nonatomic, strong) UIButton *chordButton;


@property (nonatomic, strong) UIImageView *optionsImage;

-(void)keyPickerWheel:(UIButton *)sender;

@end

@implementation GIBarCreatorView

@synthesize optionsImage;

@synthesize keyButton;
@synthesize playBarButton;
@synthesize chordButton;
@synthesize keyIndexHere;

@synthesize delegate;

@synthesize keyPickerView;
@synthesize chordPickerView;
@synthesize keyPickerViewChoices;
@synthesize chordPickerViewChoices;

@synthesize barEditorBackroundLayer;

@synthesize closeKeyPickerViewButton;
@synthesize blurWhilePickingView;
@synthesize closeChordPickerViewButton;
@synthesize blurWhilePickingChordView;

@synthesize arrayOfMajorSevenths;
@synthesize arrayOfMinorSevenths;

@synthesize timingChoices;

@synthesize minorChordsForPicker;

@synthesize barButtonWhichIsClear;
@synthesize optionsBackround;
@synthesize nextBarButton;
@synthesize quitToMainMenuButton;
@synthesize readyToPlayButton;
@synthesize setTempoButton;
@synthesize cancelOptionsButton;

@synthesize tempoPickerView;
@synthesize logTempoFromPickerViewButton;
@synthesize blurWhilePickingTempoView;

@synthesize repeatBarButton;
@synthesize freshBarButton;
@synthesize blurWhileNewBarOptions;
@synthesize cancelBarOptions;

@synthesize colorView;
@synthesize colorTest;

@synthesize quarterNoteBlockOne;
@synthesize quarterNoteBlockTwo;
@synthesize quarterNoteBlockThree;
@synthesize quarterNoteBlockFour;
@synthesize sixteenthNoteBlockOneA;
@synthesize sixteenthNoteBlockOneAnd;
@synthesize sixteenthNoteBlockOneE;

@synthesize sixteenthNoteBlockTwoA;
@synthesize sixteenthNoteBlockTwoAnd;
@synthesize sixteenthNoteBlockTwoE;

@synthesize sixteenthNoteBlockFourA;
@synthesize sixteenthNoteBlockFourE;
@synthesize sixteenthNoteBlockThreeA;
@synthesize sixteenthNoteBlockThreeE;
@synthesize sixteenthNoteBlockFourAnd;
@synthesize sixteenthNoteBlockThreeAnd;

@synthesize tripletNoteBlockOneLet;
@synthesize tripletNoteBlockOneTrip;
@synthesize tripletNoteBlockTwoLet;
@synthesize tripletNoteBlockTwoTrip;
@synthesize tripletNoteBlockFourLet;
@synthesize tripletNoteBlockFourTrip;
@synthesize tripletNoteBlockThreeLet;
@synthesize tripletNoteBlockThreeTrip;

@synthesize quarterOneText;
@synthesize quarterTwoText;
@synthesize quarterThreeText;
@synthesize quarterFourText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        backgroundImage.alpha = 0.5f;
        backgroundImage.image = [UIImage imageNamed:@"GIBarBackgroundRedo.png"];
        [self addSubview:backgroundImage];
    
        self.keyPickerView = [[GIPickerView alloc] init];
        self.keyPickerView.tag = 1;
        self.keyPickerView.delegate = self;
        self.keyPickerView.dataSource = self;
        // Set the picker's frame. We set the y coordinate to 50px.
        [self.keyPickerView setFrame: CGRectMake(0, 300, 320, 200)];
       // self.pickerView.transform = CGAffineTransformMakeScale(1, 2);
        // Before we add the picker view to our view, let's do a couple more
        // things. First, let the selection indicator (that line inside the
        // picker view that highlights your selection) to be shown.
        self.keyPickerView.showsSelectionIndicator = YES;
        //Allow us to pre-select the third option in the pickerView.
        //[self.pickerView selectRow:2 inComponent:0 animated:YES];
        self.keyPickerViewChoices = [[NSArray alloc] initWithObjects:@"C", @"C#/Db", @"D", @"D#/Eb", @"E", @"F", @"F#/Gb", @"G", @"G#/Ab", @"A", @"A#/Bb", @"B", @"C", @"C#/Db", @"D", @"D#/Eb", @"E", @"F", @"F#/Gb", @"G", @"G#/Ab", @"A", @"A#/Bb", @"B", @"C minor", @"C#/Db minor", @"D minor", @"D#/Eb minor", @"E minor", @"F minor", @"F#/Gb minor", @"G minor", @"G#/Ab minor", @"A minor", @"A#/Bb minor", @"B minor", @"C minor", @"C#/Db minor", @"D minor", @"D#/Eb minor", @"E minor", @"F minor", @"F#/Gb minor", @"G minor", @"G#/Ab minor", @"A minor", @"A#/Bb minor", @"B minor", nil];
                                     
        self.minorChordsForPicker = [[NSArray alloc] initWithObjects:@"C minor", @"C#/Db minor", @"D minor", @"D#/Eb minor", @"E minor", @"F minor", @"F#/Gb minor", @"G minor", @"G#/Ab minor", @"A minor", @"A#/Bb minor", @"B minor", @"C minor", @"C#/Db minor", @"D minor", @"D#/Eb minor", @"E minor", @"F minor", @"F#/Gb minor", @"G minor", @"G#/Ab minor", @"A minor", @"A#/Bb minor", @"B minor", @"C minor", @"C#/Db minor", @"D minor", @"D#/Eb minor", @"E minor", @"F minor", @"F#/Gb minor", @"G minor", @"G#/Ab minor", @"A minor", @"A#/Bb minor", @"B minor", nil];
                                     
                                      
        
        self.arrayOfMajorSevenths = [[NSArray alloc] initWithObjects:@"C7", @"C#/Db7", @"D7", @"D#/Eb7", @"E7", @"F7", @"F#/Gb7", @"G7", @"G#/Ab7", @"A7", @"A#/Bb7", @"B7", @"C7", @"C#/Db7", @"D7", @"D#/Eb7", @"E7", @"F7", @"F#/Gb7", @"G7", @"G#/Ab7", @"A7", @"A#/Bb7", @"B7", @"C7", @"C#/Db7", @"D7", @"D#/Eb7", @"E7", @"F7", @"F#/Gb7", @"G7", @"G#/Ab7", @"A7", @"A#/Bb7", @"B7", nil];
        self.arrayOfMinorSevenths = [[NSArray alloc] initWithObjects:@"C7 minor", @"C#/Db7 minor", @"D7 minor", @"D#/Eb7 minor", @"E7 minor", @"F7 minor", @"F#/Gb7 minor", @"G7 minor", @"G#/Ab7 minor", @"A7 minor", @"A#/Bb7 minor", @"B7 minor", @"C7 minor", @"C#/Db7 minor", @"D7 minor", @"D#/Eb7 minor", @"E7 minor", @"F7 minor", @"F#/Gb7 minor", @"G7 minor", @"G#/Ab7 minor", @"A7 minor", @"A#/Bb7 minor", @"B7 minor", @"C7 minor", @"C#/Db7 minor", @"D7 minor", @"D#/Eb7 minor", @"E7 minor", @"F7 minor", @"F#/Gb7 minor", @"G7 minor", @"G#/Ab7 minor", @"A7 minor", @"A#/Bb7 minor", @"B7 minor", nil];
        
        self.timingChoices = [[NSArray alloc] initWithObjects:@"", @"e", @"&", @"a", @"trip", @"let", nil];
        
        
        self.chordPickerView = [[GIPickerView alloc] init];
        self.chordPickerView.tag = 2;
        self.chordPickerView.delegate = self;
        self.chordPickerView.dataSource = self;
        [self.chordPickerView setFrame:CGRectMake(0, 300, 320, 200)];
        self.chordPickerView.showsSelectionIndicator = YES;
        
        self.chordPickerViewChoices = [[NSMutableArray alloc] init];
        
        
        self.tempoPickerView = [[GIPickerView alloc] initWithFrame:CGRectMake(0, 300, 320, 200)];
        self.tempoPickerView.tag = 3;
        self.tempoPickerView.delegate = self;
        self.tempoPickerView.dataSource = self;
        self.chordPickerView.showsSelectionIndicator = YES;
        
        
        self.blurWhilePickingView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 320, 130)];
        self.blurWhilePickingView.backgroundColor = [UIColor whiteColor];
        self.blurWhilePickingView.alpha = 0.5f;
        
        self.blurWhilePickingChordView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 320, 50)];
        self.blurWhilePickingChordView.backgroundColor = [UIColor whiteColor];
        self.blurWhilePickingChordView.alpha = 0.5f;
        
        self.blurWhilePickingTempoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
        self.blurWhilePickingTempoView.backgroundColor = [UIColor whiteColor];
        self.blurWhilePickingTempoView.alpha = 0.6f;
        
        
        self.barEditorBackroundLayer = [CALayer layer];
        self.barEditorBackroundLayer.frame = CGRectMake(0, 0, 320, 150);
        //self.barEditorBackroundLayer = [[CALayer alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
        self.barEditorBackroundLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
      //  [self addSubview:self.barEditorBackroundLayer];
        [self.layer addSublayer:self.barEditorBackroundLayer];
        
        
        
        
        
        self.colorTest = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
        self.colorTest.backgroundColor = [UIColor lightGrayColor];
        
        
        NSURL *glareURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"BarGlare1" ofType:@"png"]];
        NSData *glareData = [[NSData alloc] initWithContentsOfURL:glareURL];
        UIImage *glareImage = [UIImage imageWithData:glareData];
        
        
        
        self.barButtonWhichIsClear = [UIButton buttonWithType:UIButtonTypeCustom];
        self.barButtonWhichIsClear.frame = CGRectMake(0, 0, 320, 150);
       // barButtonWhichIsClear.backgroundColor = [UIColor whiteColor];
        [self.barButtonWhichIsClear setBackgroundImage:glareImage forState:UIControlStateNormal];
        self.barButtonWhichIsClear.alpha = 0.3f;
       // [barButtonWhichIsClear.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
        //[barButtonWhichIsClear.titleLabel setTextColor:[UIColor whiteColor]];
        //[barButtonWhichIsClear setTitle:@"Play Bar" forState:UIControlStateNormal];
        [self.barButtonWhichIsClear addTarget:self action:@selector(displayOptions) forControlEvents:UIControlEventTouchUpInside];
        //[barButtonWhichIsClear setBackgroundImage:highlighter forState:UIControlStateHighlighted];
        
        [self addSubview:self.barButtonWhichIsClear];
        
        


        
        NSURL *keyButtonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIK" ofType:@"png"]];
        NSData *keyButtonData = [[NSData alloc] initWithContentsOfURL:keyButtonURL];
        UIImage *keyButtonImage = [UIImage imageWithData:keyButtonData];
        
        NSURL *keyButtonPressedURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIKH" ofType:@"png"]];
        NSData *keyButtonPressedData = [[NSData alloc] initWithContentsOfURL:keyButtonPressedURL];
        UIImage *keyButtonPressedImage = [UIImage imageWithData:keyButtonPressedData];

        NSURL *chordButtonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIC" ofType:@"png"]];
        NSData *chordButtonData = [[NSData alloc] initWithContentsOfURL:chordButtonURL];
        UIImage *chordButtonImage = [UIImage imageWithData:chordButtonData];
        
        NSURL *chordButtonPressedURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GICH" ofType:@"png"]];
        NSData *chordButtonPressedData = [[NSData alloc] initWithContentsOfURL:chordButtonPressedURL];
        UIImage *chordButtonPressedImage = [UIImage imageWithData:chordButtonPressedData];
        
        NSURL *playButtonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIPB" ofType:@"png"]];
        NSData *playButtonData = [[NSData alloc] initWithContentsOfURL:playButtonURL];
        UIImage *playButtonImage = [UIImage imageWithData:playButtonData];
        
        NSURL *playButtonPressedURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIPBH" ofType:@"png"]];
        NSData *playButtonPressedData = [[NSData alloc] initWithContentsOfURL:playButtonPressedURL];
        UIImage *playButtonPressedImage = [UIImage imageWithData:playButtonPressedData];
        

        self.keyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.keyButton.frame = CGRectMake(10, 160, 300, 150);
        [self.keyButton setBackgroundImage:keyButtonImage forState:UIControlStateNormal];
      //  self.keyButton.backgroundColor = [UIColor darkGrayColor];
     //   [self.keyButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
    //    [self.keyButton.titleLabel setTextColor:[UIColor whiteColor]];
      //  [self.keyButton setTitle:@"Key" forState:UIControlStateNormal];
        [self.keyButton addTarget:self action:@selector(keyPickerWheel:) forControlEvents:UIControlEventTouchUpInside];
        [self.keyButton setBackgroundImage:keyButtonPressedImage forState:UIControlStateHighlighted];
        
        [self addSubview:keyButton];
        
        self.playBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.playBarButton.frame = CGRectMake(10, 160, 300, 150);
        [self.playBarButton setBackgroundImage:playButtonImage forState:UIControlStateNormal];
        [self.playBarButton addTarget:self action:@selector(playBarMethod) forControlEvents:UIControlEventTouchUpInside];
//        self.playBarButton.adjustsImageWhenHighlighted = YES;
        [self.playBarButton setBackgroundImage:playButtonPressedImage forState:UIControlStateHighlighted];
        
        self.chordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.chordButton.frame = CGRectMake(10, 320, 300, 150);
        //    chordButton.backgroundColor = [UIColor darkGrayColor];
        [self.chordButton setBackgroundImage:chordButtonImage forState:UIControlStateNormal];
   //     [self.chordButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
   //     [self.chordButton.titleLabel setTextColor:[UIColor whiteColor]];
  //      [self.chordButton setTitle:@"Chord" forState:UIControlStateNormal];
        [self.chordButton addTarget:self action:@selector(chordPickerWheel) forControlEvents:UIControlEventTouchUpInside];
        [self.chordButton setBackgroundImage:chordButtonPressedImage forState:UIControlStateHighlighted];
        
       // [self addSubview:self.chordButton];
        
  /*      self.playBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.playBarButton.frame = CGRectMake(10, 160, 300, 150);
        //    playBar.backgroundColor = [UIColor darkGrayColor];
        [chordButton setImage:[UIImage imageNamed:@"GIPlayBar.png"] forState:UIControlStateNormal];    
      //  [self.playBarButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
   //     [self.playBarButton.titleLabel setTextColor:[UIColor whiteColor]];
   //     [self.playBarButton setTitle:@"Play Bar" forState:UIControlStateNormal];
        [self.playBarButton addTarget:self action:@selector(playBarMethod) forControlEvents:UIControlEventTouchUpInside];
        [self.playBarButton setBackgroundImage:[UIImage imageNamed:@"GIPlayBarPressed.png"] forState:UIControlStateHighlighted];
        */
        
        
        
        
        // for options
        self.optionsBackround = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        self.optionsBackround.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        
        self.optionsBackround.alpha = 0.8;
        
        
        
        NSURL *NBButtonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GISmallNB" ofType:@"png"]];
        NSData *NBButtonData = [[NSData alloc] initWithContentsOfURL:NBButtonURL];
        UIImage *NBButtonImage = [UIImage imageWithData:NBButtonData];
        
        self.nextBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextBarButton.frame = CGRectMake(10, 10, 140, 140);
    //    self.nextBarButton.backgroundColor = [UIColor darkGrayColor];
        [self.nextBarButton setBackgroundImage:NBButtonImage forState:UIControlStateNormal];
    //    [self.nextBarButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
     //   [self.nextBarButton.titleLabel setTextColor:[UIColor whiteColor]];
    //    [self.nextBarButton setTitle:@"Next Bar" forState:UIControlStateNormal];
        [self.nextBarButton addTarget:self action:@selector(nextBarOptions) forControlEvents:UIControlEventTouchUpInside];
        [self.nextBarButton setBackgroundImage:[UIImage imageNamed:@"GISmallNBH"] forState:UIControlStateHighlighted];
        
        self.readyToPlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.readyToPlayButton.frame = CGRectMake(10, 320, 300, 150);
        [self.readyToPlayButton setBackgroundImage:[UIImage imageNamed:@"GIOR.png"] forState:UIControlStateNormal];
    //    self.readyToPlayButton.backgroundColor = [UIColor darkGrayColor];
    //    [self.readyToPlayButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
   //     [self.readyToPlayButton.titleLabel setTextColor:[UIColor whiteColor]];
  //      [self.readyToPlayButton setTitle:@"Composition is Ready to Play" forState:UIControlStateNormal];
        [self.readyToPlayButton addTarget:self action:@selector(compositionIsReadyToPlay) forControlEvents:UIControlEventTouchUpInside];
        [self.readyToPlayButton setBackgroundImage:[UIImage imageNamed:@"GIORH.png"] forState:UIControlStateHighlighted];
        
        self.setTempoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.setTempoButton.frame = CGRectMake(170, 10, 140, 140);
        [self.setTempoButton setBackgroundImage:[UIImage imageNamed:@"GISmallST.png"] forState:UIControlStateNormal];
  //      self.setTempoButton.backgroundColor = [UIColor darkGrayColor];
   //     [self.setTempoButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
    //    [self.setTempoButton.titleLabel setTextColor:[UIColor whiteColor]];
     //   [self.setTempoButton setTitle:@"Set Tempo" forState:UIControlStateNormal];
        [self.setTempoButton addTarget:self action:@selector(setTempoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.setTempoButton setBackgroundImage:[UIImage imageNamed:@"GISmallSTH.png"] forState:UIControlStateHighlighted];
        
        self.cancelOptionsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelOptionsButton.frame = CGRectMake(10, 170, 140, 140);
        [self.cancelOptionsButton setBackgroundImage:[UIImage imageNamed:@"GISmallB.png"] forState:UIControlStateNormal];
 //       self.cancelOptionsButton.backgroundColor = [UIColor darkGrayColor];
  //      [self.cancelOptionsButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
   //     [self.cancelOptionsButton.titleLabel setTextColor:[UIColor whiteColor]];
    //    [self.cancelOptionsButton setTitle:@"Back" forState:UIControlStateNormal];
        [self.cancelOptionsButton addTarget:self action:@selector(cancelOptions) forControlEvents:UIControlEventTouchUpInside];
        [self.cancelOptionsButton setBackgroundImage:[UIImage imageNamed:@"GISmallBH.png"] forState:UIControlStateHighlighted];
        
        self.quitToMainMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.quitToMainMenuButton.frame = CGRectMake(170, 170, 140, 140);
        [self.quitToMainMenuButton setBackgroundImage:[UIImage imageNamed:@"GISmallMM.png"] forState:UIControlStateNormal];
 //       self.quitToMainMenuButton.backgroundColor = [UIColor darkGrayColor];
  //      [self.quitToMainMenuButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
   //     [self.quitToMainMenuButton.titleLabel setTextColor:[UIColor whiteColor]];
    //    [self.quitToMainMenuButton setTitle:@"Exit to Main Menu" forState:UIControlStateNormal];
        [self.quitToMainMenuButton addTarget:self action:@selector(quitToMainMenu) forControlEvents:UIControlEventTouchUpInside];
        [self.quitToMainMenuButton setBackgroundImage:[UIImage imageNamed:@"GISmallMMH.png"] forState:UIControlStateHighlighted];
        
        
        
        // subview buttons
        NSURL *closeKeyButtonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GILK" ofType:@"png"]];
        NSData *closeKeyButtonData = [[NSData alloc] initWithContentsOfURL:closeKeyButtonURL];
        UIImage *closeKeyButtonImage = [UIImage imageWithData:closeKeyButtonData];
        
        NSURL *closeKeyPressedURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GILKH" ofType:@"png"]];
        NSData *closeKeyPressedData = [[NSData alloc] initWithContentsOfURL:closeKeyPressedURL];
        UIImage *closeKeyPressedImage = [UIImage imageWithData:closeKeyPressedData];
        
        NSURL *logChordButtonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GILC" ofType:@"png"]];
        NSData *logChordButtonData = [[NSData alloc] initWithContentsOfURL:logChordButtonURL];
        UIImage *logChordButtonImage = [UIImage imageWithData:logChordButtonData];
        
        NSURL *logChordPressedURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GILCH" ofType:@"png"]];
        NSData *logChordPressedData = [[NSData alloc] initWithContentsOfURL:logChordPressedURL];
        UIImage *logChordPressedImage = [UIImage imageWithData:logChordPressedData];
        
        
        self.closeKeyPickerViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.closeKeyPickerViewButton.frame = CGRectMake(0, 150, 320, 150);
        [self.closeKeyPickerViewButton setBackgroundImage:closeKeyButtonImage forState:UIControlStateNormal];
//        self.closeKeyPickerViewButton.backgroundColor = [UIColor darkGrayColor];
       // [self.closeKeyPickerViewButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
      //  [self.closeKeyPickerViewButton.titleLabel setTextColor:[UIColor whiteColor]];
     //   [self.closeKeyPickerViewButton setTitle:@"Log Key" forState:UIControlStateNormal];
        [self.closeKeyPickerViewButton addTarget:self action:@selector(logKeyButtonFromKeyPickerViewPushedWithRow:inComponent:) forControlEvents:UIControlEventTouchUpInside];
        [self.closeKeyPickerViewButton setBackgroundImage:closeKeyPressedImage forState:UIControlStateHighlighted];
        
        self.closeChordPickerViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.closeChordPickerViewButton.frame = CGRectMake(0, 150, 320, 150);
        [self.closeChordPickerViewButton setBackgroundImage:logChordButtonImage forState:UIControlStateNormal];
    //    self.closeChordPickerViewButton.backgroundColor = [UIColor darkGrayColor];
    //    [self.closeChordPickerViewButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
   //     [self.closeChordPickerViewButton.titleLabel setTextColor:[UIColor whiteColor]];
   //     [self.closeChordPickerViewButton setTitle:@"Log Chord" forState:UIControlStateNormal];
        [self.closeChordPickerViewButton addTarget:self action:@selector(logChordButton) forControlEvents:UIControlEventTouchUpInside];
        [self.closeChordPickerViewButton setBackgroundImage:logChordPressedImage forState:UIControlStateHighlighted];
        
        NSURL *logTempoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GILT" ofType:@"png"]];
        NSData *logTempoData = [[NSData alloc] initWithContentsOfURL:logTempoURL];
        UIImage *logTempoImage = [UIImage imageWithData:logTempoData];
        
        NSURL *logTempoPressedURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GILTH" ofType:@"png"]];
        NSData *logTempoPressedData = [[NSData alloc] initWithContentsOfURL:logTempoPressedURL];
        UIImage *logTempoPressedImage = [UIImage imageWithData:logTempoPressedData];
        
        self.logTempoFromPickerViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.logTempoFromPickerViewButton.frame = CGRectMake(0, 150, 320, 150);
        [self.logTempoFromPickerViewButton setBackgroundImage:logTempoImage forState:UIControlStateNormal];
      //  self.logTempoFromPickerViewButton.backgroundColor = [UIColor darkGrayColor];
       // [self.logTempoFromPickerViewButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
       // [self.logTempoFromPickerViewButton.titleLabel setTextColor:[UIColor whiteColor]];
       // [self.logTempoFromPickerViewButton setTitle:@"Log Tempo" forState:UIControlStateNormal];
        [self.logTempoFromPickerViewButton addTarget:self action:@selector(logTempoFromPickerView) forControlEvents:UIControlEventTouchUpInside];
        [self.logTempoFromPickerViewButton setBackgroundImage:logTempoPressedImage forState:UIControlStateHighlighted];
        
    /*    self.repeatBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.repeatBarButton.frame = CGRectMake(0, 20, 320, 80);
        self.repeatBarButton.backgroundColor = [UIColor darkGrayColor];
        [self.repeatBarButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
        [self.repeatBarButton.titleLabel setTextColor:[UIColor whiteColor]];
        [self.repeatBarButton setTitle:@"Repeat Bar" forState:UIControlStateNormal];
        [self.repeatBarButton addTarget:self action:@selector(repeatBarMethod) forControlEvents:UIControlEventTouchUpInside];
        [self.repeatBarButton setBackgroundImage:highlighter forState:UIControlStateHighlighted];
        
        self.freshBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.freshBarButton.frame = CGRectMake(0, 130, 320, 80);
        self.freshBarButton.backgroundColor = [UIColor darkGrayColor];
        [self.freshBarButton.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
        [self.freshBarButton.titleLabel setTextColor:[UIColor whiteColor]];
        [self.freshBarButton setTitle:@"New Bar" forState:UIControlStateNormal];
        [self.freshBarButton addTarget:self action:@selector(freshBarMethod) forControlEvents:UIControlEventTouchUpInside];
        [self.freshBarButton setBackgroundImage:highlighter forState:UIControlStateHighlighted];*/
        
        self.blurWhileNewBarOptions = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        self.blurWhileNewBarOptions.backgroundColor = [UIColor whiteColor];
        self.blurWhileNewBarOptions.alpha = 0.7f;
        
     /*   self.cancelBarOptions = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelBarOptions.frame = CGRectMake(0, 360, 320, 80);
        self.cancelBarOptions.backgroundColor = [UIColor darkGrayColor];
        [self.cancelBarOptions.titleLabel setFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:20]];
        [self.cancelBarOptions.titleLabel setTextColor:[UIColor whiteColor]];
        [self.cancelBarOptions setTitle:@"Back" forState:UIControlStateNormal];
        [self.cancelBarOptions addTarget:self action:@selector(cancelBarOptionsMethod) forControlEvents:UIControlEventTouchUpInside];
        [self.cancelBarOptions setBackgroundImage:highlighter forState:UIControlStateHighlighted];*/
        
        // blocks
        
        self.colorView = [[GIColorsAndViews alloc] init];
        
        self.quarterNoteBlockOne = [CALayer layer];
        self.quarterNoteBlockOne.backgroundColor = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1].CGColor;
        self.quarterNoteBlockOne.frame = CGRectMake(0, 0, 80, 150);
        self.quarterNoteBlockOne.shadowOffset = CGSizeMake(0, 3);
        self.quarterNoteBlockOne.shadowRadius = 5.0;
        self.quarterNoteBlockOne.shadowColor = [UIColor blackColor].CGColor;
        self.quarterNoteBlockOne.shadowOpacity = 0.8;
        self.quarterNoteBlockOne.hidden = YES;
        
        self.quarterNoteBlockTwo = [CALayer layer];
        self.quarterNoteBlockTwo.backgroundColor = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1].CGColor;
        self.quarterNoteBlockTwo.frame = CGRectMake(80, 0, 80, 150);
        self.quarterNoteBlockTwo.shadowOffset = CGSizeMake(0, 3);
        self.quarterNoteBlockTwo.shadowRadius = 5.0;
        self.quarterNoteBlockTwo.shadowColor = [UIColor blackColor].CGColor;
        self.quarterNoteBlockTwo.shadowOpacity = 0.8;
        self.quarterNoteBlockTwo.hidden = YES;
        
        self.quarterNoteBlockThree = [CALayer layer];
        self.quarterNoteBlockThree.backgroundColor = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1].CGColor;
        self.quarterNoteBlockThree.frame = CGRectMake(160, 0, 80, 150);
        self.quarterNoteBlockThree.shadowOffset = CGSizeMake(0, 3);
        self.quarterNoteBlockThree.shadowRadius = 5.0;
        self.quarterNoteBlockThree.shadowColor = [UIColor blackColor].CGColor;
        self.quarterNoteBlockThree.shadowOpacity = 0.8;
        self.quarterNoteBlockThree.hidden = YES;
        
        self.quarterNoteBlockFour = [CALayer layer];
        self.quarterNoteBlockFour.backgroundColor = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1].CGColor;
        self.quarterNoteBlockFour.frame = CGRectMake(240, 0, 80, 150);
        self.quarterNoteBlockFour.shadowOffset = CGSizeMake(0, 3);
        self.quarterNoteBlockFour.shadowRadius = 5.0;
        self.quarterNoteBlockFour.shadowColor = [UIColor blackColor].CGColor;
        self.quarterNoteBlockFour.shadowOpacity = 0.8;
        self.quarterNoteBlockFour.hidden = YES;
        
        [self.barEditorBackroundLayer addSublayer:self.quarterNoteBlockOne];
        [self.barEditorBackroundLayer addSublayer:self.quarterNoteBlockTwo];
        [self.barEditorBackroundLayer addSublayer:self.quarterNoteBlockThree];
        [self.barEditorBackroundLayer addSublayer:self.quarterNoteBlockFour];
        
        
        
        
        
        
        self.quarterOneText = [CATextLayer layer];
        [self.quarterOneText setFont:@"STHeitiTC-Medium"];
        [self.quarterOneText setFontSize:13];
        quarterOneText.frame = CGRectMake(-35, 50, 100, 30);
        quarterOneText.string = @"";
        quarterOneText.transform = CATransform3DMakeRotation( - 90.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
        quarterOneText.backgroundColor = [UIColor clearColor].CGColor;
       // testText.position = CGPointMake(0, 0);
        quarterOneText.wrapped = NO;
        
        self.quarterTwoText = [CATextLayer layer];
        [self.quarterTwoText setFont:@"STHeitiTC-Medium"];
        [self.quarterTwoText setFontSize:13];
        quarterTwoText.frame = CGRectMake(-35, 50, 100, 30);
        quarterTwoText.string = @"";
        quarterTwoText.transform = CATransform3DMakeRotation( - 90.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
        quarterTwoText.backgroundColor = [UIColor clearColor].CGColor;
        // testText.position = CGPointMake(0, 0);
        quarterTwoText.wrapped = NO;
        
        self.quarterThreeText = [CATextLayer layer];
        [self.quarterThreeText setFont:@"STHeitiTC-Medium"];
        [self.quarterThreeText setFontSize:13];
        quarterThreeText.frame = CGRectMake(-35, 50, 100, 30);
        quarterThreeText.string = @"";
        quarterThreeText.transform = CATransform3DMakeRotation( - 90.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
        quarterThreeText.backgroundColor = [UIColor clearColor].CGColor;
        // testText.position = CGPointMake(0, 0);
        quarterThreeText.wrapped = NO;
       
        self.quarterFourText = [CATextLayer layer];
        [self.quarterFourText setFont:@"STHeitiTC-Medium"];
        [self.quarterFourText setFontSize:13];
        quarterFourText.frame = CGRectMake(-35, 50, 100, 30);
        quarterFourText.string = @"";
        quarterFourText.transform = CATransform3DMakeRotation( - 90.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
        quarterFourText.backgroundColor = [UIColor clearColor].CGColor;
        // testText.position = CGPointMake(0, 0);
        quarterFourText.wrapped = NO;
        
        self.quarterOneText.foregroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
        self.quarterTwoText.foregroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
        self.quarterThreeText.foregroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
        self.quarterFourText.foregroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
        
        
        
        self.keyIndexHere = 0;
    }
    return self;
}

-(void)quitToMainMenu{
    
    [self.cancelOptionsButton removeFromSuperview];
    [self.nextBarButton removeFromSuperview];
    [self.quitToMainMenuButton removeFromSuperview];
    [self.readyToPlayButton removeFromSuperview];
    [self.setTempoButton removeFromSuperview];
    [self.optionsBackround removeFromSuperview];
    
    [self.delegate returnToMainMenu];
    
}


-(void)killNewBarOption{
    
    self.nextBarButton.frame = CGRectMake(0, 0, 0, 0);
    
}

#pragma mark KEY_SELECTION

-(void)keyPickerWheel:(UIButton *)sender{
    
    [self addSubview:self.blurWhilePickingView];
    [self addSubview:self.closeKeyPickerViewButton];
    [self addSubview:self.keyPickerView];
    NSLog(@"it worked");
}

-(void)logKeyButtonFromKeyPickerViewPushedWithRow:(NSUInteger)row inComponent:(NSUInteger)component{ //may not need the inputs here
    
    [self.keyPickerView removeFromSuperview];
    [self.closeKeyPickerViewButton removeFromSuperview];
    [self.blurWhilePickingView removeFromSuperview];    
    [self.keyButton removeFromSuperview];
    
    [self addSubview:self.chordButton];
    
    [self addSubview:self.playBarButton];
    

    [self.delegate turnKeyIndexIntoArrayOfChords:[self.keyPickerView selectedRowInComponent:0] fromSender:self];
    self.keyIndexHere = [self.keyPickerView selectedRowInComponent:0];

    
}

#pragma mark CHORD_SELECTION

-(void)constructTheChordPickerViewWithChords:(NSArray *)chordProgressionArray fromRoot:(NSInteger)root{
    
    if (self.chordPickerViewChoices) {
        [self.chordPickerViewChoices removeAllObjects];
    }
    
    
    
if (root < 12) {
    
    [self.chordPickerViewChoices addObject:[self.keyPickerViewChoices objectAtIndex:root]];
    [self.chordPickerViewChoices addObject:[self.minorChordsForPicker objectAtIndex:root + 2]]; // these are aparently zero
    [self.chordPickerViewChoices addObject:[self.minorChordsForPicker objectAtIndex:root + 4]];
    [self.chordPickerViewChoices addObject:[self.keyPickerViewChoices objectAtIndex:root + 5]];
    [self.chordPickerViewChoices addObject:[self.keyPickerViewChoices objectAtIndex:root + 7]];
    [self.chordPickerViewChoices addObject:[self.minorChordsForPicker objectAtIndex:root + 9]];
    [self.chordPickerViewChoices addObject:[[self.keyPickerViewChoices objectAtIndex:root + 11] stringByAppendingString:@"dim"]];
    
    [self.chordPickerViewChoices addObject:[self.arrayOfMajorSevenths objectAtIndex:root]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMinorSevenths objectAtIndex:root + 2]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMinorSevenths objectAtIndex:root + 4]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMajorSevenths objectAtIndex:root + 5]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMajorSevenths objectAtIndex:root + 7]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMinorSevenths objectAtIndex:root + 9]];
    [self.chordPickerViewChoices addObject:[[self.arrayOfMajorSevenths objectAtIndex:root + 11] stringByAppendingString:@"dim"]];
    

} else if(root > 11) {     // adding both because most people learn things with relative minor :)
    
    [self.chordPickerViewChoices addObject:[self.minorChordsForPicker objectAtIndex:root]];
    [self.chordPickerViewChoices addObject:[[self.keyPickerViewChoices objectAtIndex:root + 2] stringByAppendingString:@"dim"]];
    [self.chordPickerViewChoices addObject:[self.keyPickerViewChoices objectAtIndex:root + 3]];
    [self.chordPickerViewChoices addObject:[self.minorChordsForPicker objectAtIndex:root + 5]];
    [self.chordPickerViewChoices addObject:[self.minorChordsForPicker objectAtIndex:root + 7]];
    [self.chordPickerViewChoices addObject:[self.keyPickerViewChoices objectAtIndex:root + 8]];
    [self.chordPickerViewChoices addObject:[self.keyPickerViewChoices objectAtIndex:root + 10]];
    
    [self.chordPickerViewChoices addObject:[self.arrayOfMinorSevenths objectAtIndex:root]];
    [self.chordPickerViewChoices addObject:[[self.arrayOfMajorSevenths objectAtIndex:root + 11] stringByAppendingString:@"dim"]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMajorSevenths objectAtIndex:root + 3]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMinorSevenths objectAtIndex:root + 5]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMinorSevenths objectAtIndex:root + 7]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMajorSevenths objectAtIndex:root + 8]];
    [self.chordPickerViewChoices addObject:[self.arrayOfMajorSevenths objectAtIndex:root + 10]];
    
    
    
}
     
}

-(void)chordPickerWheel{
    [self addSubview:self.blurWhilePickingChordView];
    [self addSubview:self.chordPickerView];
    [self addSubview:self.closeChordPickerViewButton];
    

}

-(void)logChordButton{
    //one method to update proper arrays in delegate.
    [self.delegate updateProperNoteArraysWithFirst:[self.chordPickerView selectedRowInComponent:0] second:[self.chordPickerView selectedRowInComponent:1] andThird:[self.chordPickerView selectedRowInComponent:2]];
    
    //one method to update bar display with appropriate touch view on top.  maybe a bool method for chord display.  since if same chord spot (last two components) is called a second time chord is replaced with emptyAudioPlayer and is removed.
  //  [self updateBarDisplayWithFirst:[self.chordPickerView selectedRowInComponent:0] second:[self.chordPickerView selectedRowInComponent:1] andThird:[self.chordPickerView selectedRowInComponent:2]];
    
    
    
    [self.chordPickerView removeFromSuperview];
    [self.closeChordPickerViewButton removeFromSuperview];
    [self.blurWhilePickingChordView removeFromSuperview];
    
    
}














// WORKING HERE

// WORKING HERE

// !!!!!!!!!!!!





-(void)updateBarDisplayWithFirst:(NSInteger)chordRow second:(NSInteger)quarterNoteRow andThird:(NSInteger)fractionsRow andWithKeyIndex:(NSInteger)keyIndex{
    
    // first, check first row and set background color
    
    //handle tags, labels, with keypickerviewchoices array, and iterating or going through once you have key index.
    
    // do it like this because it needs labels.  will need to remove the uiview if selected again.
    
    if (fractionsRow == 0) {
        
        if (quarterNoteRow == 0) {
            [self.barEditorBackroundLayer addSublayer:self.quarterNoteBlockOne];
        } else if (quarterNoteRow == 1) {
            [self.barEditorBackroundLayer addSublayer:self.quarterNoteBlockTwo];
        }
    }
}


-(void)updateBarDisplayUsingTemporaryQuarterNoteArray:(NSMutableArray *)tempQuarter temporarySixteenthNoteArray:(NSMutableArray *)temp16th temporaryTripletArray:(NSMutableArray *)tempTrips andKeyIndex:(NSInteger)keyIndex andChordRow:(NSInteger)chordRow{
    
   /* self.quarterOneText.foregroundColor = [UIColor whiteColor].CGColor;
    self.quarterTwoText.foregroundColor = [UIColor whiteColor].CGColor;
    self.quarterThreeText.foregroundColor = [UIColor whiteColor].CGColor;
    self.quarterFourText.foregroundColor = [UIColor whiteColor].CGColor;*/
    
    [self.barButtonWhichIsClear removeFromSuperview];
    // first, check first row and set background color, then add to the string the label of the key
    NSString *stringer = [[NSString alloc] init];
    UIColor *color = [[UIColor alloc] init];
    
    //handle tags, labels, with keypickerviewchoices array, and iterating or going through once you have key index.
    if (keyIndex < 12) {
    
    if (chordRow == 0) {
        stringer = [self.keyPickerViewChoices objectAtIndex:keyIndex];
        color = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1];
    } else if (chordRow == 1) {
        stringer = [self.minorChordsForPicker objectAtIndex:keyIndex + 2];
        color = [UIColor colorWithRed:1 green:.4 blue:0 alpha:1];
    } else if (chordRow == 2) {
        stringer = [self.minorChordsForPicker objectAtIndex:keyIndex + 4];
        color = [UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    } else if (chordRow == 3) {
        stringer = [self.keyPickerViewChoices objectAtIndex:keyIndex + 5];
        color = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
    } else if (chordRow == 4) {
        stringer = [self.keyPickerViewChoices objectAtIndex:keyIndex + 7];
        color = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    } else if (chordRow == 5) {
        stringer = [self.minorChordsForPicker objectAtIndex:keyIndex + 9];
        color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    } else if (chordRow == 6) {
        stringer = [[self.keyPickerViewChoices objectAtIndex:keyIndex + 11] stringByAppendingString:@"dim"];
        color = [UIColor colorWithRed:.5 green:0 blue:.7 alpha:1];
    } 
    else if (chordRow == 7) {
        stringer = [self.arrayOfMajorSevenths objectAtIndex:keyIndex];
        color = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1];
    } else if (chordRow == 8) {
        stringer = [self.arrayOfMinorSevenths objectAtIndex:keyIndex + 2];
        color = [UIColor colorWithRed:1 green:.4 blue:0 alpha:1];
    } else if (chordRow == 9) {
        stringer = [self.arrayOfMinorSevenths objectAtIndex:keyIndex + 4];
        color = [UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    } else if (chordRow == 10) {
        stringer = [self.arrayOfMajorSevenths objectAtIndex:keyIndex + 5];
        color = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
    } else if (chordRow == 11) {
        stringer = [self.arrayOfMajorSevenths objectAtIndex:keyIndex + 7];
        color = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    } else if (chordRow == 12) {
        stringer = [self.arrayOfMinorSevenths objectAtIndex:keyIndex + 9];
        color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    } else if (chordRow == 13) {
        stringer = [[self.arrayOfMajorSevenths objectAtIndex:keyIndex + 11] stringByAppendingString:@"dim"];
        color = [UIColor colorWithRed:.5 green:0 blue:.7 alpha:1];
    }
    
    else {
        stringer = @"";
    }
      /*  if (chordRow == 2 || chordRow == 9) {
            self.quarterOneText.foregroundColor = [UIColor darkGrayColor].CGColor;
            self.quarterTwoText.foregroundColor = [UIColor darkGrayColor].CGColor;
            self.quarterThreeText.foregroundColor = [UIColor darkGrayColor].CGColor;
            self.quarterFourText.foregroundColor = [UIColor darkGrayColor].CGColor;
        }*/
        
    }
    
    else if (keyIndex > 11) {
        if (chordRow == 0) {
            stringer = [self.minorChordsForPicker objectAtIndex:keyIndex];
            color = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1];
        } else if (chordRow == 1) {
            stringer = [[self.keyPickerViewChoices objectAtIndex:keyIndex + 2] stringByAppendingString:@"dim"];
            color = [UIColor colorWithRed:1 green:.4 blue:0 alpha:1];
        } else if (chordRow == 2) {
            stringer = [self.keyPickerViewChoices objectAtIndex:keyIndex + 3];
            color = [UIColor colorWithRed:1 green:.6 blue:0 alpha:.9];
        } else if (chordRow == 3) {
            stringer = [self.minorChordsForPicker objectAtIndex:keyIndex + 5];
            color = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
        } else if (chordRow == 4) {
            stringer = [self.minorChordsForPicker objectAtIndex:keyIndex + 7];
            color = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
        } else if (chordRow == 5) {
            stringer = [self.keyPickerViewChoices objectAtIndex:keyIndex + 8];
            color = [UIColor colorWithRed:0 green:.7 blue:1 alpha:.8];
        } else if (chordRow == 6) {
            stringer = [self.keyPickerViewChoices objectAtIndex:keyIndex + 10];
            color = [UIColor colorWithRed:.6 green:0 blue:.9 alpha:.8];
        } 
        else if (chordRow == 7) {
            stringer = [self.arrayOfMinorSevenths objectAtIndex:keyIndex];
            color = [UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1];
        } else if (chordRow == 8) {
            stringer = [[self.arrayOfMajorSevenths objectAtIndex:keyIndex + 2] stringByAppendingString:@"dim"];
            color = [UIColor colorWithRed:1 green:.4 blue:0 alpha:1];
        } else if (chordRow == 9) {
            stringer = [self.arrayOfMajorSevenths objectAtIndex:keyIndex + 3];
            color = [UIColor colorWithRed:1 green:.6 blue:0 alpha:.9];
        } else if (chordRow == 10) {
            stringer = [self.arrayOfMinorSevenths objectAtIndex:keyIndex + 5];
            color = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
        } else if (chordRow == 11) {
            stringer = [self.arrayOfMinorSevenths objectAtIndex:keyIndex + 7];
            color = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
        } else if (chordRow == 12) {
            stringer = [self.arrayOfMajorSevenths objectAtIndex:keyIndex + 8];
            color = [UIColor colorWithRed:0 green:.7 blue:1 alpha:.8];
        } else if (chordRow == 13) {
            stringer = [self.arrayOfMajorSevenths objectAtIndex:keyIndex + 10];
            color = [UIColor colorWithRed:.6 green:0 blue:.9 alpha:.8];
        }
        else {
            stringer = @"";
        }
    }
    
    
    // do it like this because it needs labels.  will need to remove the uiview if selected again.
    
    // newBarMethod in viewController should clear this when new bar is out.
    // set CATextLayer text here and attach it to any view being displayed.  may need to make instance variable textLayer and set it equal to a multitude of property text layers, one for each subview.
    
    
    
    
    if ([[tempQuarter objectAtIndex:0] isKindOfClass:[NSArray class]]) {
        if (self.quarterOneText.string == @""){
            self.quarterOneText.string = stringer;
            self.quarterNoteBlockOne.backgroundColor = color.CGColor;
        } else {
            self.quarterOneText.string = self.quarterOneText.string;
          //  self.quarterOneText.backgroundColor = self.quarterOneText.backgroundColor;
        }
        self.quarterNoteBlockOne.hidden = NO;
    } else {
        if ([self.quarterNoteBlockOne superlayer] != nil) {
            self.quarterNoteBlockOne.hidden = YES;
        } if ([self.quarterOneText superlayer] != nil) self.quarterOneText.string = @""; [self.quarterOneText removeFromSuperlayer];
    }
    
    
    if ([[tempQuarter objectAtIndex:1] isKindOfClass:[NSArray class]]) {
        if (self.quarterTwoText.string == @""){
            self.quarterTwoText.string = stringer;
            self.quarterNoteBlockTwo.backgroundColor = color.CGColor;
        } else {
            self.quarterTwoText.string = self.quarterTwoText.string;
        }
            
        self.quarterNoteBlockTwo.hidden = NO;
    } else {
        if ([self.quarterNoteBlockTwo superlayer] != nil) self.quarterNoteBlockTwo.hidden = YES;
        if ([self.quarterTwoText superlayer] != nil) self.quarterTwoText.string = @""; [self.quarterTwoText removeFromSuperlayer]; 
    }
    
    if ([[tempQuarter objectAtIndex:2] isKindOfClass:[NSArray class]]) {
        if (self.quarterThreeText.string == @""){
            self.quarterThreeText.string = stringer;
            self.quarterNoteBlockThree.backgroundColor = color.CGColor;
        } else {
            self.quarterThreeText.string = self.quarterThreeText.string;
            //  self.quarterOneText.backgroundColor = self.quarterOneText.backgroundColor;
        }
        self.quarterNoteBlockThree.hidden = NO;
    } else {
        if ([self.quarterNoteBlockThree superlayer] != nil) {
            self.quarterNoteBlockThree.hidden = YES;
        } if ([self.quarterThreeText superlayer] != nil) self.quarterThreeText.string = @""; [self.quarterThreeText removeFromSuperlayer];
    }
    
    
    if ([[tempQuarter objectAtIndex:3] isKindOfClass:[NSArray class]]) {
        if (self.quarterFourText.string == @""){
            self.quarterFourText.string = stringer;
            self.quarterNoteBlockFour.backgroundColor = color.CGColor;
        } else {
            self.quarterFourText.string = self.quarterFourText.string;
        }
        
        self.quarterNoteBlockFour.hidden = NO;
    } else {
        if ([self.quarterNoteBlockFour superlayer] != nil) self.quarterNoteBlockFour.hidden = YES;
        if ([self.quarterFourText superlayer] != nil) self.quarterFourText.string = @""; [self.quarterFourText removeFromSuperlayer]; 
    }
    

    [self.quarterNoteBlockOne addSublayer:self.quarterOneText];
    [self.quarterNoteBlockTwo addSublayer:self.quarterTwoText];
    [self.quarterNoteBlockThree addSublayer:self.quarterThreeText];
    [self.quarterNoteBlockFour addSublayer:self.quarterFourText];
    
    [self addSubview:self.barButtonWhichIsClear];
    
    
}

#pragma mark PLAY_CURRENT_BAR

-(void)playBarMethod{
    
    [self.delegate playCurrentBar];
    
}

#pragma mark OPTIONS_MENU

-(void)displayOptions{
    
    [self addSubview:self.optionsBackround];
    [self addSubview:self.nextBarButton];
    [self addSubview:self.quitToMainMenuButton];
    [self addSubview:self.readyToPlayButton];
    [self addSubview:self.setTempoButton];
    [self addSubview:self.cancelOptionsButton];
    
}

-(void)cancelOptions{
    
    [self.cancelOptionsButton removeFromSuperview];
    [self.nextBarButton removeFromSuperview];
    [self.quitToMainMenuButton removeFromSuperview];
    [self.readyToPlayButton removeFromSuperview];
    [self.setTempoButton removeFromSuperview];
    [self.optionsBackround removeFromSuperview];
    
}

-(void)setTempoButtonPressed{
    [self addSubview:self.blurWhilePickingTempoView];
    [self addSubview:self.tempoPickerView];
    [self addSubview:self.logTempoFromPickerViewButton];
}

-(void)logTempoFromPickerView{
    
    [self.delegate setTempoWithRowsOne:[self.tempoPickerView selectedRowInComponent:0] two:[self.tempoPickerView selectedRowInComponent:1]];// three:[self.tempoPickerView selectedRowInComponent:2] five:[self.tempoPickerView selectedRowInComponent:4]];
    
    [self.tempoPickerView removeFromSuperview];
    [self.logTempoFromPickerViewButton removeFromSuperview];
    [self.blurWhilePickingTempoView removeFromSuperview];
}


// NEXT_BAR

-(void)nextBarOptions{
    
    [self.delegate newBarMethod];
    
    [self.cancelOptionsButton removeFromSuperview];
    [self.nextBarButton removeFromSuperview];
    [self.quitToMainMenuButton removeFromSuperview];
    [self.readyToPlayButton removeFromSuperview];
    [self.setTempoButton removeFromSuperview];
    [self.optionsBackround removeFromSuperview];
    
//    [self addSubview:self.blurWhileNewBarOptions];
//    [self addSubview:self.repeatBarButton];
//    [self addSubview:self.freshBarButton];
//    [self addSubview:self.cancelBarOptions];
    
}
-(void)cancelBarOptionsMethod{
    
    [self.blurWhileNewBarOptions removeFromSuperview];
    [self.repeatBarButton removeFromSuperview];
    [self.freshBarButton removeFromSuperview];
    [self.cancelBarOptions removeFromSuperview];
    
}
-(void)repeatBarMethod{
    
    [self.delegate repeatTheCurrentBar];
    
    [self.blurWhileNewBarOptions removeFromSuperview];
    [self.repeatBarButton removeFromSuperview];
    [self.freshBarButton removeFromSuperview];
    [self.cancelBarOptions removeFromSuperview];
    
}

-(void)freshBarMethod{
    
    [self.delegate newBarMethod];
    
    [self.blurWhileNewBarOptions removeFromSuperview];
 //   [self.repeatBarButton removeFromSuperview];
//    [self.freshBarButton removeFromSuperview];
//    [self.cancelBarOptions removeFromSuperview];
    
}



#pragma mark DELEGATE_METHODS

// Number of components.
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if (pickerView.tag == 1) {
        return 1;
    }
    else if (pickerView.tag == 2){
        return 3;
    }
    else {
        return 2; //was5
    }
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   // return [self.keyPickerViewChoices count] - 24;
    NSInteger number;
    if (pickerView.tag == 1) {
    number = 24;
    }
else if (pickerView.tag == 2){
    
    if (component == 0) number = 7;
    else if (component == 1) number = 4;
    else if (component == 2) number = 1;

    }
   
    if (pickerView.tag == 3) {
        if (component == 1 /*|| component == 4*/) {
            number = 2;
        //}else if (component == 2){
       //     number = 11;
       // } else if (component == 3) number = 1;
        }
        else if (component == 0) number = 8;
    }
     return number;
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *string = [[NSString alloc] init];
    
    if (pickerView.tag == 1) {
    
    if (row<12) {
        
    string = [keyPickerViewChoices objectAtIndex:row];
        }
    
    else {
       string = [keyPickerViewChoices objectAtIndex:row + 12];
        }
    }

    if (pickerView.tag == 2) {
        
        if (component == 0) {
            if (component == 0) {
                if (self.chordPickerViewChoices.count == 0){
                    string = @"";
                }else{
                    string = [self.chordPickerViewChoices objectAtIndex:row];
                }
            }
        }
    
    else if (component == 1) string = [NSString stringWithFormat:@"%d", row + 1];
    else if (component == 2) string = [NSString stringWithFormat:@""];//[self.timingChoices objectAtIndex:row];
    } 
    
    if (pickerView.tag == 3) {
        if (component == 0) {
            string = [NSString stringWithFormat:@"%d", (row + 4)*10];
        }
        else if (component == 1/* || component == 2 || component == 4*/) {
            string = [NSString stringWithFormat:@"%d", row*5];
        } //else return [NSString stringWithFormat:@"."];
    } 
    return string;
}
// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
   if (pickerView.tag ==1) NSLog(@"You selected this: %d", row);
   // self.rowAssign = row;
    
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    float width;
    
    if (pickerView.tag == 2) {
        if (component == 0) width = 160.0f;
        else if (component == 1) width = 140.0f;
        else if (component == 2) width = 0.0f;
    }
    if (pickerView.tag == 1) width = 300.0f;
    if (pickerView.tag == 3) {
        if (component == 0 || component == 1 || component == 2) {
            width = 150; //was 60
        }
        else width = 60;
    }
    return width;
}


#pragma mark READY_To_PLAY

-(void)compositionIsReadyToPlay{
    
    [self.cancelOptionsButton removeFromSuperview];
    [self.nextBarButton removeFromSuperview];
    [self.quitToMainMenuButton removeFromSuperview];
    [self.readyToPlayButton removeFromSuperview];
    [self.setTempoButton removeFromSuperview];
    [self.optionsBackround removeFromSuperview];
    
    
    [self.delegate arraysAreReadyForPlay];
    
}


// For UI Later on.
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
