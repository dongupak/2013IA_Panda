//
//  SceneManager.m
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//
//

#import "SceneManager.h"

@implementation SceneManager

+(void) goGame {
     CCScene *scene = [CCTransitionFade transitionWithDuration:0.5 scene:[GameLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}

+(void) goHowto {
    CCScene *scene = [CCTransitionFade transitionWithDuration:0.5 scene:[Howto scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}

+(void) goRank {
    CCScene *scene = [CCTransitionFade transitionWithDuration:0.5 scene:[Rank scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}

+(void) goCredit {
    CCScene *scene = [CCTransitionFade transitionWithDuration:0.5 scene:[Credit scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}

+(void) goGameover {
    CCScene *scene = [CCTransitionFade transitionWithDuration:1.5 scene:[Gameover scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}

+(void) goanimal {
    CCScene *scene = [CCTransitionFade transitionWithDuration:0.5 scene:[animalroulet scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}


@end
