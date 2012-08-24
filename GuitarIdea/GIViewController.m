//
//  GIViewController.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/12/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//


#import "GIViewController.h"
#import "GIBarCreatorView.h"
#import "GIChroma.h"
#import "GIChordLibrary.h"
//#import "GIScaleConstants.h"
#import "GITempoConstructs.h"


@interface GIViewController () <GIBarCreatorViewDelegate>

@property (nonatomic, strong) GIChroma *chroma;

@property (nonatomic, strong) GIBarCreatorView *firstBarCreatorView;
@property (nonatomic, strong) NSMutableArray *arrayOfChroma;
@property (nonatomic, assign) int chromaFromArrayIndexer;

@property (nonatomic, strong) GIChordLibrary *chordLibrary;

//@property (nonatomic, strong) NSMutableArray *quarterNoteArrayOfEmptyAudioPlayers;

@property (nonatomic, assign) NSInteger quarterNoteArrayClicker;    // these will be incremented
@property (nonatomic, assign) NSInteger sixteenthNoteArrayClicker;   // in the method for
@property (nonatomic, assign) NSInteger tripletNoteArrayClicker;     // a new bar

@property (nonatomic, strong) NSMutableArray *chordProgressionArray;
@property (nonatomic, strong) NSArray *majorChordProgressionArray;
@property (nonatomic, strong) NSArray *minorChordProgressionArray;


@property (nonatomic, strong) NSArray *emptyChordArray;
@property (nonatomic, strong) NSMutableArray *chordArray;

@property (nonatomic, strong) NSNumber *tempo;
@property (nonatomic, assign) float quarterNoteTime;
@property (nonatomic, assign) float sixteenthNoteTime;
@property (nonatomic, assign) float tripletTime;
@property (nonatomic, assign) float barTime;

//getting crazy
@property (nonatomic, strong) NSMutableArray *chunk16thArray;
@property (nonatomic, assign) int the16thChunker;

@property (nonatomic, strong) NSMutableArray *chunkTripletArray;
@property (nonatomic, assign) int theTripletChunker;



@end

@implementation GIViewController

@synthesize viewControllerDelegate;

@synthesize chroma;

@synthesize firstBarCreatorView;
@synthesize arrayOfChroma;
@synthesize chromaFromArrayIndexer;

@synthesize chordLibrary;

@synthesize quarterNoteArrayOfEmptyAudioPlayers;
@synthesize temporaryQuarterNoteArrayOfEmptyAudioPlayers;
@synthesize sixteenthNoteArrayOfEmptyAudioPlayers;
@synthesize temporarySixteenthNoteArrayOfEmptyAudioPlayers;
@synthesize tripletNoteArrayOfEmptyAudioPlayers;
@synthesize temporaryTripletNoteArrayOfEmptyAudioPlayers;
@synthesize quarterNoteArrayClicker;
@synthesize sixteenthNoteArrayClicker;
@synthesize tripletNoteArrayClicker;

@synthesize chordProgressionArray;
@synthesize majorChordProgressionArray;
@synthesize minorChordProgressionArray;

@synthesize currentKeyIndex;
@synthesize emptyChordArray;
@synthesize chordArray;

@synthesize tempo = _tempo;
@synthesize quarterNoteTime;
@synthesize sixteenthNoteTime;
@synthesize tripletTime;
@synthesize barTime;

//getting crazy
@synthesize chunk16thArray;
@synthesize the16thChunker;

@synthesize chunkTripletArray;
@synthesize theTripletChunker;

@synthesize qArrayOfStringsForSoloAnalyzer;
@synthesize sArrayOfStringsForSoloAnalyzer;
@synthesize tArrayOfStringsForSoloAnalyzer;

@synthesize quickPlayActive;


-(id)init{
    
    if (self = [super init]) {
        
        self.tempo = [NSNumber numberWithFloat:80.0f];
        
        [self setTempoMyself:self.tempo.floatValue];
        
        self.chroma = [[GIChroma alloc] init];
        
        self.chordLibrary = [[GIChordLibrary alloc] init];
        
        self.firstBarCreatorView = [[GIBarCreatorView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        self.firstBarCreatorView.delegate = self;
        [self.view addSubview:firstBarCreatorView]; // temporary
        
        self.arrayOfChroma = [[NSMutableArray alloc] init];
      //  for (int i = 0; i < 200; i++) {
      //      [self.arrayOfChroma addObject:[GIChroma class]];  //This is to draw from for the players of each individual chord.
      //  }
        [self.arrayOfChroma addObject:[GIChroma class]];
        
        self.chromaFromArrayIndexer = 0;

        self.quickPlayActive = NO;
        
        NSError *error = nil;  
        if (error) {
            NSLog(@"Error: %@", error);
        }
        self.emptyChordArray = [[NSArray alloc] initWithObjects:self.chroma.emptyAudioPlayer, nil];
        
        NSLog(@"The count is %d", self.emptyChordArray.count);
        
        self.quarterNoteArrayOfEmptyAudioPlayers = [[NSMutableArray alloc] init]; 
        for (int i = 0; i < 4; i++) { // was 200
            [self.quarterNoteArrayOfEmptyAudioPlayers addObject:[NSNull null]];
        }
        
        self.sixteenthNoteArrayOfEmptyAudioPlayers = [[NSMutableArray alloc] init];
        for (int i = 0; i < 16; i++) { // was 805
            [self.sixteenthNoteArrayOfEmptyAudioPlayers addObject:[NSNull null]];
        }
        
        self.tripletNoteArrayOfEmptyAudioPlayers = [[NSMutableArray alloc] init];
        for (int i = 0; i < 12; i++) { // was 605
            [self.tripletNoteArrayOfEmptyAudioPlayers addObject:[NSNull null]];
        }
        
        
        // STRINGS FOR SOLO
        
        self.qArrayOfStringsForSoloAnalyzer = [[NSMutableArray alloc] init]; 
        for (int i = 0; i < 4; i++) { 
            [self.qArrayOfStringsForSoloAnalyzer addObject:[NSNull null]];
        }
        
        self.sArrayOfStringsForSoloAnalyzer = [[NSMutableArray alloc] init];
        for (int i = 0; i < 16; i++) { 
            [self.sArrayOfStringsForSoloAnalyzer addObject:[NSNull null]];
        }
        
        self.tArrayOfStringsForSoloAnalyzer = [[NSMutableArray alloc] init];
        for (int i = 0; i < 12; i++) { 
            [self.tArrayOfStringsForSoloAnalyzer addObject:[NSNull null]];
        }
        
        // let's do this

        
        //
        self.currentKeyIndex = 0;
        
        self.quarterNoteArrayClicker = 0;
        self.sixteenthNoteArrayClicker = 0;
        self.tripletNoteArrayClicker = 0;
        
        self.chordProgressionArray = [[NSMutableArray alloc] init];
        
        self.majorChordProgressionArray = [[NSArray alloc] initWithObjects:self.chordLibrary.majorTriad, self.chordLibrary.minorTriad, self.chordLibrary.minorTriad, self.chordLibrary.majorTriad, self.chordLibrary.majorTriad, self.chordLibrary.minorTriad, self.chordLibrary.diminishedTriad, self.chordLibrary.majorSeventh, self.chordLibrary.minorSeventh, self.chordLibrary.minorSeventh, self.chordLibrary.majorSeventh, self.chordLibrary.majorSeventh, self.chordLibrary.minorSeventh, self.chordLibrary.halfDiminishedSeventh, nil];
        
        
        self.minorChordProgressionArray = [[NSArray alloc] initWithObjects:self.chordLibrary.minorTriad, self.chordLibrary.diminishedTriad, self.chordLibrary.majorSeventh, self.chordLibrary.minorTriad, self.chordLibrary.minorTriad, self.chordLibrary.majorTriad, self.chordLibrary.majorTriad, self.chordLibrary.minorSeventh, self.chordLibrary.halfDiminishedSeventh, self.chordLibrary.majorSeventh, self.chordLibrary.minorSeventh, self.chordLibrary.minorSeventh, self.chordLibrary.majorSeventh, self.chordLibrary.majorSeventh, nil];
        
        self.temporaryQuarterNoteArrayOfEmptyAudioPlayers = [[NSMutableArray alloc] init];
        for (int i = 0; i <= 4; i++) {
            [self.temporaryQuarterNoteArrayOfEmptyAudioPlayers addObject:[NSNull null]];
        }
        
        self.temporarySixteenthNoteArrayOfEmptyAudioPlayers = [[NSMutableArray alloc] init];
        for (int i = 0; i <= 16; i++) {
            [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers addObject:[NSNull null]];
        }
        
        self.temporaryTripletNoteArrayOfEmptyAudioPlayers = [[NSMutableArray alloc] init];
        for (int i = 0; i <= 12; i++) {
            [self.temporaryTripletNoteArrayOfEmptyAudioPlayers addObject:[NSNull null]];
        }
        
        self.the16thChunker = 0;
        self.chunk16thArray = [[NSMutableArray alloc] init];
        self.theTripletChunker = 0;
        self.chunkTripletArray = [[NSMutableArray alloc] init];
        
    }
    return self;
}

-(void)incrementArrayNamed:(NSString *)arrayName{
    
    if (arrayName == @"chroma") {
        [self.arrayOfChroma addObject:[GIChroma class]];
        
    } else if (arrayName == @"quarterEmpty") {
        for (int i = 0; i < 4; i++) {
            [self.quarterNoteArrayOfEmptyAudioPlayers addObject:[NSNull null]];
        }
        
    } else if (arrayName == @"sixteenthEmpty") {
        for (int i = 0; i < 16; i++) {
            [self.sixteenthNoteArrayOfEmptyAudioPlayers addObject:[NSNull null]];
        }
        
    } else if (arrayName == @"tripletEmpty") {
        for (int i = 0; i < 12; i++) {
            [self.tripletNoteArrayOfEmptyAudioPlayers addObject:[NSNull null]];
        }
    }   else if (arrayName == @"quarterStrings") {
        for (int i = 0; i < 4; i++) {
            [self.qArrayOfStringsForSoloAnalyzer addObject:[NSNull null]];
        }
        
    } else if (arrayName == @"sixteenthStrings") {
        for (int i = 0; i < 16; i++) {
            [self.sArrayOfStringsForSoloAnalyzer addObject:[NSNull null]];
        }
        
    } else if (arrayName == @"tripletStrings") {
        for (int i = 0; i < 12; i++) {
            [self.tArrayOfStringsForSoloAnalyzer addObject:[NSNull null]];
        }
    }
    
    
}

-(void)setTempoWithRowsOne:(NSInteger)firstRow two:(NSInteger)secondRow{  // three:(NSInteger)thirdRow five:(NSInteger)fifthRow{
    float sumForTempo;
    
    
    sumForTempo = (firstRow + 4)*10 + secondRow*5; // + (secondRow+1)*10 + thirdRow + fifthRow*0.1f;
    
    if (sumForTempo < 121) {
        [self setTempoMyself:sumForTempo];
    } else [self setTempoMyself:120];
    
    
}

-(void)setTempoMyself:(float)bpm{
    
    self.tempo = [NSNumber numberWithFloat:bpm];
    float bps = [self.tempo floatValue] / 4 / 60;
    float spb = 1 / bps;
    
    self.quarterNoteTime = spb / 4;
    self.sixteenthNoteTime = self.quarterNoteTime / 4;
    self.tripletTime = self.quarterNoteTime / 3;
    self.barTime = spb;
    
    [self.viewControllerDelegate passTempo:bpm];
}

-(void)turnKeyIndexIntoArrayOfChords:(NSInteger)keyIndex fromSender:(GIBarCreatorView *)sender{
    
    if (self.chordProgressionArray) {
        [self.chordProgressionArray removeAllObjects];
    }
    // 0-11 are major 12-23 are minor
    NSLog(@"Key Index is %d", keyIndex);
    
    if (self.quickPlayActive == NO) {
        
    
    if (keyIndex < 12) {
        
        [sender constructTheChordPickerViewWithChords:self.majorChordProgressionArray fromRoot:keyIndex];
        
    } else if(keyIndex > 11) {             // adding both because most people learn things with relative minor :)
        
        [sender constructTheChordPickerViewWithChords:self.minorChordProgressionArray fromRoot:keyIndex];
        
    }
        
        
    }
        
    self.currentKeyIndex = keyIndex;

    
}

#pragma mark IMPORTANT_NOTE
// when i add two octaves for better sound in the 7th chords, the loading of the chordarray.3rdoctave - 12's below will need to be - 24's

-(void)updateProperNoteArraysWithFirst:(NSInteger)selectedRowInFirstComponent second:(NSInteger)selectedRowInSecondComponent andThird:(NSInteger)selectedRowInThirdComponent{
    
    // use the currentKeyIndex for key and major or minor and use First:(NSInt) triad or seventh.
    //get chroma from arrayOfChroma, alloc it, based on key, add root (keyIndex) to array, then the rest based on if its triad or seventh (and major or minor <11), then put array in appropriate array of empty audio players.  (allocate a new chroma here each time it is called.)
    NSString *stringForChord = [[NSString alloc] init];
    self.chordArray = [[NSMutableArray alloc] init];
    GIChroma *localChroma = [[[self.arrayOfChroma objectAtIndex:self.chromaFromArrayIndexer] alloc] init]; 
    int localChromaticIndexForCorrectNote = 0; 
    
    if (self.quarterNoteArrayOfEmptyAudioPlayers.count < self.quarterNoteArrayClicker) {
        [self incrementArrayNamed:@"quarterEmpty"];
    }
    if (self.sixteenthNoteArrayOfEmptyAudioPlayers.count < self.sixteenthNoteArrayClicker) {
        [self incrementArrayNamed:@"sixteenthEmpty"];
    }
    if (self.tripletNoteArrayOfEmptyAudioPlayers.count < self.tripletNoteArrayClicker) {
        [self incrementArrayNamed:@"tripletEmpty"];
    }
    
    //strings use same clicker
    if (self.qArrayOfStringsForSoloAnalyzer.count < self.quarterNoteArrayClicker) {
        [self incrementArrayNamed:@"quarterStrings"];
    }
    if (self.sArrayOfStringsForSoloAnalyzer.count < self.sixteenthNoteArrayClicker) {
        [self incrementArrayNamed:@"sixteenthStrings"];
    }
    if (self.tArrayOfStringsForSoloAnalyzer.count < self.tripletNoteArrayClicker) {
        [self incrementArrayNamed:@"tripletStrings"];
    }
    
 /*   if (self.currentKeyIndex == 0) {
        stringForChord = @"C";
    } else if (self.currentKeyIndex == 1) stringForChord = @"C#";
    else if (self.currentKeyIndex == 2) stringForChord = @"D";
    else if (self.currentKeyIndex == 3) stringForChord = @"D#";
    else if (self.currentKeyIndex == 4) stringForChord = @"E";
    else if (self.currentKeyIndex == 5) stringForChord = @"F";
    else if (self.currentKeyIndex == 6) stringForChord = @"F#";
    else if (self.currentKeyIndex == 7) stringForChord = @"G";
    else if (self.currentKeyIndex == 8) stringForChord = @"G#";
    else if (self.currentKeyIndex == 9) stringForChord = @"A";
    else if (self.currentKeyIndex == 10) stringForChord = @"A#";
    else if (self.currentKeyIndex == 11) stringForChord = @"B";
    else if (self.currentKeyIndex == 12) stringForChord = @"Cm";
    else if (self.currentKeyIndex == 13) stringForChord = @"C#m";
    else if (self.currentKeyIndex == 14) stringForChord = @"Dm";
    else if (self.currentKeyIndex == 15) stringForChord = @"D#m";
    else if (self.currentKeyIndex == 16) stringForChord = @"Em";
    else if (self.currentKeyIndex == 17) stringForChord = @"Fm";
    else if (self.currentKeyIndex == 18) stringForChord = @"F#m";
    else if (self.currentKeyIndex == 19) stringForChord = @"Gm";
    else if (self.currentKeyIndex == 20) stringForChord = @"G#m";
    else if (self.currentKeyIndex == 21) stringForChord = @"Am";
    else if (self.currentKeyIndex == 22) stringForChord = @"A#m";
    else if (self.currentKeyIndex == 23) stringForChord = @"Bm";*/
    
//**** conversions for MAJOR *****
    if (self.currentKeyIndex < 12) {
        if (selectedRowInFirstComponent <= 2) {
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent*2;
        }
        if (selectedRowInFirstComponent > 2 && selectedRowInFirstComponent < 7) {
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent*2 - 1;
        }
        if (selectedRowInFirstComponent > 6 && selectedRowInFirstComponent < 10) {
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent*2;
        }
        if (selectedRowInFirstComponent > 9) {
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent*2 - 1;
        }
    }
//**** conversions for MINOR ****
    else if (self.currentKeyIndex > 11) {
        //selectedRowInFirstComponent += 7; 
        if (selectedRowInFirstComponent == 0) {
            localChromaticIndexForCorrectNote = 0;
        } else if (selectedRowInFirstComponent == 1) {
            localChromaticIndexForCorrectNote = 2;
        } else if (selectedRowInFirstComponent == 2) {
            localChromaticIndexForCorrectNote = 3;
        } else if (selectedRowInFirstComponent == 3) {
            localChromaticIndexForCorrectNote = 5;
        } else if (selectedRowInFirstComponent == 4) {
            localChromaticIndexForCorrectNote = 7;
        } else if (selectedRowInFirstComponent == 5) {
            localChromaticIndexForCorrectNote = 8;
        } else if (selectedRowInFirstComponent == 6) {
            localChromaticIndexForCorrectNote = 10;
        }
        if (selectedRowInFirstComponent > 6 && selectedRowInFirstComponent < 9) {  // the selected row is still 0 damnit... these are for 7ths
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent*2 - 14;
        }
        else if (selectedRowInFirstComponent == 9) {
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent - 6;
        }
        else if (selectedRowInFirstComponent == 10) {
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent - 5;
        }
        else if (selectedRowInFirstComponent == 11) {
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent - 4;
        }
        else if (selectedRowInFirstComponent == 12) {
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent - 4;
        }
        else if (selectedRowInFirstComponent == 13) {
            localChromaticIndexForCorrectNote = selectedRowInFirstComponent - 3;
        }
    }
    // can just append %i, localChromaticIndex here, for root index, then append m if minor, d if diminished. absence of letter is major
   // stringForChord = [stringForChord stringByAppendingFormat:@"%i", localChromaticIndexForCorrectNote];
    
    stringForChord = [NSString stringWithFormat:@"%i:", self.currentKeyIndex + localChromaticIndexForCorrectNote];
    
    
     NSLog(@"%@", stringForChord);
  // repair work   
    if (selectedRowInFirstComponent < 7 && self.currentKeyIndex < 12)    {
        
        if (selectedRowInFirstComponent == 1 || selectedRowInFirstComponent == 2 || selectedRowInFirstComponent == 5) {
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 3]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
            
           // stringForChord = [stringForChord stringByAppendingString:[self.firstBarCreatorView.minorChordsForPicker objectAtIndex:localChromaticIndexForCorrectNote]];
            stringForChord = [stringForChord stringByAppendingString:@"m"];
            
        } else if (selectedRowInFirstComponent == 6){
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 3]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 6]];
            
           // stringForChord = [[stringForChord stringByAppendingString:[self.firstBarCreatorView.keyPickerViewChoices objectAtIndex:localChromaticIndexForCorrectNote]] stringByAppendingString:@"dim"];
            stringForChord = [stringForChord stringByAppendingString:@"d"];
           
            
        } else {
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]]; 
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 4]]; 
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
            stringForChord = [stringForChord stringByAppendingString:@"r"];
        }
    }
    else if (selectedRowInFirstComponent < 7 && self.currentKeyIndex > 11){
            
            if (selectedRowInFirstComponent == 2 || selectedRowInFirstComponent == 5 || selectedRowInFirstComponent == 6) {
                
                [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]]; 
                
                [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 4]]; 
                
                [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
                 stringForChord = [stringForChord stringByAppendingString:@"r"];
                
            } else if (selectedRowInFirstComponent == 1) {
                
                [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]];
                
                [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 3]];
                
                [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 6]];
                stringForChord = [stringForChord stringByAppendingString:@"d"];

            } else {
                [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]];
                
                [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 3]];
                
                [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
                stringForChord = [stringForChord stringByAppendingString:@"m"];

            }
            
    }
 // repair work end       
     /*   if (self.currentKeyIndex < 12) { // what about the minor triads?  duh.... and a diminshed...  need to modify selectedRowInFirstComponent ranges....
                                            // and use different intervals depending on which row, also, need to fix picker wheel...
            [[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote] prepareToPlay];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]]; 
            
            [[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 4] prepareToPlay];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 4]]; 
            
            [[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7] prepareToPlay];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
    
        } else if (self.currentKeyIndex > 11){  // - 12's will be - 24's when two octaves are added
            
            [[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote] prepareToPlay];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:(self.currentKeyIndex - 12) + localChromaticIndexForCorrectNote]];
            
            [[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 3] prepareToPlay];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12 + localChromaticIndexForCorrectNote + 3]];
            
            [[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7] prepareToPlay];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12 + localChromaticIndexForCorrectNote + 7]]; 
            
        } else NSLog(@"Shit");*/
  // repair work  
     /*if(selectedRowInFirstComponent > 6){
        
        if (self.currentKeyIndex < 12) {
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 4]];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 11]];
            
        } else if (self.currentKeyIndex > 11){ // - 12's will be - 24's when 2nd audio octave added
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12 + localChromaticIndexForCorrectNote]];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12 + localChromaticIndexForCorrectNote + 3]];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12+ localChromaticIndexForCorrectNote + 7]]; 
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12 + localChromaticIndexForCorrectNote + 10]];
            
        } else NSLog(@"Shit");
        
    } else NSLog(@"Shit Shit");*/
    
    if (selectedRowInFirstComponent > 6 && self.currentKeyIndex < 12)    {
        
        if (selectedRowInFirstComponent == 1 || selectedRowInFirstComponent == 2 || selectedRowInFirstComponent == 5) {
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 3]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12 + localChromaticIndexForCorrectNote + 10]];
            stringForChord = [stringForChord stringByAppendingString:@"m"];

            
        } else if (selectedRowInFirstComponent == 6){
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 3]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 6]];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12 + localChromaticIndexForCorrectNote + 10]];
            stringForChord = [stringForChord stringByAppendingString:@"d"];

            
        } else {
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]]; 
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 4]]; 
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 11]];
             stringForChord = [stringForChord stringByAppendingString:@"r"];

        }
    }
    else if (selectedRowInFirstComponent > 6 && self.currentKeyIndex > 11){
        
        if (selectedRowInFirstComponent == 2 || selectedRowInFirstComponent == 5 || selectedRowInFirstComponent == 6) {
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]]; 
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 4]]; 
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 11]];
             stringForChord = [stringForChord stringByAppendingString:@"r"];

        } else if (selectedRowInFirstComponent == 1) {
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 3]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 6]];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12 + localChromaticIndexForCorrectNote + 10]];
            stringForChord = [stringForChord stringByAppendingString:@"d"];

        } else {
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 3]];
            
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex + localChromaticIndexForCorrectNote + 7]];
            [chordArray addObject:[localChroma.chromaticArrayOfPlayersInTheThirdOctave objectAtIndex:self.currentKeyIndex - 12 + localChromaticIndexForCorrectNote + 10]];
            stringForChord = [stringForChord stringByAppendingString:@"m"];

        }
        
    }
    
    NSLog(@"%@", stringForChord);
   // end repair     
            //---------> Next, replace the appropriate index in the appropriate arrayofstrings... 
            // QUARTERS put into e and as
            if (selectedRowInThirdComponent == 0) {
                if (![[self.quarterNoteArrayOfEmptyAudioPlayers objectAtIndex:selectedRowInSecondComponent + self.quarterNoteArrayClicker] isKindOfClass:[NSArray class]]) {
                [self.quarterNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInSecondComponent + self.quarterNoteArrayClicker withObject:chordArray];
                
                    [self.qArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:selectedRowInSecondComponent + self.quarterNoteArrayClicker withObject:stringForChord];      
                 
                [self.temporaryQuarterNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInSecondComponent withObject:chordArray];  
                
                  
                    
                } else { [self.quarterNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInSecondComponent + self.quarterNoteArrayClicker withObject:[NSNull null]];
                    [self.temporaryQuarterNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInSecondComponent withObject:[NSNull null]];
                    [self.qArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:selectedRowInSecondComponent + self.quarterNoteArrayClicker withObject:[NSNull null]];
                }
            }
             // E AND A'S   move up one.
            if (selectedRowInSecondComponent == 0 && selectedRowInThirdComponent != 0 && selectedRowInThirdComponent < 4) {
                
                
                if (![[self.sixteenthNoteArrayOfEmptyAudioPlayers objectAtIndex:selectedRowInThirdComponent + self.sixteenthNoteArrayClicker] isKindOfClass:[NSArray class]]) {
                    [self.sixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:chordArray];
                    [self.sArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:stringForChord];
                    
                    [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInThirdComponent withObject:chordArray];
                    
                } else { [self.sixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:[NSNull null]];
                    [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInThirdComponent  withObject:[NSNull null]];
                    [self.sArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:[NSNull null]];
                }
            }
            
            if (selectedRowInSecondComponent == 1 && selectedRowInThirdComponent != 0 && selectedRowInThirdComponent < 4) {
                
                
                if (![[self.sixteenthNoteArrayOfEmptyAudioPlayers objectAtIndex:4 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker]isKindOfClass: [NSArray class]]) {
                    [self.sixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:4 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:chordArray];
                    [self.sArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:4 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:stringForChord];
                    [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:4 + selectedRowInThirdComponent withObject:chordArray];
                    
                } else { [self.sixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:4 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:[NSNull null]];
                    [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:4 + selectedRowInThirdComponent withObject:[NSNull null]];
                    [self.sArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:4 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:[NSNull null]];
                }
            }
            
            if (selectedRowInSecondComponent == 2 && selectedRowInThirdComponent != 0 && selectedRowInThirdComponent < 4) {
                    
                    
                    if (![[self.sixteenthNoteArrayOfEmptyAudioPlayers objectAtIndex:8 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker] isKindOfClass:[NSArray class]]) {
                        [self.sixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:8 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:chordArray];
                        [self.sArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:8 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:stringForChord];
                        [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:8 + selectedRowInThirdComponent withObject:chordArray];
                        
                    } else { [self.sixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:8 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:[NSNull null]];
                        [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:8 + selectedRowInThirdComponent withObject:[NSNull null]];
                        [self.sArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:8 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:[NSNull null]];
                    }
            }
            
            if (selectedRowInSecondComponent == 3 && selectedRowInThirdComponent != 0 && selectedRowInThirdComponent < 4) {
            
            
                if (![[self.sixteenthNoteArrayOfEmptyAudioPlayers objectAtIndex:12 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker] isKindOfClass:[NSArray class]]) {
                    [self.sixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:12 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:chordArray];
                    [self.sArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:12 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:stringForChord];
                    [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:12 + selectedRowInThirdComponent withObject:chordArray];
                    
                } else { [self.sixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:12 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:[NSNull null]];
                    [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:12 + selectedRowInThirdComponent withObject:[NSNull null]];
                    [self.sArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:12 + selectedRowInThirdComponent + self.sixteenthNoteArrayClicker withObject:[NSNull null]];
                }
            }
            // TRIPLETS
                if (selectedRowInThirdComponent >= 4 && selectedRowInSecondComponent == 0) {
                    if (![[self.tripletNoteArrayOfEmptyAudioPlayers objectAtIndex:selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker] isKindOfClass:[NSArray class]]) {
                        [self.tripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:chordArray];
                        [self.tArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:stringForChord];
                         [self.temporaryTripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInThirdComponent - 3 withObject:chordArray];
                        
                    } else { [self.tripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:[NSNull null]];
                        [self.temporaryTripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:selectedRowInThirdComponent - 3 withObject:[NSNull null]];
                        [self.tArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:[NSNull null]];
                }
                }   
                if (selectedRowInThirdComponent >= 4 && selectedRowInSecondComponent == 1) {
                    if (![[self.tripletNoteArrayOfEmptyAudioPlayers objectAtIndex:3 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker] isKindOfClass:[NSArray class]]) {
                        [self.tripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:3 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:chordArray];
                        [self.tArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:3 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:stringForChord];
                        
                        [self.temporaryTripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:3 + selectedRowInThirdComponent - 3 withObject:chordArray];
                        
                    } else { [self.tripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:3 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:[NSNull null]];
                        [self.temporaryTripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:3 + selectedRowInThirdComponent - 3 withObject:[NSNull null]];
                        [self.tArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:3 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:[NSNull null]];
                }
                }
                
                if (selectedRowInThirdComponent >= 4 && selectedRowInSecondComponent == 2) {
                    if (![[self.tripletNoteArrayOfEmptyAudioPlayers objectAtIndex:6 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker] isKindOfClass:[NSArray class]]) {
                        [self.tripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:6 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:chordArray];
                        [self.tArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:6 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:stringForChord];
                        [self.temporaryTripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:6 + selectedRowInThirdComponent - 3 withObject:chordArray];
                        
                    } else { [self.tripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:6 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:[NSNull null]];
                        [self.temporaryTripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:6 + selectedRowInThirdComponent - 3 withObject:[NSNull null]];
                         [self.tArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:6 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:[NSNull null]];
                }
                }
            
                if (selectedRowInThirdComponent >= 4 && selectedRowInSecondComponent == 3) {
                    if (![[self.tripletNoteArrayOfEmptyAudioPlayers objectAtIndex:9 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker] isKindOfClass:[NSArray class]]) {
                        [self.tripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:9 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:chordArray];
                        [self.tArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:9 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:stringForChord];
                        [self.temporaryTripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:9 + selectedRowInThirdComponent - 3 withObject:chordArray];
                        
                    } else { [self.tripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:9 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:[NSNull null]];
                        [self.temporaryTripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:9 + selectedRowInThirdComponent - 3 withObject:[NSNull null]];
                        [self.tArrayOfStringsForSoloAnalyzer replaceObjectAtIndex:9 + selectedRowInThirdComponent - 3 + self.tripletNoteArrayClicker withObject:[NSNull null]];
                }
                }
    [self incrementArrayNamed:@"chroma"];
    self.chromaFromArrayIndexer += 1;
    
//    [self incrementArrayNamed:@"quarterEmpty"]; // by 4
//    [self incrementArrayNamed:@"sixteenthEmpty"]; // by 16
//    [self incrementArrayNamed:@"tripletEmpty"]; // by 12
    

    if (self.quickPlayActive == NO) {
        
    
    [self.firstBarCreatorView updateBarDisplayUsingTemporaryQuarterNoteArray:self.temporaryQuarterNoteArrayOfEmptyAudioPlayers temporarySixteenthNoteArray:self.temporarySixteenthNoteArrayOfEmptyAudioPlayers temporaryTripletArray:self.temporaryTripletNoteArrayOfEmptyAudioPlayers andKeyIndex:self.currentKeyIndex andChordRow:selectedRowInFirstComponent];
    
    }
    
/*    for (NSArray *array in self.quarterNoteArrayOfEmptyAudioPlayers) {
        for (AVAudioPlayer *player in array) {
            [player prepareToPlay];
        }
    }
    for (NSArray *array in self.sixteenthNoteArrayOfEmptyAudioPlayers) {
        for (AVAudioPlayer *player in array) {
            [player prepareToPlay];
        }
    }
    for (NSArray *array in self.tripletNoteArrayOfEmptyAudioPlayers) {
        for (AVAudioPlayer *player in array) {
            [player prepareToPlay];
        }
    }*/
}

    
    

    
    
-(void)playCurrentBar{
    
    int localQuarterClicker = 0;
    __block int localSixteenthClicker = 0;
    int localTripletClicker = 0;
    
    self.theTripletChunker = 0;
    self.the16thChunker = 0;
    for (NSArray *arrayOfChords in self.temporaryQuarterNoteArrayOfEmptyAudioPlayers) {
        if (![arrayOfChords isKindOfClass:[NSArray class]]) {
            self.the16thChunker += 4;
            self.theTripletChunker += 3;
            localQuarterClicker += 1;
            continue;
        } else{
        
        self.chunk16thArray = [NSMutableArray arrayWithObjects:[self.temporarySixteenthNoteArrayOfEmptyAudioPlayers objectAtIndex:0 + self.the16thChunker], [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers objectAtIndex:1 + self.the16thChunker], [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers objectAtIndex:2 + self.the16thChunker], [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers objectAtIndex:3 + self.the16thChunker], nil];
        self.the16thChunker += 4;
        
        self.chunkTripletArray = [NSMutableArray arrayWithObjects:[self.temporaryTripletNoteArrayOfEmptyAudioPlayers objectAtIndex:0 + self.theTripletChunker], [self.temporaryTripletNoteArrayOfEmptyAudioPlayers objectAtIndex:1 + self.theTripletChunker], [self.temporaryTripletNoteArrayOfEmptyAudioPlayers objectAtIndex:2 + self.theTripletChunker], nil];
        self.theTripletChunker += 3;
    
        for (AVAudioPlayer *player in arrayOfChords) {
            [player playAtTime:player.deviceCurrentTime + self.quarterNoteTime*localQuarterClicker];
        }
        
  //---sixteenths          
          for (NSArray *sixteenthArray in self.chunk16thArray) { 
              if (![sixteenthArray isKindOfClass:[NSArray class]]) {
                  localSixteenthClicker += 1;
                  continue;
              }else {
         
         

              for (AVAudioPlayer *sixteenthPlayer in sixteenthArray) {
                  [sixteenthPlayer playAtTime:sixteenthPlayer.deviceCurrentTime + (self.quarterNoteTime/4)*localSixteenthClicker]; 
              }
              localSixteenthClicker += 1;
              }
         
         }
    //--triplets
        
        for (NSArray *tripletArray in self.chunkTripletArray) {
            if (![tripletArray isKindOfClass:[NSArray class]]) {
                localTripletClicker += 1;
                continue;
            }else {
            
            
            for (AVAudioPlayer *tripletPlayer in tripletArray) {
               //[tripletPlayer playAtTime:tripletPlayer.deviceCurrentTime + (tripletNoteTime([self.tempo floatValue]))*.95*localTripletClicker];
                [tripletPlayer playAtTime:tripletPlayer.deviceCurrentTime + (self.quarterNoteTime/3)*localTripletClicker];
                
            }
            localTripletClicker += 1;
            }
        }
        
         localQuarterClicker += 1;
        }
    }
}



#pragma mark NEW_BAR_METHODS

-(void)repeatTheCurrentBar{  // THIS DOES NOT WORK
    
    // eventually can spruce up with a x2 x3 or x4 feature that leaves you with a new bar at the end as well....
    [self incrementArrayNamed:@"quarterEmpty"];
    [self incrementArrayNamed:@"sixteenthEmpty"];
    [self incrementArrayNamed:@"tripletEmpty"];
    
    [self incrementArrayNamed:@"quarterStrings"];
    [self incrementArrayNamed:@"sixteenthStrings"];
    [self incrementArrayNamed:@"tripletStrings"];
    
  /*  for (int i = 0; i < 4; i++) {
        [self.quarterNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:i + 4 withObject:[self.quarterNoteArrayOfEmptyAudioPlayers objectAtIndex:i]];
        
        // THIS ELIMINATES THE PREVIOUS BAR, ALSO, WON'T WORK BECAUSE USING SAME INSTANCE FROM CHROMA
    }
    for (int i = 0; i < 16; i++) {
        [self.sixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:i + 16 withObject:[self.sixteenthNoteArrayOfEmptyAudioPlayers objectAtIndex:i]];
    }
    for (int i = 0; i < 12; i++) {
        [self.tripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:i + 12 withObject:[self.tripletNoteArrayOfEmptyAudioPlayers objectAtIndex:i]];
    }*/
    
  /*  [self.quarterNoteArrayOfEmptyAudioPlayers addObjectsFromArray:self.temporaryQuarterNoteArrayOfEmptyAudioPlayers];
    [self.sixteenthNoteArrayOfEmptyAudioPlayers addObjectsFromArray:self.temporarySixteenthNoteArrayOfEmptyAudioPlayers];
    [self.tripletNoteArrayOfEmptyAudioPlayers addObjectsFromArray:self.temporaryTripletNoteArrayOfEmptyAudioPlayers];*/
    
    
    
    //will need to increment masterChunkers in the full play version... OR WILL I!? need to make the master play method.
    
    self.quarterNoteArrayClicker += 4;
    self.sixteenthNoteArrayClicker += 16; // += 1 so that repeated bar is editable
    self.tripletNoteArrayClicker += 12;
    
}

-(void)newBarMethod{
    
    self.quarterNoteArrayClicker += 4;
    self.sixteenthNoteArrayClicker += 16;
    self.tripletNoteArrayClicker += 12;
    
    [self incrementArrayNamed:@"quarterEmpty"];
    [self incrementArrayNamed:@"sixteenthEmpty"];
    [self incrementArrayNamed:@"tripletEmpty"];
    [self incrementArrayNamed:@"quarterStrings"];
    [self incrementArrayNamed:@"sixteenthStrings"];
    [self incrementArrayNamed:@"tripletStrings"];
    
    // will need to increment masterChunkers in the full play version... OR WILL I!?
    
    
    for (int i = 0; i < 4; i++) {
        [self.temporaryQuarterNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:i withObject:[NSNull null]];
    }
    
    for (int i = 0; i < 12; i++) {
        [self.temporaryTripletNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:i withObject:[NSNull null]];
    }
    
    for (int i = 0; i < 16; i++) {
        [self.temporarySixteenthNoteArrayOfEmptyAudioPlayers replaceObjectAtIndex:i withObject:[NSNull null]];
    }
    
    if (self.quickPlayActive == NO) {
        
    [self.firstBarCreatorView updateBarDisplayUsingTemporaryQuarterNoteArray:self.temporaryQuarterNoteArrayOfEmptyAudioPlayers temporarySixteenthNoteArray:self.temporarySixteenthNoteArrayOfEmptyAudioPlayers temporaryTripletArray:self.temporaryTripletNoteArrayOfEmptyAudioPlayers andKeyIndex:self.currentKeyIndex  andChordRow:0];
    }
    
    // clear out graphics
    
    if (self.quarterNoteArrayClicker > 24) {
        [self.firstBarCreatorView killNewBarOption];
    }
    
   
    
}


#pragma mark ARRAYS_ARE_READY

-(void)arraysAreReadyForPlay{
    
        
    [self.firstBarCreatorView removeFromSuperview];
    
    int numberOfBars = self.quarterNoteArrayClicker/4;
    NSLog(@"number of calculated bars %i", numberOfBars);
    
    [self.viewControllerDelegate passNumberOfBarsForOptionsBlocker:numberOfBars];    
    
    [self.viewControllerDelegate passArraysAlongToSoloView:self.quarterNoteArrayOfEmptyAudioPlayers :self.sixteenthNoteArrayOfEmptyAudioPlayers :self.tripletNoteArrayOfEmptyAudioPlayers withKeyIndex:self.currentKeyIndex];
    [self.viewControllerDelegate passStringsForSoloAnalyzer:self.qArrayOfStringsForSoloAnalyzer :self.sArrayOfStringsForSoloAnalyzer :self.tArrayOfStringsForSoloAnalyzer withKeyIndex:self.currentKeyIndex];// this was moved from log chord method to here
    

    
}

-(void)returnToMainMenu{
    
    [self.viewControllerDelegate returnFromBar];
    
}



@end
