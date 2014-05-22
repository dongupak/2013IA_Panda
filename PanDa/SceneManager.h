//
//  SceneManager.h
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//
//

#import "AppDelegate.h"

#import "animalroulet.h"
#import "GameLayer.h"
#import "Howto.h"
#import "Credit.h"
#import "Rank.h"
#import "Gameover.h"
@interface SceneManager : NSObject {
    
}
+(void) goGame;
+(void) goHowto;
+(void) goCredit;
+(void) goRank;
+(void) goanimal;
+(void) goGameover;
@end
