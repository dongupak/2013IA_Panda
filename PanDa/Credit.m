//
//  Credit.m
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//
//

#import "Credit.h"

@implementation Credit

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Credit *layer = [Credit node];
	
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
        
		CCSprite *bg = [CCSprite spriteWithFile:@"Creditbg.gif"];
        bg.position = ccp(size.width / 2, size.height / 2);
        [self addChild:bg];
        
       CCMenuItem *back = [CCMenuItemImage itemWithNormalImage:@"Backbutton.png" selectedImage:@"Backbutton.png" target:self selector:@selector(goanimal)];
        CCMenu *menu = [CCMenu menuWithItems:back, nil];
        menu.position = ccp(size.width - 25, size.height - 25);
        [self addChild:menu];
	}
	return self;
}

-(void)goanimal {
    [SceneManager goanimal];
}

@end
