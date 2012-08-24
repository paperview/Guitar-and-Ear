

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>


@interface GIChroma : NSObject <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *c3Player;
@property (nonatomic, strong) AVAudioPlayer *cSharp3Player;
@property (nonatomic, strong) AVAudioPlayer *d3Player;
@property (nonatomic, strong) AVAudioPlayer *dSharp3Player;
@property (nonatomic, strong) AVAudioPlayer *e3Player;
@property (nonatomic, strong) AVAudioPlayer *f3Player;
@property (nonatomic, strong) AVAudioPlayer *fSharp3Player;
@property (nonatomic, strong) AVAudioPlayer *g3Player;
@property (nonatomic, strong) AVAudioPlayer *gSharp3Player;
@property (nonatomic, strong) AVAudioPlayer *a3Player;
@property (nonatomic, strong) AVAudioPlayer *aSharp3Player;
@property (nonatomic, strong) AVAudioPlayer *b3Player;

@property (nonatomic, strong) AVAudioPlayer *emptyAudioPlayer;

@property (nonatomic, strong) NSArray *chromaticArrayOfPlayersInTheThirdOctave;







@end
