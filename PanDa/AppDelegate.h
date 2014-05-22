//
//  AppDelegate.h
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
    
    NSInteger       Score;
    BOOL soundON;
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property (readwrite) BOOL soundON;
@property (readwrite) NSInteger       Score;

@end
