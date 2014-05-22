//
//  HelloWorldLayer.m
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//


// Import the interfaces
#import "animalroulet.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation animalroulet

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	animalroulet *layer = [animalroulet node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)]) ) {
		
		// ask director for the window size
		size = [[CCDirector sharedDirector] winSize];

        CCSprite *bg = [CCSprite spriteWithFile:@"Animal_main.png"];
        bg.position = ccp(size.width / 2, size.height / 2);
        [self addChild:bg z:0];
        
        sound = [SimpleAudioEngine sharedEngine];
        
        sound.effectsVolume = 0.9;
        
        if (sound != nil) {
            
            //배경음악을 미리 로딩함.
            [sound preloadBackgroundMusic:@"main.mp3"];
            [sound preloadEffect:@"menuclick.mp3"];
            if (sound.willPlayBackgroundMusic) {
                sound.backgroundMusicVolume = 0.7f;
                sound.effectsVolume = 0.7f;
            }
        }
        
        [sound playBackgroundMusic:@"main.mp3" loop:YES];
        
        CCMenuItem *start = [CCMenuItemImage itemWithNormalImage:@"start.png" selectedImage:@"start2.png" target:self selector:@selector(goGame)];
        CCMenuItem *howto = [CCMenuItemImage itemWithNormalImage:@"howto2.png" selectedImage:@"howto1.png" target:self selector:@selector(goHowto)];
        CCMenuItem *rank = [CCMenuItemImage itemWithNormalImage:@"Rank1.png" selectedImage:@"Rank2.png" target:self selector:@selector(goRank)];
        CCMenuItem *credit = [CCMenuItemImage itemWithNormalImage:@"Credit.gif" selectedImage:@"Credit1.gif" target:self selector:@selector(goCredit)];
       
        CCMenu *menu = [CCMenu menuWithItems:start,howto,rank,credit, nil];
        [menu alignItemsVerticallyWithPadding:15];
        menu.position = ccp(size.width / 2, size.height / 2 - 40);
        [self addChild:menu z:10];
	}
	return self;
}

-(void) goGame {
    [sound stopBackgroundMusic];
    [sound playEffect:@"menuclick.mp3"];
    [SceneManager goGame];
}
-(void) goHowto {
    [sound playEffect:@"menuclick.mp3"];
    [SceneManager goHowto];
}
-(void) goRank {
    [sound playEffect:@"menuclick.mp3"];
    [SceneManager goRank];
}
-(void) goCredit {
    [sound playEffect:@"menuclick.mp3"];
    [SceneManager goCredit];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
