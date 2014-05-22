//
//  Gameover.m
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//
//

#import "Gameover.h"

@implementation Gameover

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Gameover *layer = [Gameover node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(AppController *)delegate{
    return (AppController *)[[UIApplication sharedApplication] delegate];
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)]) ) {
		
        AppController *delegate = [self delegate];
        
        size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *bg = [CCSprite spriteWithFile:@"GameoverLayer_bg.gif"];
        bg.position = ccp(size.width / 2, size.height / 2);
        [self addChild:bg];
                
        NSString *str = [[NSString alloc]initWithFormat:@"%d",delegate.Score];
		CCLabelTTF *label = [CCLabelTTF labelWithString:str fontName:@"RixPigM" fontSize:70];
        label.position = ccp(size.width / 2, size.height / 2 + 70);
        label.color = ccc3(250, 70, 0);
        [self addChild:label];
        
        CCMenuItem *home = [CCMenuItemImage itemWithNormalImage:@"GameoverLayer_Main.gif" selectedImage:@"GameoverLayer_Main.gif" target:self selector:@selector(goanimal)];
        CCMenuItem *rank = [CCMenuItemImage itemWithNormalImage:@"GameoverLayer_rank.png" selectedImage:@"GameoverLayer_rank.png" target:self selector:@selector(goRank)];
        CCMenuItem *restart = [CCMenuItemImage itemWithNormalImage:@"GameoverLayer_Restart.png" selectedImage:@"GameoverLayer_Restart.png" target:self selector:@selector(restart)];
        CCMenu *menu = [CCMenu menuWithItems:home,rank,restart, nil];
        [menu alignItemsHorizontallyWithPadding:10.0];
        menu.position = ccp(size.width / 2 , size.height * 1/4);
        [self addChild:menu];
	}
	return self;
}

-(void)goanimal {
    [SceneManager goanimal];
}
-(void)goRank {
    [SceneManager goRank];
}
-(void)restart {
    [SceneManager goGame];
}
@end
