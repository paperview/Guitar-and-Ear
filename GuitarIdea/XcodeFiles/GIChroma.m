

#import "GIChroma.h"

@interface GIChroma() <AVAudioPlayerDelegate>

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

@property (nonatomic, strong) NSURL *emptyURL;



@end

@implementation GIChroma

@synthesize urlC3;
@synthesize urlCSharp3;
@synthesize urlD3;
@synthesize urlDSharp3;
@synthesize urlF3;
@synthesize urlFSharp3;
@synthesize urlE3;
@synthesize urlG3;
@synthesize urlGSharp3;
@synthesize urlA3;
@synthesize urlASharp3;
@synthesize urlB3;
@synthesize emptyURL;

@synthesize c3Player;
@synthesize cSharp3Player;
@synthesize d3Player;
@synthesize dSharp3Player;
@synthesize e3Player;
@synthesize f3Player;
@synthesize fSharp3Player;
@synthesize g3Player;
@synthesize gSharp3Player;
@synthesize a3Player;
@synthesize aSharp3Player;
@synthesize b3Player;
@synthesize emptyAudioPlayer;



// public synthesis

@synthesize chromaticArrayOfPlayersInTheThirdOctave;


- (id)init {
    
    if (self = [super init]) {
        
        NSString *bundleC3 = [[NSBundle mainBundle] pathForResource:@"C3" ofType:@"caf"];
        NSString *bundleCSharp3 = [[NSBundle mainBundle] pathForResource:@"PiaC#3" ofType:@"caf"];
        NSString *bundleD3 = [[NSBundle mainBundle] pathForResource:@"PiaD3" ofType:@"caf"];
        NSString *bundleDSharp3 = [[NSBundle mainBundle] pathForResource:@"PiaD#3" ofType:@"caf"];
        NSString *bundleE3 = [[NSBundle mainBundle] pathForResource:@"PiaE3" ofType:@"caf"];
        NSString *bundleF3 = [[NSBundle mainBundle] pathForResource:@"PiaF3" ofType:@"caf"];
        NSString *bundleFSharp3 = [[NSBundle mainBundle] pathForResource:@"PiaF#3" ofType:@"caf"];
        NSString *bundleG3 = [[NSBundle mainBundle] pathForResource:@"PiaG3" ofType:@"caf"];
        NSString *bundleGSharp3 = [[NSBundle mainBundle] pathForResource:@"PiaG#3" ofType:@"caf"];
        NSString *bundleA3 = [[NSBundle mainBundle] pathForResource:@"PiaA3" ofType:@"caf"];
        NSString *bundleASharp3 = [[NSBundle mainBundle] pathForResource:@"PiaA#3" ofType:@"caf"];
        NSString *bundleB3 = [[NSBundle mainBundle] pathForResource:@"PiaB3" ofType:@"caf"];
        NSString *emptyBundle = [[NSBundle mainBundle] pathForResource:@"EmptyCaf" ofType:@"caf"];
        
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
        
        self.emptyURL = [NSURL fileURLWithPath:emptyBundle];
        
        NSError *error = nil;    
        
        self.c3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlC3 error:&error];
        self.cSharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlCSharp3 error:&error];
        self.d3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlD3 error:&error];
        self.dSharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlDSharp3 error:&error];
        self.e3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlE3 error:&error];
        self.f3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlF3 error:&error];
        self.fSharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlFSharp3 error:&error];
        self.g3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlG3 error:&error];
        self.gSharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlGSharp3 error:&error];
        self.a3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlA3 error:&error];
        self.aSharp3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlASharp3 error:&error];
        self.b3Player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.urlB3 error:&error];
        
        self.emptyAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.emptyURL error:&error];
        
        if (error) {
            NSLog(@"Error: %@", error);
        }
        
    /*    self.c3Player.delegate = self;
        self.cSharp3Player.delegate = self;
        self.d3Player.delegate = self;
        self.dSharp3Player.delegate = self;
        self.e3Player.delegate = self;
        self.f3Player.delegate = self;
        self.fSharp3Player.delegate = self;
        self.g3Player.delegate = self;
        self.gSharp3Player.delegate = self;
        self.a3Player.delegate = self;
        self.aSharp3Player.delegate = self;
        self.b3Player.delegate = self;*/
        
    //    self.c3Player.playing
        [self.c3Player prepareToPlay];
        [self.cSharp3Player prepareToPlay];
        [self.d3Player prepareToPlay];
        [self.dSharp3Player prepareToPlay];
        [self.e3Player prepareToPlay];
        [self.f3Player prepareToPlay];
        [self.fSharp3Player prepareToPlay];
        [self.g3Player prepareToPlay];
        [self.gSharp3Player prepareToPlay];
        [self.a3Player prepareToPlay];
        [self.aSharp3Player prepareToPlay];
        [self.b3Player prepareToPlay];
        
        
        self.chromaticArrayOfPlayersInTheThirdOctave = [[NSArray alloc] initWithObjects:self.c3Player, self.cSharp3Player, self.d3Player, self.dSharp3Player, self.e3Player, self.f3Player, self.fSharp3Player, self.g3Player, self.gSharp3Player, self.a3Player, self.aSharp3Player, self.b3Player, self.c3Player, self.cSharp3Player, self.d3Player, self.dSharp3Player, self.e3Player, self.f3Player, self.fSharp3Player, self.g3Player, self.gSharp3Player, self.a3Player, self.aSharp3Player, self.b3Player, self.c3Player, self.cSharp3Player, self.d3Player, self.dSharp3Player, self.e3Player, self.f3Player, self.fSharp3Player, self.g3Player, self.gSharp3Player, self.a3Player, self.aSharp3Player, self.b3Player, /* split */self.c3Player, self.cSharp3Player, self.d3Player, self.dSharp3Player, self.e3Player, self.f3Player, self.fSharp3Player, self.g3Player, self.gSharp3Player, self.a3Player, self.aSharp3Player, self.b3Player, nil];
        
        

        
        
    }
    return self;
}



@end
