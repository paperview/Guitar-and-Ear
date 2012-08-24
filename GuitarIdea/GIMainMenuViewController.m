//
//  GIMainMenuViewController.m
//  GuitarIdea
//
//  Created by Phillip Pape on 7/1/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GIMainMenuViewController.h"

@interface GIMainMenuViewController ()
@property (nonatomic, strong) NSArray *colorArray;
@property (nonatomic, strong) NSArray *arrayOfIntervalStrings;
@property (nonatomic, strong) CAKeyframeAnimation *fades;

@property (nonatomic, strong) UIView *blurPreBar;
@property (nonatomic, strong) UIButton *buttonForNew;
@property (nonatomic, strong) UIButton *quickPlayButton;
@property (nonatomic, strong) UIButton *loadButton;
@property (nonatomic, strong) UIButton *backPreBar;

@property (nonatomic, strong) CATextLayer *guitarTitle;
@property (nonatomic, strong) CATextLayer *andEarTitle;
@property (nonatomic, strong) CATextLayer *andEarTitleTwo;
@property (nonatomic, strong) CATextLayer *betaLayer;

@end

@implementation GIMainMenuViewController
@synthesize guitarTitle;
@synthesize andEarTitle;
@synthesize andEarTitleTwo;
@synthesize betaLayer;

@synthesize arrayOfIntervalStrings;
@synthesize colorArray;
@synthesize fades;

@synthesize blurPreBar;

@synthesize buttonForNew;
@synthesize quickPlayButton;
@synthesize loadButton;
@synthesize backPreBar;

@synthesize mainMenuDelegate;

-(id)init{
    
    if (self = [super init]) {
        
    self.colorArray = [NSArray arrayWithObjects:[UIColor colorWithRed:1 green:0.1 blue:.15 alpha:1], [UIColor colorWithRed:1 green:0.25 blue:0.05 alpha:0.9], [UIColor colorWithRed:1 green:.4 blue:0 alpha:1], [UIColor colorWithRed:1 green:.6 blue:0 alpha:.9], [UIColor colorWithRed:1 green:1 blue:0 alpha:1], [UIColor colorWithRed:.5 green:1 blue:0 alpha:1],/*tritone:*/ [UIColor colorWithRed:0.1 green:1 blue:0.1 alpha:.8],  [UIColor colorWithRed:0 green:1 blue:1 alpha:1], [UIColor colorWithRed:0 green:.7 blue:1 alpha:.9], [UIColor colorWithRed:0 green:0 blue:1 alpha:1], [UIColor colorWithRed:.6 green:0 blue:.9 alpha:.9], [UIColor colorWithRed:.5 green:0 blue:.7 alpha:1], nil];
    self.arrayOfIntervalStrings = [NSArray arrayWithObjects:@"R", @"m2", @"2", @"m3", @"3", @"P4", @"tt", @"P5", @"m6", @"6", @"m7", @"7", nil];
        
        self.fades = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        self.fades.duration = 6;
        self.fades.removedOnCompletion = NO;
        self.fades.fillMode = kCAFillModeBoth;
        self.fades.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.1], [NSNumber numberWithFloat:1], [NSNumber numberWithFloat:0.1], /*[NSNumber numberWithFloat:0.0],*/ nil];
        self.fades.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1], /*[NSNumber numberWithFloat:1],*/  nil];
        self.fades.timingFunctions = [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                     /* [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],*/ nil];
        
        self.fades.repeatCount = 100;
        
        self.blurPreBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        self.blurPreBar.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        self.blurPreBar.alpha = 0.8f;
        
        self.buttonForNew = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonForNew.frame = CGRectMake(15, 15, 290, 140);
        [self.buttonForNew setBackgroundImage:[UIImage imageNamed:@"GIPreBarOptionsNew.png"] forState:UIControlStateNormal];
        [self.buttonForNew setBackgroundImage:[UIImage imageNamed:@"GIPreBarOptionsNewH"] forState:UIControlStateHighlighted];
        [self.buttonForNew addTarget:self action:@selector(barModePressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.quickPlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.quickPlayButton.frame = CGRectMake(15, 165, 290, 140);
        [self.quickPlayButton setBackgroundImage:[UIImage imageNamed:@"GIPreBarOptionsQP.png"] forState:UIControlStateNormal];
        [self.quickPlayButton setBackgroundImage:[UIImage imageNamed:@"GIPreBarOptionsQPH"] forState:UIControlStateHighlighted];
        [self.quickPlayButton addTarget:self action:@selector(quickPlayPressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.loadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.loadButton.frame = CGRectMake(15, 315, 290, 140);
        [self.loadButton setBackgroundImage:[UIImage imageNamed:@"GIPreBarOptionsL.png"] forState:UIControlStateNormal];
        [self.loadButton setBackgroundImage:[UIImage imageNamed:@"GIPreBarOptionsLH"] forState:UIControlStateHighlighted];
        [self.loadButton addTarget:self action:@selector(loadPressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.guitarTitle = [CATextLayer layer];
        self.guitarTitle.backgroundColor = [UIColor clearColor].CGColor;
        self.guitarTitle.foregroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
        [self.guitarTitle setFont:@"STHeitiTC-Medium"];
        [self.guitarTitle setFontSize:100];
//        [self.guitarTitle setBounds:CGRectMake(100, 100, 300, 150)];
        self.guitarTitle.frame = CGRectMake(5, 20, 300, 150);
        self.guitarTitle.alignmentMode = kCAAlignmentNatural;
        self.guitarTitle.wrapped = NO;
        self.guitarTitle.string = [NSString stringWithFormat:@"Guitar"];
        
        self.andEarTitle = [CATextLayer layer];
        self.andEarTitle.backgroundColor = [UIColor clearColor].CGColor;
        self.andEarTitle.foregroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.8].CGColor;
        [self.andEarTitle setFont:@"STHeitiTC-Medium"];
        [self.andEarTitle setFontSize:130];
        //        [self.guitarTitle setBounds:CGRectMake(100, 100, 300, 150)];
        self.andEarTitle.frame = CGRectMake(8, 70, 300, 150);
        self.andEarTitle.alignmentMode = kCAAlignmentNatural;
        self.andEarTitle.wrapped = NO;
        self.andEarTitle.string = [NSString stringWithFormat:@"&"];
        
        self.andEarTitleTwo = [CATextLayer layer];
        self.andEarTitleTwo.backgroundColor = [UIColor clearColor].CGColor;
        self.andEarTitleTwo.foregroundColor = [UIColor colorWithRed:.8 green:.8 blue:.8 alpha:1].CGColor;
        [self.andEarTitleTwo setFont:@"STHeitiTC-Medium"];
        [self.andEarTitleTwo setFontSize:100];
        //        [self.guitarTitle setBounds:CGRectMake(100, 100, 300, 150)];
        self.andEarTitleTwo.frame = CGRectMake(142, 85, 300, 150);
        self.andEarTitleTwo.alignmentMode = kCAAlignmentNatural;
        self.andEarTitleTwo.wrapped = NO;
        self.andEarTitleTwo.string = [NSString stringWithFormat:@"ear"];
        
        self.betaLayer = [CATextLayer layer];
        self.betaLayer.backgroundColor = [UIColor clearColor].CGColor;
        self.betaLayer.foregroundColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:0.85].CGColor;
        [self.betaLayer setFont:@"STHeitiTC-Medium"];
        [self.betaLayer setFontSize:30];
        //        [self.guitarTitle setBounds:CGRectMake(100, 100, 300, 150)];
        self.betaLayer.frame = CGRectMake(125, 280, 100, 50);
        self.betaLayer.alignmentMode = kCAAlignmentNatural;
        self.betaLayer.wrapped = NO;
        self.betaLayer.string = [NSString stringWithFormat:@"beta"];
        
      /*  self.backPreBar = [UIButton buttonWithType:UIButtonTypeCustom];
        self.backPreBar.frame = CGRectMake(210, 310, 140, 140);
        [self.backPreBar setBackgroundImage:[UIImage imageNamed:@"GIBackW.png"] forState:UIControlStateNormal];
        [self.backPreBar setBackgroundImage:[UIImage imageNamed:@"GIBackWPressed.png"] forState:UIControlStateHighlighted];
        [self.backPreBar addTarget:self action:@selector(loadPressed) forControlEvents:UIControlEventTouchUpInside];*/
        
    }
    return self;
}

-(void)loadView{
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
   // self.view.backgroundColor = [UIColor whiteColor];
   
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    frame.origin.y = 0;
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    backgroundImage.alpha = 0.5f;
    backgroundImage.image = [UIImage imageNamed:@"GIBarBackgroundRedo.png"];
    [self.view addSubview:backgroundImage];
    
    [self.view.layer addSublayer:self.guitarTitle];
    [self.view.layer addSublayer:self.andEarTitle];
    [self.view.layer addSublayer:self.andEarTitleTwo];
    [self.view.layer addSublayer:self.betaLayer];
    
    
    UIButton *barMode = [UIButton buttonWithType:UIButtonTypeCustom];
    barMode.frame = CGRectMake(10, 320, 140, 150);
    [barMode setImage:[UIImage imageNamed:@"GIMMEar.png"] forState:UIControlStateNormal];
//    barMode.backgroundColor = [UIColor grayColor];
  //  [barMode.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
  //  [barMode.titleLabel setTextColor:[UIColor whiteColor]];
 //   [barMode setTitle:@"Compose" forState:UIControlStateNormal];
    [barMode setImage:[UIImage imageNamed:@"GIMMEarH.png"] forState:UIControlStateHighlighted];
    [barMode addTarget:self action:@selector(intervalGameModePressed) forControlEvents:UIControlEventTouchUpInside];
    
    //intervalGameModePressed
    
    [self.view addSubview:barMode];
    
 /*   UIButton *globalOptions = [UIButton buttonWithType:UIButtonTypeCustom];
    globalOptions.frame = CGRectMake(112.5f, 320, 95, 150);
    globalOptions.backgroundColor = [UIColor grayColor];
    [globalOptions.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    [globalOptions.titleLabel setTextColor:[UIColor whiteColor]];
    [globalOptions setTitle:@"Options" forState:UIControlStateNormal];
    [globalOptions addTarget:self action:@selector(globalOptionsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:globalOptions];*/
    
    UIButton *intervalMode = [UIButton buttonWithType:UIButtonTypeCustom];
    intervalMode.frame = CGRectMake(170, 320, 140, 150);
    [intervalMode setImage:[UIImage imageNamed:@"GIMMEarTwo.png"] forState:UIControlStateNormal];
//    intervalMode.backgroundColor = [UIColor grayColor];
 //   [intervalMode.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
  //  [intervalMode.titleLabel setTextColor:[UIColor whiteColor]];
  //  [intervalMode setTitle:@"Intervals" forState:UIControlStateNormal];
    [intervalMode setImage:[UIImage imageNamed:@"GIMMGetTwoH.png"] forState:UIControlStateHighlighted];
    //barModeInitialPressed
    [intervalMode addTarget:self action:@selector(barModeInitialPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:intervalMode];
    
    for (int i = 0; i < 6; i++) {
        
        CALayer *loopLayer = [self spawnCircleLayer];
        loopLayer.position = CGPointMake(35 +i*45, 200);
        loopLayer.backgroundColor = [[self.colorArray objectAtIndex:i] CGColor];
        loopLayer.opacity = 0;
        [[NSRunLoop mainRunLoop] addTimer:[NSTimer timerWithTimeInterval:i+1.5 target:self selector:@selector(animateDot:) userInfo:loopLayer repeats:NO] forMode:NSRunLoopCommonModes];
        [self.view.layer addSublayer:loopLayer];
        
        CATextLayer *textLayer = [self spawnTextLayer];
        textLayer.position = CGPointMake(35 +i*45, 208);
        textLayer.string = [self.arrayOfIntervalStrings objectAtIndex:i];
        textLayer.opacity = 0;
        [[NSRunLoop mainRunLoop] addTimer:[NSTimer timerWithTimeInterval:i+1.5 target:self selector:@selector(animateDot:) userInfo:textLayer repeats:NO] forMode:NSRunLoopCommonModes];
        [self.view.layer addSublayer:textLayer];
        
    }
    
    for (int i = 6; i < 12; i++) {
        CALayer *loopLayer = [self spawnCircleLayer];
        loopLayer.position = CGPointMake(58 +(i-6)*45, 245);
        loopLayer.backgroundColor = [[self.colorArray objectAtIndex:i] CGColor];
        loopLayer.opacity = 0;
        [[NSRunLoop mainRunLoop] addTimer:[NSTimer timerWithTimeInterval:i+1 target:self selector:@selector(animateDot:) userInfo:loopLayer repeats:NO] forMode:NSRunLoopCommonModes]; 
        [self.view.layer addSublayer:loopLayer];
        
        CATextLayer *textLayer = [self spawnTextLayer];
        textLayer.position = CGPointMake(58 +(i-6)*45, 253);
         textLayer.string = [self.arrayOfIntervalStrings objectAtIndex:i];
        textLayer.opacity = 0;
        [[NSRunLoop mainRunLoop] addTimer:[NSTimer timerWithTimeInterval:i+1 target:self selector:@selector(animateDot:) userInfo:textLayer repeats:NO] forMode:NSRunLoopCommonModes]; 
        [self.view.layer addSublayer:textLayer];
        
        
    }
    
    
    /*    
    
     
     for (int i = 0; i < 12; i++) {
     
     CATextLayer *loopLayer = [self spawnTextLayer];
     loopLayer.position = CGPointMake((25 + 45*i), 433);
     //       loopLayer.string = [[lowEStringArrayOfNoteNames objectAtIndex:i] stringByAppendingFormat:@"/m2"];
     loopLayer.string = [lowEStringArrayOfNoteNames objectAtIndex:i];
     loopLayer.opacity = 0.0f;
     [indicatorMutableArrayLowE addObject:loopLayer];
     [self.fretBoardLayer addSublayer:loopLayer];
     }
     self.dictionaryOfLabelsLowE = [[NSMutableDictionary alloc] initWithObjects:indicatorMutableArrayLowE forKeys:lowEStringArrayOfNoteNames];*/  
}

-(void)animateDot:(NSTimer *)theTimer{
    
    [[theTimer userInfo] addAnimation:self.fades forKey:@"key"];
    
}

-(void)barModeInitialPressed{
    
    [self.view addSubview:self.blurPreBar];
    [self.view addSubview:self.buttonForNew];
    [self.view addSubview:self.quickPlayButton];

    //BOOL
    [self.view addSubview:self.loadButton];
    
}


-(void)barModePressed{
    
    [self.blurPreBar removeFromSuperview];
    [self.buttonForNew removeFromSuperview];
    [self.quickPlayButton removeFromSuperview];
    [self.loadButton removeFromSuperview];
    
    NSLog(@"pressed");
    [self.mainMenuDelegate barModeViewSelected];
    
}

-(void)loadPressed{
    
    [self.blurPreBar removeFromSuperview];
    [self.buttonForNew removeFromSuperview];
    [self.quickPlayButton removeFromSuperview];
    [self.loadButton removeFromSuperview];
    
    [self.mainMenuDelegate loadTheArrays];
    
    
}

-(void)intervalGameModePressed{
    
    NSLog(@"pressed");
    [self.mainMenuDelegate intervalGameViewSelected];
    
}



-(CALayer *)spawnCircleLayer{
    
    CALayer *circleLayer = [CALayer layer];
  //  circleLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
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
    [textLayer setFont:@"STHeitiTC-Medium"];
    [textLayer setFontSize:16];
    [textLayer setBounds:CGRectMake(0, 0, 45.0f, 32.0f)];
    textLayer.wrapped = NO;
    
    
    return textLayer;
}

-(void)quickPlayPressed{
    
    [self.mainMenuDelegate quickPlaySummons];
    
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
