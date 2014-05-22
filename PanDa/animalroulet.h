//
//  HelloWorldLayer.h
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"

// HelloWorldLayer
@interface animalroulet : CCLayerColor <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CGSize size;
    SimpleAudioEngine *sound;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
