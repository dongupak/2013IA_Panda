//
//  GameLayer.h
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//
//
#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "cocos2d.h"
#import "AppDelegate.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"

@interface GameLayer : CCLayerColor {
    CGSize size;
    CCNode *rouletnode;
    CCSprite *animal;
    CCSprite *num;
    
    CCSprite *button1;
    CCSprite *button2;
    CCSprite *button3;
    
    CCLabelTTF *score;
    CCLabelTTF *r1;
    CCLabelTTF *r2;
    
    NSInteger rcount;
    NSInteger bcount;
    NSInteger ycount;
    
    NSInteger animalcode;
    NSInteger numbercode;
    
    CCLabelTTF *test1;
    CCLabelTTF *test2;
    CCLabelTTF *test3;
    
    float timer;
    
    CCSprite *comimg;
    NSInteger combo;
    CCLabelTTF *com;
    
    CCSprite *timeM;
    CCProgressTimer *timeBar;
    
    //터치 활성화/비활성화
    NSInteger touchenable;
    CCNode *pausegroup;
    CCMenu *paumenu;
    
    //성공시 ok 실패시 fail이 나타나는 sprite
    CCSprite *okay;
    CCSprite *fail;
    
    CCSprite *soundon;
    CCSprite *soundoff;
    
    SimpleAudioEngine *sound1;
    SimpleAudioEngine *sound2;
}

@property (nonatomic, retain) NSMutableArray *animalArray;
@property (nonatomic, retain) NSMutableArray *numArray;
+(CCScene *) scene;
@end
