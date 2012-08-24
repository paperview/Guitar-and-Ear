//
//  GIGuitarSource.h
//  GuitarIdea
//
//  Created by Phillip Pape on 6/20/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>

@interface GIGuitarSource : NSObject <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *guitarE2Player;
@property (nonatomic, strong) AVAudioPlayer *guitarF2Player;
@property (nonatomic, strong) AVAudioPlayer *guitarFSharp2Player;
@property (nonatomic, strong) AVAudioPlayer *guitarG2Player;
@property (nonatomic, strong) AVAudioPlayer *guitarGSharp2Player;
@property (nonatomic, strong) AVAudioPlayer *guitarA2Player;
@property (nonatomic, strong) AVAudioPlayer *guitarASharp2Player;
@property (nonatomic, strong) AVAudioPlayer *guitarB2Player;

@property (nonatomic, strong) AVAudioPlayer *guitarC3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarCSharp3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarD3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarDSharp3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarE3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarF3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarFSharp3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarG3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarGSharp3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarA3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarASharp3Player;
@property (nonatomic, strong) AVAudioPlayer *guitarB3Player;

@property (nonatomic, strong) AVAudioPlayer *guitarC4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarCSharp4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarD4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarDSharp4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarE4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarF4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarFSharp4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarG4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarGSharp4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarA4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarASharp4Player;
@property (nonatomic, strong) AVAudioPlayer *guitarB4Player;

@property (nonatomic, strong) AVAudioPlayer *guitarC5Player;
@property (nonatomic, strong) AVAudioPlayer *guitarCSharp5Player;
@property (nonatomic, strong) AVAudioPlayer *guitarD5Player;
@property (nonatomic, strong) AVAudioPlayer *guitarDSharp5Player;
@property (nonatomic, strong) AVAudioPlayer *guitarE5Player;

@property (nonatomic, strong) AVAudioPlayer *emptyAudioPlayer;

@property (nonatomic, strong) NSArray *arrayOfGuitarAudioPlayersThirdAndFourthOctaves;
@property (nonatomic, strong) NSArray *arrayOfAllGuitarPlayersFromE2ThroughE5;

@property (nonatomic, strong) NSArray *thirdOctaveArrayOfGuitarPlayers;
@property (nonatomic, strong) NSArray *fourthOctaceArrayOfGuitarPlayers;
@property (nonatomic, strong) NSArray *secondOctaveFromEArrayOfGuitarPlayers;
@property (nonatomic, strong) NSArray *fifthOctaveArrayOfGuitarPlayers;

@property (nonatomic, strong) NSDictionary *dictionaryOfGuitarPlayers;


@end
