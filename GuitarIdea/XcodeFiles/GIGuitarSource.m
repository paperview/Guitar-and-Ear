//
//  GIGuitarSource.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/20/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GIGuitarSource.h"
#import "GITempoConstructs.h"

@interface GIGuitarSource()

@property (nonatomic, strong) NSURL *urlE2;
@property (nonatomic, strong) NSURL *urlF2;
@property (nonatomic, strong) NSURL *urlFSharp2;
@property (nonatomic, strong) NSURL *urlG2;
@property (nonatomic, strong) NSURL *urlGSharp2;
@property (nonatomic, strong) NSURL *urlA2; 
@property (nonatomic, strong) NSURL *urlASharp2;
@property (nonatomic, strong) NSURL *urlB2;

@property (nonatomic, strong) NSURL *urlC3;
@property (nonatomic, strong) NSURL *urlCSharp3;
@property (nonatomic, strong) NSURL *urlD3;
@property (nonatomic, strong) NSURL *urlDSharp3;
@property (nonatomic, strong) NSURL *urlE3;
@property (nonatomic, strong) NSURL *urlF3;
@property (nonatomic, strong) NSURL *urlFSharp3;
@property (nonatomic, strong) NSURL *urlG3;
@property (nonatomic, strong) NSURL *urlGSharp3;
@property (nonatomic, strong) NSURL *urlA3; 
@property (nonatomic, strong) NSURL *urlASharp3;
@property (nonatomic, strong) NSURL *urlB3;

@property (nonatomic, strong) NSURL *urlC4;
@property (nonatomic, strong) NSURL *urlCSharp4;
@property (nonatomic, strong) NSURL *urlD4;
@property (nonatomic, strong) NSURL *urlDSharp4;
@property (nonatomic, strong) NSURL *urlE4;
@property (nonatomic, strong) NSURL *urlF4;
@property (nonatomic, strong) NSURL *urlFSharp4;
@property (nonatomic, strong) NSURL *urlG4;
@property (nonatomic, strong) NSURL *urlGSharp4;
@property (nonatomic, strong) NSURL *urlA4; 
@property (nonatomic, strong) NSURL *urlASharp4;
@property (nonatomic, strong) NSURL *urlB4;

@property (nonatomic, strong) NSURL *urlC5;
@property (nonatomic, strong) NSURL *urlCSharp5;
@property (nonatomic, strong) NSURL *urlD5;
@property (nonatomic, strong) NSURL *urlDSharp5;
@property (nonatomic, strong) NSURL *urlE5;

@property (nonatomic, strong) NSURL *emptyURL;

@property (nonatomic, strong) NSArray *stringsOfIndecesForKeys;


@end

@implementation GIGuitarSource

@synthesize dictionaryOfGuitarPlayers;
@synthesize stringsOfIndecesForKeys;

@synthesize emptyURL;

@synthesize urlA3;
@synthesize urlA4;
@synthesize urlB3;
@synthesize urlB4;
@synthesize urlC3;
@synthesize urlC4;
@synthesize urlD3;
@synthesize urlD4;
@synthesize urlE3;
@synthesize urlE4;
@synthesize urlF3;
@synthesize urlF4;
@synthesize urlG3;
@synthesize urlG4;
@synthesize urlASharp3;
@synthesize urlASharp4;
@synthesize urlCSharp3;
@synthesize urlCSharp4;
@synthesize urlDSharp3;
@synthesize urlDSharp4;
@synthesize urlFSharp3;
@synthesize urlFSharp4;
@synthesize urlGSharp3;
@synthesize urlGSharp4;
@synthesize urlA2;
@synthesize urlB2;
@synthesize urlC5;
@synthesize urlD5;
@synthesize urlE2;
@synthesize urlE5;
@synthesize urlF2;
@synthesize urlG2;
@synthesize urlASharp2;
@synthesize urlCSharp5;
@synthesize urlDSharp5;
@synthesize urlFSharp2;
@synthesize urlGSharp2;

@synthesize guitarA3Player;
@synthesize guitarA4Player;
@synthesize guitarB3Player;
@synthesize guitarB4Player;
@synthesize guitarC3Player;
@synthesize guitarC4Player;
@synthesize guitarD3Player;
@synthesize guitarD4Player;
@synthesize guitarE3Player;
@synthesize guitarE4Player;
@synthesize guitarF3Player;
@synthesize guitarF4Player;
@synthesize guitarG3Player;
@synthesize guitarG4Player;
@synthesize guitarASharp3Player;
@synthesize guitarASharp4Player;
@synthesize guitarCSharp3Player;
@synthesize guitarCSharp4Player;
@synthesize guitarDSharp3Player;
@synthesize guitarDSharp4Player;
@synthesize guitarFSharp3Player;
@synthesize guitarFSharp4Player;
@synthesize guitarGSharp3Player;
@synthesize guitarGSharp4Player;
@synthesize guitarA2Player;
@synthesize guitarB2Player;
@synthesize guitarC5Player;
@synthesize guitarD5Player;
@synthesize guitarE2Player;
@synthesize guitarE5Player;
@synthesize guitarF2Player;
@synthesize guitarG2Player;
@synthesize guitarASharp2Player;
@synthesize guitarCSharp5Player;
@synthesize guitarDSharp5Player;
@synthesize guitarFSharp2Player;
@synthesize guitarGSharp2Player;

@synthesize emptyAudioPlayer;

@synthesize arrayOfGuitarAudioPlayersThirdAndFourthOctaves;
@synthesize arrayOfAllGuitarPlayersFromE2ThroughE5;
@synthesize thirdOctaveArrayOfGuitarPlayers;
@synthesize secondOctaveFromEArrayOfGuitarPlayers;
@synthesize fifthOctaveArrayOfGuitarPlayers;
@synthesize fourthOctaceArrayOfGuitarPlayers;



-(id)init{
    
    if (self = [super init]) {
    
   /*     NSString *bundleE2 = [[NSBundle mainBundle] pathForResource:@"GuitarE2" ofType:@"wav"];
        NSString *bundleF2 = [[NSBundle mainBundle] pathForResource:@"GuitarF2" ofType:@"wav"];
        NSString *bundleFSharp2 = [[NSBundle mainBundle] pathForResource:@"GuitarF#2" ofType:@"wav"];
        NSString *bundleG2 = [[NSBundle mainBundle] pathForResource:@"GuitarG2" ofType:@"wav"];
        NSString *bundleGSharp2 = [[NSBundle mainBundle] pathForResource:@"GuitarG#2" ofType:@"wav"];
        NSString *bundleA2 = [[NSBundle mainBundle] pathForResource:@"GuitarA2" ofType:@"wav"];
        NSString *bundleASharp2 = [[NSBundle mainBundle] pathForResource:@"GuitarA#2" ofType:@"wav"];
        NSString *bundleB2 = [[NSBundle mainBundle] pathForResource:@"GuitarB2" ofType:@"wav"];*/
        
        NSString *bundleC3 = [[NSBundle mainBundle] pathForResource:@"AGuiC3" ofType:@"caf"];
        NSString *bundleCSharp3 = [[NSBundle mainBundle] pathForResource:@"AGuiC#3" ofType:@"caf"];
        NSString *bundleD3 = [[NSBundle mainBundle] pathForResource:@"AGuiD3" ofType:@"caf"];
        NSString *bundleDSharp3 = [[NSBundle mainBundle] pathForResource:@"AGuiD#3" ofType:@"caf"];
        NSString *bundleE3 = [[NSBundle mainBundle] pathForResource:@"AGuiE3" ofType:@"caf"];
        NSString *bundleF3 = [[NSBundle mainBundle] pathForResource:@"AGuiF3" ofType:@"caf"];
        NSString *bundleFSharp3 = [[NSBundle mainBundle] pathForResource:@"AGuiF#3" ofType:@"caf"];
        NSString *bundleG3 = [[NSBundle mainBundle] pathForResource:@"AGuiG3" ofType:@"caf"];
        NSString *bundleGSharp3 = [[NSBundle mainBundle] pathForResource:@"AGuiG#3" ofType:@"caf"];
        NSString *bundleA3 = [[NSBundle mainBundle] pathForResource:@"AGuiA3" ofType:@"caf"];
        NSString *bundleASharp3 = [[NSBundle mainBundle] pathForResource:@"AGuiA#3" ofType:@"caf"];
        NSString *bundleB3 = [[NSBundle mainBundle] pathForResource:@"AGuiB3" ofType:@"caf"];
        
        NSString *bundleC4 = [[NSBundle mainBundle] pathForResource:@"AGuiC4" ofType:@"caf"];
        NSString *bundleCSharp4 = [[NSBundle mainBundle] pathForResource:@"AGuiC#4" ofType:@"caf"];
        NSString *bundleD4 = [[NSBundle mainBundle] pathForResource:@"AGuiD4" ofType:@"caf"];
        NSString *bundleDSharp4 = [[NSBundle mainBundle] pathForResource:@"AGuiD#4" ofType:@"caf"];
        NSString *bundleE4 = [[NSBundle mainBundle] pathForResource:@"AGuiE4" ofType:@"caf"];
        NSString *bundleF4 = [[NSBundle mainBundle] pathForResource:@"AGuiF4" ofType:@"caf"];
        NSString *bundleFSharp4 = [[NSBundle mainBundle] pathForResource:@"AGuiF#4" ofType:@"caf"];
        NSString *bundleG4 = [[NSBundle mainBundle] pathForResource:@"AGuiG4" ofType:@"caf"];
        NSString *bundleGSharp4 = [[NSBundle mainBundle] pathForResource:@"AGuiG#4" ofType:@"caf"];
        NSString *bundleA4 = [[NSBundle mainBundle] pathForResource:@"AGuiA4" ofType:@"caf"];
        NSString *bundleASharp4 = [[NSBundle mainBundle] pathForResource:@"AGuiA#4" ofType:@"caf"];
        NSString *bundleB4 = [[NSBundle mainBundle] pathForResource:@"AGuiB4" ofType:@"caf"];
        
    /*    NSString *bundleC5 = [[NSBundle mainBundle] pathForResource:@"GuitarC4" ofType:@"wav"];
        NSString *bundleCSharp5 = [[NSBundle mainBundle] pathForResource:@"GuitarC#4" ofType:@"wav"];
        NSString *bundleD5 = [[NSBundle mainBundle] pathForResource:@"GuitarD4" ofType:@"wav"];
        NSString *bundleDSharp5 = [[NSBundle mainBundle] pathForResource:@"GuitarD#4" ofType:@"wav"];
        NSString *bundleE5 = [[NSBundle mainBundle] pathForResource:@"GuitarE4" ofType:@"wav"];*/
        
     /*   self.urlE2 = [NSURL fileURLWithPath:bundleE2];
        self.urlF2 = [NSURL fileURLWithPath:bundleF2];
        self.urlFSharp2 = [NSURL fileURLWithPath:bundleFSharp2];
        self.urlG2 = [NSURL fileURLWithPath:bundleG2];
        self.urlGSharp2 = [NSURL fileURLWithPath:bundleGSharp2];
        self.urlA2 = [NSURL fileURLWithPath:bundleA2];
        self.urlASharp2 = [NSURL fileURLWithPath:bundleASharp2];
        self.urlB2 = [NSURL fileURLWithPath:bundleB2];*/
        
        self.urlC3 = [NSURL fileURLWithPath:bundleC3];
        self.urlCSharp3 = [NSURL fileURLWithPath:bundleCSharp3];
        self.urlD3 = [NSURL fileURLWithPath:bundleD3];
        self.urlDSharp3 = [NSURL fileURLWithPath:bundleDSharp3];
        self.urlE3 = [NSURL fileURLWithPath:bundleE3];
        self.urlF3 = [NSURL fileURLWithPath:bundleF3];
        self.urlFSharp3 = [NSURL fileURLWithPath:bundleFSharp3];
        self.urlG3 = [NSURL fileURLWithPath:bundleG3];
        self.urlGSharp3 = [NSURL fileURLWithPath:bundleGSharp3];
        self.urlA3 = [NSURL fileURLWithPath:bundleA3];
        self.urlASharp3 = [NSURL fileURLWithPath:bundleASharp3];
        self.urlB3 = [NSURL fileURLWithPath:bundleB3];
        
        self.urlC4 = [NSURL fileURLWithPath:bundleC4];
        self.urlCSharp4 = [NSURL fileURLWithPath:bundleCSharp4];
        self.urlD4 = [NSURL fileURLWithPath:bundleD4];
        self.urlDSharp4 = [NSURL fileURLWithPath:bundleDSharp4];
        self.urlE4 = [NSURL fileURLWithPath:bundleE4];
        self.urlF4 = [NSURL fileURLWithPath:bundleF4];
        self.urlFSharp4 = [NSURL fileURLWithPath:bundleFSharp4];
        self.urlG4 = [NSURL fileURLWithPath:bundleG4];
        self.urlGSharp4 = [NSURL fileURLWithPath:bundleGSharp4];
        self.urlA4 = [NSURL fileURLWithPath:bundleA4];
        self.urlASharp4 = [NSURL fileURLWithPath:bundleASharp4];
        self.urlB4 = [NSURL fileURLWithPath:bundleB4];
        
        
       
        
        
        
   /*   
    
    NSData *songFile = [[NSData alloc] initWithContentsOfURL:songCacheURL options:NSDataReadingMappedIfSafe error:&error1 ];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:songFile error:&error2];
    
    self.urlC5 = [NSURL fileURLWithPath:bundleC5];
        self.urlCSharp5 = [NSURL fileURLWithPath:bundleCSharp5];
        self.urlD5 = [NSURL fileURLWithPath:bundleD5];
        self.urlDSharp5 = [NSURL fileURLWithPath:bundleDSharp5];
        self.urlE5 = [NSURL fileURLWithPath:bundleE5];*/
        
        NSError *error = nil;    
        
        NSData *C3file = [[NSData alloc] initWithContentsOfURL:self.urlC3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *CSharp3file = [[NSData alloc] initWithContentsOfURL:self.urlCSharp3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *D3file = [[NSData alloc] initWithContentsOfURL:self.urlD3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *DSharp3file = [[NSData alloc] initWithContentsOfURL:self.urlDSharp3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *E3file = [[NSData alloc] initWithContentsOfURL:self.urlE3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *F3file = [[NSData alloc] initWithContentsOfURL:self.urlF3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *FSharp3file = [[NSData alloc] initWithContentsOfURL:self.urlFSharp3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *G3file = [[NSData alloc] initWithContentsOfURL:self.urlG3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *GSharp3file = [[NSData alloc] initWithContentsOfURL:self.urlGSharp3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *A3file = [[NSData alloc] initWithContentsOfURL:self.urlA3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *ASharp3file = [[NSData alloc] initWithContentsOfURL:self.urlASharp3 options:NSDataReadingMappedIfSafe error:&error];
        NSData *B3file = [[NSData alloc] initWithContentsOfURL:self.urlB3 options:NSDataReadingMappedIfSafe error:&error];
        
        NSData *C4file = [[NSData alloc] initWithContentsOfURL:self.urlC4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *CSharp4file = [[NSData alloc] initWithContentsOfURL:self.urlCSharp4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *D4file = [[NSData alloc] initWithContentsOfURL:self.urlD4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *DSharp4file = [[NSData alloc] initWithContentsOfURL:self.urlDSharp4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *E4file = [[NSData alloc] initWithContentsOfURL:self.urlE4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *F4file = [[NSData alloc] initWithContentsOfURL:self.urlF4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *FSharp4file = [[NSData alloc] initWithContentsOfURL:self.urlFSharp4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *G4file = [[NSData alloc] initWithContentsOfURL:self.urlG4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *GSharp4file = [[NSData alloc] initWithContentsOfURL:self.urlGSharp4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *A4file = [[NSData alloc] initWithContentsOfURL:self.urlA4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *ASharp4file = [[NSData alloc] initWithContentsOfURL:self.urlASharp4 options:NSDataReadingMappedIfSafe error:&error];
        NSData *B4file = [[NSData alloc] initWithContentsOfURL:self.urlB4 options:NSDataReadingMappedIfSafe error:&error];
        
        self.guitarC3Player = [[AVAudioPlayer alloc] initWithData:C3file error:&error];
        self.guitarCSharp3Player = [[AVAudioPlayer alloc] initWithData:CSharp3file error:&error];
        self.guitarD3Player = [[AVAudioPlayer alloc] initWithData:D3file error:&error];
        self.guitarDSharp3Player = [[AVAudioPlayer alloc] initWithData:DSharp3file error:&error];
        self.guitarE3Player = [[AVAudioPlayer alloc] initWithData:E3file error:&error];
        self.guitarF3Player = [[AVAudioPlayer alloc] initWithData:F3file error:&error];
        self.guitarFSharp3Player = [[AVAudioPlayer alloc] initWithData:FSharp3file error:&error];
        self.guitarG3Player = [[AVAudioPlayer alloc] initWithData:G3file error:&error];
        self.guitarGSharp3Player = [[AVAudioPlayer alloc] initWithData:GSharp3file error:&error];
        self.guitarA3Player = [[AVAudioPlayer alloc] initWithData:A3file error:&error];
        self.guitarASharp3Player = [[AVAudioPlayer alloc] initWithData:ASharp3file error:&error];
        self.guitarB3Player = [[AVAudioPlayer alloc] initWithData:B3file error:&error];
        
        self.guitarC4Player = [[AVAudioPlayer alloc] initWithData:C4file error:&error];
        self.guitarCSharp4Player = [[AVAudioPlayer alloc] initWithData:CSharp4file error:&error];
        self.guitarD4Player = [[AVAudioPlayer alloc] initWithData:D4file error:&error];
        self.guitarDSharp4Player = [[AVAudioPlayer alloc] initWithData:DSharp4file error:&error];
        self.guitarE4Player = [[AVAudioPlayer alloc] initWithData:E4file error:&error];
        self.guitarF4Player = [[AVAudioPlayer alloc] initWithData:F4file error:&error];
        self.guitarFSharp4Player = [[AVAudioPlayer alloc] initWithData:FSharp4file error:&error];
        self.guitarG4Player = [[AVAudioPlayer alloc] initWithData:G4file error:&error];
        self.guitarGSharp4Player = [[AVAudioPlayer alloc] initWithData:GSharp4file error:&error];
        self.guitarA4Player = [[AVAudioPlayer alloc] initWithData:A4file error:&error];
        self.guitarASharp4Player = [[AVAudioPlayer alloc] initWithData:ASharp4file error:&error];
        self.guitarB4Player = [[AVAudioPlayer alloc] initWithData:B4file error:&error];
        
        
      /*  self.guitarE2Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlE2 error:&error];
        self.guitarF2Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlF2 error:&error];
        self.guitarFSharp2Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlFSharp2 error:&error];
        self.guitarG2Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlG2 error:&error];
        self.guitarGSharp2Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlGSharp2 error:&error];
        self.guitarA2Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlA2 error:&error];
        self.guitarA2Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlASharp2 error:&error];
        self.guitarB2Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlB2 error:&error];*/
        
      /* self.guitarC3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlC3 error:&error];
        self.guitarCSharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlCSharp3 error:&error];
        self.guitarD3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlD3 error:&error];
        self.guitarDSharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlDSharp3 error:&error];
        self.guitarE3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlE3 error:&error];
        self.guitarF3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlF3 error:&error];
        self.guitarFSharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlFSharp3 error:&error];
        self.guitarG3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlG3 error:&error];
        self.guitarGSharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlGSharp3 error:&error];
        self.guitarA3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlA3 error:&error];
        self.guitarASharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlASharp3 error:&error];
        self.guitarB3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlB3 error:&error];
        
        self.guitarC4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlC4 error:&error];
        self.guitarCSharp4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlCSharp4 error:&error];
        self.guitarD4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlD4 error:&error];
        self.guitarDSharp4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlDSharp4 error:&error];
        self.guitarE4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlE4 error:&error];
        self.guitarF4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlF4 error:&error];
        self.guitarFSharp4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlFSharp4 error:&error];
        self.guitarG4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlG4 error:&error];
        self.guitarGSharp4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlGSharp4 error:&error];
        self.guitarA4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlA4 error:&error];
        self.guitarASharp4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlASharp4 error:&error];
        self.guitarB4Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlB4 error:&error];*/
        
      /*  self.guitarC5Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlC5 error:&error];
        self.guitarCSharp5Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlCSharp5 error:&error];
        self.guitarD5Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlD5 error:&error];
        self.guitarDSharp5Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlDSharp5 error:&error];
        self.guitarE5Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlE5 error:&error];*/
        
        
        
        
        
        
    /*    self.guitarC3Player.delegate = self;
        self.guitarCSharp3Player.delegate = self;
        self.guitarD3Player.delegate = self;
        self.guitarDSharp3Player.delegate = self;
        self.guitarE3Player.delegate = self;
        self.guitarF3Player.delegate = self;
        self.guitarFSharp3Player.delegate = self;
        self.guitarG3Player.delegate = self;
        self.guitarGSharp3Player.delegate = self;
        self.guitarA3Player.delegate = self;
        self.guitarASharp3Player.delegate = self;
        self.guitarB3Player.delegate = self;
        
        self.guitarC4Player.delegate = self;
        self.guitarCSharp4Player.delegate = self;
        self.guitarD4Player.delegate = self;
        self.guitarDSharp4Player.delegate = self;
        self.guitarE4Player.delegate = self;
        self.guitarF4Player.delegate = self;
        self.guitarFSharp4Player.delegate = self;
        self.guitarG4Player.delegate = self;
        self.guitarGSharp4Player.delegate = self;
        self.guitarA4Player.delegate = self;
        self.guitarASharp4Player.delegate = self;
        self.guitarB4Player.delegate = self;*/
        
        
        
    /*    self.guitarE2Player.volume = 0.2;
        self.guitarF2Player.volume = 0.2;
        self.guitarFSharp2Player.volume = 0.2;
        self.guitarG2Player.volume = 0.2;
        self.guitarGSharp2Player.volume = 0.2;
        self.guitarA2Player.volume = 0.2;
        self.guitarA2Player.volume = 0.2;
        self.guitarB2Player.volume = 0.2;*/
        
        self.guitarC3Player.volume = 0.2;
        self.guitarCSharp3Player.volume = 0.2;
        self.guitarD3Player.volume = 0.2;
        self.guitarDSharp3Player.volume = 0.2;
        self.guitarE3Player.volume = 0.2;
        self.guitarF3Player.volume = 0.2;
        self.guitarFSharp3Player.volume = 0.2;
        self.guitarG3Player.volume = 0.2;
        self.guitarGSharp3Player.volume = 0.2;
        self.guitarA3Player.volume = 0.2;
        self.guitarASharp3Player.volume = 0.2;
        self.guitarB3Player.volume = 0.2;
        
        self.guitarC4Player.volume = 0.2;
        self.guitarCSharp4Player.volume = 0.2;
        self.guitarD4Player.volume = 0.2;
        self.guitarDSharp4Player.volume = 0.2;
        self.guitarE4Player.volume = 0.2;
        self.guitarF4Player.volume = 0.2;
        self.guitarFSharp4Player.volume = 0.2;
        self.guitarG4Player.volume = 0.2;
        self.guitarGSharp4Player.volume = 0.2;
        self.guitarA4Player.volume = 0.2;
        self.guitarASharp4Player.volume = 0.2;
        self.guitarB4Player.volume = 0.2;
        
        
        
        
       /* self.guitarC5Player.volume = 0.3;
        self.guitarCSharp5Player.volume = 0.3;
        self.guitarD5Player.volume = 0.3;
        self.guitarDSharp5Player.volume = 0.3;
        self.guitarE5Player.volume = 0.3;*/

        
        if (error) {
            NSLog(@"Error: %@", error);
        }
        
       // [self.guitarC3Player prepareToPlay];
        
        self.stringsOfIndecesForKeys = [[NSArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", nil];
        
        
        self.arrayOfGuitarAudioPlayersThirdAndFourthOctaves = [NSArray arrayWithObjects:self.guitarC3Player, self.guitarCSharp3Player, self.guitarD3Player, self.guitarDSharp3Player, self.guitarE3Player, self.guitarF3Player, self.guitarFSharp3Player, self.guitarG3Player, self.guitarGSharp3Player, self.guitarA3Player, self.guitarASharp3Player, self.guitarB3Player, self.guitarC4Player, self.guitarCSharp4Player, self.guitarD4Player, self.guitarDSharp4Player, self.guitarE4Player, self.guitarF4Player, self.guitarFSharp4Player, self.guitarG4Player, self.guitarGSharp4Player, self.guitarA4Player, self.guitarASharp4Player, self.guitarB4Player, nil];
        
        self.dictionaryOfGuitarPlayers = [[NSDictionary alloc] initWithObjects:self.arrayOfGuitarAudioPlayersThirdAndFourthOctaves forKeys:self.stringsOfIndecesForKeys];
        
        
  /*      self.arrayOfAllGuitarPlayersFromE2ThroughE5 = [NSArray arrayWithObjects:self.guitarE2Player, self.guitarF2Player, self.guitarFSharp2Player, self.guitarG2Player, self.guitarGSharp2Player, self.guitarA2Player, self.guitarASharp2Player, self.guitarB2Player, self.guitarC3Player, self.guitarCSharp3Player, self.guitarD3Player, self.guitarDSharp3Player, self.guitarE3Player, self.guitarF3Player, self.guitarFSharp3Player, self.guitarG3Player, self.guitarGSharp3Player, self.guitarA3Player, self.guitarASharp3Player, self.guitarB3Player, self.guitarC4Player, self.guitarCSharp4Player, self.guitarD4Player, self.guitarDSharp4Player, self.guitarE4Player, self.guitarF4Player, self.guitarFSharp4Player, self.guitarG4Player, self.guitarGSharp4Player, self.guitarA4Player, self.guitarASharp4Player, self.guitarB4Player, self.guitarC5Player, self.guitarCSharp5Player, self.guitarD5Player, self.guitarDSharp5Player, self.guitarE5Player, nil];
        
        
        
        self.thirdOctaveArrayOfGuitarPlayers = [NSArray arrayWithObjects:self.guitarC3Player, self.guitarCSharp3Player, self.guitarD3Player, self.guitarDSharp3Player, self.guitarE3Player, self.guitarF3Player, self.guitarFSharp3Player, self.guitarG3Player, self.guitarGSharp3Player, self.guitarA3Player, self.guitarASharp3Player, self.guitarB3Player, nil];
        
        self.fourthOctaceArrayOfGuitarPlayers = [NSArray arrayWithObjects:self.guitarC4Player, self.guitarCSharp4Player, self.guitarD4Player, self.guitarDSharp4Player, self.guitarE4Player, self.guitarF4Player, self.guitarFSharp4Player, self.guitarG4Player, self.guitarGSharp4Player, self.guitarA4Player, self.guitarASharp4Player, self.guitarB4Player, nil];
        
        self.fifthOctaveArrayOfGuitarPlayers = [NSArray arrayWithObjects:self.guitarC5Player, self.guitarCSharp5Player, self.guitarD5Player, self.guitarDSharp5Player, self.guitarE5Player, nil];*/
        
         NSString *emptyBundle = [[NSBundle mainBundle] pathForResource:@"EmptyWav" ofType:@"wav"];
         self.emptyURL = [NSURL fileURLWithPath:emptyBundle];
         self.emptyAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.emptyURL error:&error];
        
    }
    return self;
    
}










@end
