//
//  GISwitchViewController.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/17/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GISwitchViewController.h"

@interface GISwitchViewController () <GIBarViewControllerDelegate, GIMainMenuProtocol, GISoloViewProtocol, GIIntervalProtocal, NSCoding>

@property (nonatomic, strong) GIViewController *barViewController;
@property (nonatomic, strong) GISoloViewController *soloViewController;
@property (nonatomic, strong) GIIntervalTrainingViewController *intervalTrainingController;
@property (nonatomic, strong) GIMainMenuViewController *mainMenuViewController;
@property (nonatomic, strong) GIViewController *quickPlayBarVC;

@property (nonatomic, strong) NSMutableArray *loadedArrayBacking;
@property (nonatomic, strong) NSMutableArray *loadedArrayQuarters;
@property (nonatomic, strong) NSMutableArray *loadedArrayEighths;

@property (nonatomic, strong) NSMutableArray *codeBacking;
@property (nonatomic, strong) NSMutableArray *codeQuarter;
@property (nonatomic, strong) NSMutableArray *codeEighth;

//@property (nonatomic, strong) NSUserDefaults *userDefaultsOne;

// set arrays here as properties and store them


@end

@implementation GISwitchViewController

@synthesize loadedArrayBacking;
@synthesize loadedArrayEighths;
@synthesize loadedArrayQuarters;

@synthesize codeEighth;
@synthesize codeBacking;
@synthesize codeQuarter;

@synthesize barViewController;
@synthesize soloViewController;
@synthesize intervalTrainingController;
@synthesize mainMenuViewController;

@synthesize quickPlayBarVC;

//@synthesize userDefaultsOne;

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.barViewController = [[GIViewController alloc] init];
        self.barViewController.delegate = self;
        
        self.soloViewController = [[GISoloViewController alloc] init];
        
        
    }
    return self;
}*/

-(id)init{
    
    if (self = [super init]) {
        
        
       // self.userDefaultsOne = [NSUserDefaults standardUserDefaults];
        
        self.barViewController = [[GIViewController alloc] init];
        self.mainMenuViewController = [[GIMainMenuViewController alloc] init];
        self.barViewController.viewControllerDelegate = self;
        self.mainMenuViewController.mainMenuDelegate = self;
        
        self.soloViewController = [[GISoloViewController alloc] init];
        self.soloViewController.soloDelegate = self;
        
        self.intervalTrainingController = [[GIIntervalTrainingViewController alloc] init];
        self.intervalTrainingController.intervalDelegate = self;

        
        
    }
    return self;
}

-(void)loadView{
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    frame.origin.y = 0;
    
    self.mainMenuViewController.view.frame = frame;
    self.soloViewController.view.frame = frame;
    
    self.barViewController.view.frame = frame;
    self.intervalTrainingController.view.frame = frame;
    
    
    [self.view addSubview:self.mainMenuViewController.view];
    
    
    
    
}

#pragma mark MAIN_MENU_DELEGATE_METHODS




-(void)intervalGameViewSelected{
    
    [self.mainMenuViewController.view removeFromSuperview];
    [self.view addSubview:self.intervalTrainingController.view];
}

-(void)barModeViewSelected{
    [self.mainMenuViewController.view removeFromSuperview];
//    [self.mainMenuViewController viewDidDisappear:YES];
    [self.view addSubview:self.barViewController.view];
    
}

-(void)returnFromBar{
    
    [self.barViewController.view removeFromSuperview];
    self.barViewController = [[GIViewController alloc] init];
    self.barViewController.viewControllerDelegate = self;
    self.soloViewController = [[GISoloViewController alloc] init];
    self.soloViewController.soloDelegate = self;
    self.mainMenuViewController = [[GIMainMenuViewController alloc] init];
    self.mainMenuViewController.mainMenuDelegate = self;
//    self.mainMenuViewController = [[GIMainMenuViewController alloc] init];
//    self.mainMenuViewController.mainMenuDelegate = self;
    [self.view addSubview:self.mainMenuViewController.view];
    
}

-(void)returnFromSoloView{
    
    [self.soloViewController.view removeFromSuperview];
    self.barViewController = [[GIViewController alloc] init];
    self.barViewController.viewControllerDelegate = self;
    self.soloViewController = [[GISoloViewController alloc] init];
    self.soloViewController.soloDelegate = self;
    self.mainMenuViewController = [[GIMainMenuViewController alloc] init];
    self.mainMenuViewController.mainMenuDelegate = self;
    

    [self.view addSubview:self.mainMenuViewController.view];
    
}

-(void)returnFromInterval{
    
    [self.intervalTrainingController.view removeFromSuperview];
    self.intervalTrainingController = [[GIIntervalTrainingViewController alloc] init];
    self.intervalTrainingController.intervalDelegate = self;
    self.barViewController = [[GIViewController alloc] init];
    self.barViewController.viewControllerDelegate = self;
    self.soloViewController = [[GISoloViewController alloc] init];
    self.soloViewController.soloDelegate = self;
    self.mainMenuViewController = [[GIMainMenuViewController alloc] init];
    self.mainMenuViewController.mainMenuDelegate = self;
    
    [self.view addSubview:self.mainMenuViewController.view];
    
}


#pragma mark SOLOVIEW_DELEGATE_METHODS

-(void)passTempo:(float)tempo{
    
    [self.soloViewController setTempoForSoloAlgorithm:tempo];
}

-(void)passArraysAlongToSoloView:(NSMutableArray *)quarters :(NSMutableArray *)sixteenths :(NSMutableArray *)triplets withKeyIndex:(NSInteger)keyIndex{
    if (self.soloViewController.view.superview == nil) {
        
        if (self.barViewController.view != nil) {
        [self.barViewController.view removeFromSuperview];
        }
        [self.view addSubview:self.soloViewController.view];
    }
    

    
    [self.soloViewController setUpBackingArraysWith:quarters with:sixteenths with:triplets];
    
}

-(void)passStringsForSoloAnalyzer:(NSMutableArray *)qStrings :(NSMutableArray *)sStrings :(NSMutableArray *)tStrings withKeyIndex:(NSInteger)keyIndex{
    
    [self.soloViewController setUpArraysOfStringsForAnalysis:qStrings with:sStrings with:tStrings withKeyIndex:keyIndex];
    
    
}

#pragma mark SAVE_DATA_MANAGEMENT

-(void)saveTheTempo:(float)tempoSave{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setFloat:tempoSave forKey:@"tempoSave"];
    
}


-(void)saveTheArraysWithBackingArray:(NSArray *)backing quarterSoloArray:(NSArray *)quarterSolo andEighthSoloArray:(NSArray *)eighthSolo{
    

    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:backing forKey:@"b"];
    [prefs setObject:quarterSolo forKey:@"q"];
    [prefs setObject:eighthSolo forKey:@"fraktits"];
    [prefs synchronize];

    
    
}

-(void)loadTheArrays{
    
    
    self.loadedArrayBacking = [[NSMutableArray alloc] init];
    self.loadedArrayQuarters = [[NSMutableArray alloc] init];
    self.loadedArrayEighths = [[NSMutableArray alloc] init]; 
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    


    
        
    for (NSString *string in [prefs arrayForKey:@"b"]) {
        
        if (![string isKindOfClass:[NSString class]]) {
            [self.loadedArrayBacking addObject:[NSNull null]];
            continue;
        }
        NSRange range = [string rangeOfString:@":"];
        NSString *rootString = [string substringWithRange:NSMakeRange(0, range.location)];
        
        GIChroma *chroma = [[GIChroma alloc] init];
        NSMutableArray *chordArray = [[NSMutableArray alloc] init];
        
        int rootNumber;
        if ([rootString intValue] > 11) {
            rootNumber = [rootString intValue] - 12;
        } else {
            rootNumber = [rootString intValue];
        }
        
        NSLog(@"%i", rootNumber);
        NSLog(@"%@", string);
        
        [chordArray addObject:[chroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:rootNumber]];
        if ([string hasSuffix:@"m"]) {
            [chordArray addObject:[chroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:(rootNumber + 3)]];
            [chordArray addObject:[chroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:(rootNumber + 7)]];
        } else if ([string hasSuffix:@"d"]) {
            [chordArray addObject:[chroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:(rootNumber + 3)]];
            [chordArray addObject:[chroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:(rootNumber + 6)]];
        } else if ([string hasSuffix:@"r"]) {
            [chordArray addObject:[chroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:(rootNumber + 4)]];
            [chordArray addObject:[chroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:(rootNumber + 7)]];
        }
        [self.loadedArrayBacking addObject:chordArray];
        
    }
    
    for (NSString *string in [prefs arrayForKey:@"q"]) {
        if (![string isKindOfClass:[NSString class]]) {
            [self.loadedArrayQuarters addObject:[NSNull null]];
            continue;
        } else if ([string isEqualToString:@""]) {
            [self.loadedArrayQuarters addObject:[NSNull null]];
            continue;
        } else {
        
        
         GIGuitarSource *guitarSource = [[GIGuitarSource alloc] init];
        [self.loadedArrayQuarters addObject:[guitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:[string intValue]]];
        }
        
    }
    
    for (NSString *string in [prefs arrayForKey:@"fraktits"]) {
        
        if (![string isKindOfClass:[NSString class]]) {
            [self.loadedArrayEighths addObject:[NSNull null]];
            continue;
        } else if ([string isEqualToString:@""]) {
            [self.loadedArrayEighths addObject:[NSNull null]];
            continue;
        } else {
            
        
        GIGuitarSource *guitarSource = [[GIGuitarSource alloc] init];
        [self.loadedArrayEighths addObject:[guitarSource.arrayOfGuitarAudioPlayersThirdAndFourthOctaves objectAtIndex:[string intValue]]];
        }
        
    }
    
    [self.mainMenuViewController.view removeFromSuperview];
    self.soloViewController = [[GISoloViewController alloc] init];
    self.soloViewController.soloDelegate = self;
    [self.soloViewController setTempoForSoloAlgorithm:[prefs floatForKey:@"tempoSave"]];
    [self.soloViewController arraysHaveBeenLoadedWith:self.loadedArrayBacking :self.loadedArrayQuarters :self.loadedArrayEighths];
    [self.view addSubview:self.soloViewController.view];
    
    
    
}

-(void)quickPlaySummons{
    
    
  //  self.soloViewController = [[GISoloViewController alloc] init]; 
    self.barViewController = [[GIViewController alloc] init];

    [self.mainMenuViewController.view removeFromSuperview];
    [self.view addSubview:self.barViewController.view];
    //may need to add as subview
    
    //self.barViewController.quickPlayActive = YES;
    int keyRoll = arc4random()%30;
    
    if (keyRoll <= 10) {
        [self.barViewController turnKeyIndexIntoArrayOfChords:22 fromSender:nil];
    } else if (keyRoll > 10 && keyRoll <= 20) {
        [self.barViewController turnKeyIndexIntoArrayOfChords:16 fromSender:nil];
    } else if (keyRoll > 20 && keyRoll <= 30) {
        [self.barViewController turnKeyIndexIntoArrayOfChords:8 fromSender:nil];
    } 
    
    int tempoRoll = arc4random()%30;
    
    if (tempoRoll <= 15) {
        [self passTempo:80];
    } else if (tempoRoll > 15) {
        [self passTempo:95];
    }
    
    int progressionRoll = arc4random()%20;
    
    if (progressionRoll <= 10) {
        
    
    
    
    for (int i =0; i < 4; i++) {
        
        [self.barViewController updateProperNoteArraysWithFirst:0 second:i andThird:0];
   
    }
    
    [self.barViewController newBarMethod];
    
    for (int i =0; i < 4; i++) {
    
        [self.barViewController updateProperNoteArraysWithFirst:3 second:i andThird:0];
    
    }
    
    [self.barViewController newBarMethod];
    
    for (int i =0; i < 4; i++) {
        
        [self.barViewController updateProperNoteArraysWithFirst:4 second:i andThird:0];
        
    }
    
    [self.barViewController newBarMethod];
    
    for (int i =0; i < 4; i++) {
        
        [self.barViewController updateProperNoteArraysWithFirst:0 second:i andThird:0];
        
    }
    
    
    } else {
        
        
        for (int i =0; i < 4; i++) {
            
            [self.barViewController updateProperNoteArraysWithFirst:2 second:i andThird:0];
            
        }
        
        [self.barViewController newBarMethod];
        
        for (int i =0; i < 4; i++) {
            
            [self.barViewController updateProperNoteArraysWithFirst:4 second:i andThird:0];
            
        }
        
        [self.barViewController newBarMethod];
        
        for (int i =0; i < 4; i++) {
            
            [self.barViewController updateProperNoteArraysWithFirst:6 second:i andThird:0];
            
        }
       
        [self.barViewController newBarMethod];
        
        for (int i =0; i < 4; i++) {
            
            [self.barViewController updateProperNoteArraysWithFirst:0 second:i andThird:0];
            
        }
        
        
        
    }
   /* [self.quickPlayBarVC.temporaryQuarterNoteArrayOfEmptyAudioPlayers removeAllObjects];
    [self.quickPlayBarVC.temporarySixteenthNoteArrayOfEmptyAudioPlayers removeAllObjects];
    [self.quickPlayBarVC.temporaryTripletNoteArrayOfEmptyAudioPlayers removeAllObjects];

   for (int i =0; i < 4; i++) {
    
        [self.quickPlayBarVC updateProperNoteArraysWithFirst:4 second:i andThird:0];
    
    } 
    
    [self.quickPlayBarVC.temporaryQuarterNoteArrayOfEmptyAudioPlayers removeAllObjects];
    [self.quickPlayBarVC.temporarySixteenthNoteArrayOfEmptyAudioPlayers removeAllObjects];
    [self.quickPlayBarVC.temporaryTripletNoteArrayOfEmptyAudioPlayers removeAllObjects];
    
    for (int i =0; i < 4; i++) {
    
        [self.quickPlayBarVC updateProperNoteArraysWithFirst:0 second:i andThird:0];
    
    } */

   // [self.barViewController arraysAreReadyForPlay];
    
    [self passArraysAlongToSoloView:self.barViewController.quarterNoteArrayOfEmptyAudioPlayers :self.barViewController.sixteenthNoteArrayOfEmptyAudioPlayers :self.barViewController.tripletNoteArrayOfEmptyAudioPlayers withKeyIndex:self.barViewController.currentKeyIndex];
    
    
    [self passStringsForSoloAnalyzer:self.barViewController.qArrayOfStringsForSoloAnalyzer :self.barViewController.sArrayOfStringsForSoloAnalyzer :self.barViewController.tArrayOfStringsForSoloAnalyzer withKeyIndex:self.barViewController.currentKeyIndex];// this was moved from log chord method to here
    
    
    
  //  [self.view addSubview:self.soloViewController.view];




}


-(void)passNumberOfBarsForOptionsBlocker:(int)numberOfBars{
    
    
    [self.soloViewController setUpBlockerTimerWithNumberOfBars:numberOfBars];
    
    
}









@end
