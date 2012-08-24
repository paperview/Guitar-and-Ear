

#import "GITempoConstructs.h"

float wholeNoteTime(float tempo) {
    
    if (!tempo) {
        tempo = 1;
    }
    float barsPerSecond = tempo / 4 / 60;
    float secondsPerBar = 1 / barsPerSecond;
    
    return secondsPerBar;
}

float halfNoteTime(float tempo){
    
    if (!tempo) {
        tempo = 1;
    }
    float barsPerSecond = tempo / 4 / 60;
    float secondsPerBar = 1 / barsPerSecond;
    
    return secondsPerBar / 2;
    
}

float quarterNoteTime(float tempo){
    
    if (!tempo) {
        tempo = 1;
    }
    float barsPerSecond = tempo / 4 / 60;
    float secondsPerBar = 1 / barsPerSecond;
    
    return secondsPerBar / 4;
    
}

float eighthNoteTime(float tempo){
    
    if (!tempo) {
        tempo = 1;
    }
    float barsPerSecond = tempo / 4 / 60;
    float secondsPerBar = 1 / barsPerSecond;
    
    return secondsPerBar / 8;
    
}

float tripletNoteTime(float tempo){
    
    if (!tempo) {
        tempo = 1;
    }
    float barsPerSecond = tempo / 4 / 60;
    float secondsPerBar = 1 / barsPerSecond;
    
    return secondsPerBar / 12;
    
}

float sixteenthNoteTime(float tempo){
    
    if (!tempo) {
        tempo = 1;
    }
    
    float barsPerSecond = tempo / 4 / 60;
    float secondsPerBar = 1 / barsPerSecond;
    
    return secondsPerBar / 16;
    
}
