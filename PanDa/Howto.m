//
//  Howto.m
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//
//

#import "Howto.h"
@implementation Howto

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Howto *layer = [Howto node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)]) ) {
		
        size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *bg = [CCSprite spriteWithFile:@"Howto.png"];
        bg.position = ccp(size.width / 2, size.height / 2);
        [self addChild:bg];
        
        CCMenuItem *back = [CCMenuItemImage itemWithNormalImage:@"Backbutton.png" selectedImage:@"Backbutton.png" target:self selector:@selector(goanimal)];
        CCMenu *menu = [CCMenu menuWithItems:back, nil];
        menu.position = ccp(size.width * 3/4 , size.height * 1/6);
        [self addChild:menu];
	}
	return self;
}

-(void)goanimal {
    [SceneManager goanimal];
}

@end
