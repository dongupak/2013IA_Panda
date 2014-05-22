//
//  GameLayer.m
//  PanDa
//
//  Created by 정보통신공학과 on 13. 5. 15..
//
//

#import "GameLayer.h"
@implementation GameLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
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
        size = [[CCDirector sharedDirector] winSize];
        
        timer = 60.0;
        CCSprite *bg = [CCSprite spriteWithFile:@"gamebg.jpg"];
        bg.position = ccp(size.width / 2, size.height / 2);
        [self addChild:bg z:0];
        
        soundoff = [CCSprite spriteWithFile:@"pause_soundoff.gif"];
        soundoff.position = ccp(size.width / 2, size.height / 2);
        soundoff.opacity = 0;
        [pausegroup addChild:soundoff];
        
        sound1 = [SimpleAudioEngine sharedEngine];
        sound2 = [SimpleAudioEngine sharedEngine];
        
        [sound1 preloadBackgroundMusic:@"gamebgsound.aif"];
        [sound1 preloadEffect:@"roulet.mp3"];
        [sound2 preloadEffect:@"buttonpush.wav"];
        
        sound1.backgroundMusicVolume = 0.3;
        sound1.effectsVolume = 0.9;
        sound2.effectsVolume = 0.9;
        
        [sound1 playBackgroundMusic:@"gamebgsound.aif" loop:YES];
        
        pausegroup = [CCNode node];
        [self addChild:pausegroup z:800];
        
        //룰렛 노드 생성
        rouletnode = [CCNode node];
        [self addChild:rouletnode];
        
        combo = 0;
        
        AppController *delegate = [self delegate];
        delegate.Score = 0;
        delegate.soundON = YES;
        
        self.animalArray = [NSMutableArray array];
        self.numArray = [NSMutableArray array];
        
        //동물 룰렛
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"LeftRoulet1.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"LeftRoulet2.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"LeftRoulet3.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"LeftRoulet4.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"LeftRoulet5.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"LeftRoulet6.plist"];
        
        //숫자 룰렛
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Rroulet1.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Rroulet2.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Rroulet3.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Rroulet4.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Rroulet5.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Rroulet6.plist"];
        
        NSMutableArray *animFrames1 = [NSMutableArray array];
        NSMutableArray *animFrames2 = [NSMutableArray array];
        NSMutableArray *animFrames3 = [NSMutableArray array];
        NSMutableArray *animFrames4 = [NSMutableArray array];
        NSMutableArray *animFrames5 = [NSMutableArray array];
        NSMutableArray *animFrames6 = [NSMutableArray array];
        
        NSMutableArray *numFrames1 = [NSMutableArray array];
        NSMutableArray *numFrames2 = [NSMutableArray array];
        NSMutableArray *numFrames3 = [NSMutableArray array];
        NSMutableArray *numFrames4 = [NSMutableArray array];
        NSMutableArray *numFrames5 = [NSMutableArray array];
        NSMutableArray *numFrames6 = [NSMutableArray array];
        
        for (int i=0; i<21; i++) {
            CCSpriteFrame *lframe1 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Leftroulet1_%02d.gif",i]];
            [animFrames1 addObject:lframe1];
            CCSpriteFrame *lframe2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Leftroulet2_%02d.gif",i]];
            [animFrames2 addObject:lframe2];
            CCSpriteFrame *lframe3 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Leftroulet3_%02d.gif",i]];
            [animFrames3 addObject:lframe3];
            CCSpriteFrame *lframe4 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Leftroulet4_%02d.gif",i]];
            [animFrames4 addObject:lframe4];
            CCSpriteFrame *lframe5 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Leftroulet5_%02d.gif",i]];
            [animFrames5 addObject:lframe5];
            CCSpriteFrame *lframe6 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Leftroulet6_%02d.gif",i]];
            [animFrames6 addObject:lframe6];
            
            CCSpriteFrame *rframe1 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Rightroulet1_%02d.gif",i]];
            [numFrames1 addObject:rframe1];
            CCSpriteFrame *rframe2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Rightroulet2_%02d.gif",i]];
            [numFrames2 addObject:rframe2];
            CCSpriteFrame *rframe3 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Rightroulet3_%02d.gif",i]];
            [numFrames3 addObject:rframe3];
            CCSpriteFrame *rframe4 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Rightroulet4_%02d.gif",i]];
            [numFrames4 addObject:rframe4];
            CCSpriteFrame *rframe5 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Rightroulet5_%02d.gif",i]];
            [numFrames5 addObject:rframe5];
            CCSpriteFrame *rframe6 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Rightroulet6_%02d.gif",i]];
            [numFrames6 addObject:rframe6];
        }
        [self.animalArray addObject:animFrames1];
        [self.animalArray addObject:animFrames2];
        [self.animalArray addObject:animFrames3];
        [self.animalArray addObject:animFrames4];
        [self.animalArray addObject:animFrames5];
        [self.animalArray addObject:animFrames6];
        
        [self.numArray addObject:numFrames1];
        [self.numArray addObject:numFrames2];
        [self.numArray addObject:numFrames3];
        [self.numArray addObject:numFrames4];
        [self.numArray addObject:numFrames5];
        [self.numArray addObject:numFrames6];
        
        CCSprite *scoreimg = [CCSprite spriteWithFile:@"Scoreimg.png"];
        scoreimg.position = ccp(size.width / 2, size.height -20);
        [self addChild:scoreimg];
        
        comimg = [CCSprite spriteWithFile:@"combo.png"];
        comimg.position = ccp(-50, size.height - 20);
        [self addChild:comimg];
        
        com = [CCLabelTTF labelWithString:@"0" fontName:@"Arial" fontSize:20];
        com.position = ccp(-50, size.height - 40);
        com.color = ccc3(248, 117, 66);
        [self addChild:com];
        
        soundon = [CCSprite spriteWithFile:@"pause_soundon.gif"];
        soundon.position = ccp(size.width / 2, size.height / 2 + 10);
        soundoff = [CCSprite spriteWithFile:@"pause_soundoff.gif"];
        soundoff.position = ccp(size.width / 2, size.height / 2 + 10);
        
        score = [CCLabelTTF labelWithString:@"0" fontName:@"RixGamgijosimhaeM" fontSize:20];
        score.position = ccp(size.width / 2, size.height - 40);
        score.color = ccc3(0, 0, 30);
        [self addChild:score];
        
        button1 = [CCSprite spriteWithFile:@"Button_pig.gif"];
        button2 = [CCSprite spriteWithFile:@"Button_peng.gif"];
        button3 = [CCSprite spriteWithFile:@"Button_chik.gif"];
        
        button1.position = ccp(size.width * 1/6, 40);
        button2.position = ccp(size.width * 3/6, 40);
        button3.position = ccp(size.width * 5/6, 40);
        
        [self addChild:button1];
        [self addChild:button2];
        [self addChild:button3];
        
        CCSprite *gamestart = [CCSprite spriteWithFile:@"gamestart.png"];
        gamestart.position = ccp(-150, size.height / 2);
        
        CCMoveBy *move = [CCMoveBy actionWithDuration:0.5 position:ccp((size.width / 2)+150, 0)];
        CCCallFuncN *gamelogic = [CCCallFuncN actionWithTarget:self selector:@selector(Gamelogic)];
        CCSequence *startact = [CCSequence actions:move,[CCDelayTime actionWithDuration:0.5],[move copy],gamelogic, nil];
        [gamestart runAction:startact];
        [self addChild:gamestart];
    }
	return self;
}
- (void)sound:(id)sender {
    NSLog(@"Ok");
    AppController *delegate = [self delegate];
	if (delegate.soundON == NO) {
        sound1.backgroundMusicVolume = .9;
		delegate.soundON = YES;
        soundoff.opacity = 0;

	}else {
        sound1.backgroundMusicVolume = 0;
		delegate.soundON = NO;
        soundoff = [CCSprite spriteWithFile:@"pause_soundoff.gif"];
        soundoff.position = ccp(size.width / 2, size.height / 2 + 10);
        soundoff.opacity = 255;
        [pausegroup addChild:soundoff];
	}
}
-(void) Gamelogic {
    //룰렛이 돌아가고 터치
    [self roulet];
    
    //60초 시간제한
    [self schedule:@selector(Time) interval:0.01];
    
    CCSprite *timeBarBase = [CCSprite spriteWithFile:@"TimeBar_Main.gif"];
    timeBarBase.position=ccp(size.width / 2 , size.height / 2 - 140);
    [self addChild:timeBarBase z:21];
    timeM = [CCSprite spriteWithFile:@"TimeBar_assist.gif"];
    [self maketimebar];

    CCMenuItemImage *pausemenu = [CCMenuItemImage itemWithNormalImage:@"pause_button.gif" selectedImage:@"pause_button.gif" target:self selector:@selector(pausegame)];
    paumenu = [CCMenu menuWithItems:pausemenu, nil];
    paumenu.position = ccp(size.width - 30, size.height - 30);
    [self addChild:paumenu];
}

//램덤한 룰렛을 보여줌
-(void) roulet {
    
    //룰렛과 ok또는 fail 제거
    [rouletnode removeAllChildrenWithCleanup:YES];
    [self removeChild:okay cleanup:YES];
    [self removeChild:fail cleanup:YES];
    
    //touchenable 가 1일때 버튼 클릭안됨
    touchenable = 1;
    
    //버튼 count 초기화 
    rcount = 0;
    ycount = 0;
    bcount = 0;
    
    //랜덤한 동물과 숫자 생성
    animalcode = arc4random() % 6;
    numbercode = arc4random() % 6;
    
    //동물룰렛 애니메이션 
    NSMutableArray *aniFrameTemp = [self.animalArray objectAtIndex:animalcode];
    CCSprite *animalroulet = [CCSprite spriteWithSpriteFrame:[aniFrameTemp objectAtIndex:0]];
    animalroulet.position = ccp(0, size.height /2 + 30);
    [rouletnode addChild:animalroulet];
    
    CCAnimation *animation1 = [CCAnimation animationWithSpriteFrames:aniFrameTemp delay:0.05f];
    CCAnimate *ani1 = [CCAnimate actionWithAnimation:animation1];
    CCCallFuncN *touchen = [CCCallFuncN actionWithTarget:self selector:@selector(touchyes)];
    CCSequence *total = [CCSequence actions:ani1,touchen, nil];
    [animalroulet runAction:total];
    
    //숫자룰렛 애니메이션
    NSMutableArray *numFrameTemp = [self.numArray objectAtIndex:numbercode];
    CCSprite *numroulet = [CCSprite spriteWithSpriteFrame:[numFrameTemp objectAtIndex:0]];
    numroulet.position = ccp(size.width, size.height /2 + 30);
    [rouletnode addChild:numroulet];
    CCAnimation *animation2 = [CCAnimation animationWithSpriteFrames:numFrameTemp delay:0.05f];
    CCAnimate *ani2 = [CCAnimate actionWithAnimation:animation2];
    [numroulet runAction:ani2];
    
    [sound1 playEffect:@"roulet.mp3"];
}

-(void) touchyes {
    //touchenable 가 2로 설정하여 버튼을 눌렀을때 카운트가 증가
    touchenable = 2;
}

-(void) scoreplus {
    AppController *delegate = [self delegate];

    double bonus;
    int bonusscore;
    bonus = 0;
    for (int i=0; i<combo; i++) {
        bonus += 0.2;
    }
    bonusscore = 100 * bonus;
    delegate.Score += (100 + bonusscore);
    NSString *scoretemp = [[NSString alloc] initWithFormat:@"%d",delegate.Score];
    NSString *comstr = [[NSString alloc] initWithFormat:@"%d",combo];
    [com setString:comstr];
    [score setString:scoretemp];
    
    
    if (combo >= 1) {
        id move1 = [CCMoveBy actionWithDuration:0.3 position:ccp(100, 0)];
        id totalmove = [CCSequence actions:move1,[CCDelayTime actionWithDuration:0.4],[move1 reverse], nil];
        [comimg runAction:totalmove];
        [com runAction:[totalmove copy]];
    }
    combo++;
    
    okay = [CCSprite spriteWithFile:@"Ok.png"];
    okay.position = ccp(size.width / 2, size.height / 2);
    [self addChild:okay];
    
    id action = [CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFuncN actionWithTarget:self  selector:@selector(roulet)], nil];
    [okay runAction:action];
    
}

-(void) scoreminus {
    AppController *delegate = [self delegate];

    if(delegate.Score < 100) {
        delegate.Score = 0;
    } else {
        delegate.Score -= 100;    
    }
    NSString *scoretemp = [[NSString alloc] initWithFormat:@"%d",delegate.Score];
    [score setString:scoretemp];
    combo = 0;
    NSString *comstr = [[NSString alloc] initWithFormat:@"%d",combo];
    [com setString:comstr];
    
    fail = [CCSprite spriteWithFile:@"Fail.png"];
    fail.position = ccp(size.width / 2, size.height / 2);
    [self addChild:fail];
    
    id action = [CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFuncN actionWithTarget:self  selector:@selector(roulet)], nil];
    [fail runAction:action];
}


-(void)onEnter {
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:[touch view]];
    CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    //애니메이션이 멈추면 버튼 클릭 가능
    if(touchenable == 2) {
       
        //돼지 버튼 클릭시
        if (CGRectContainsPoint([button1 boundingBox],convertedLocation)) {
            
            [sound2 playEffect:@"buttonpush.wav"];
            if(animalcode == 0 || animalcode == 4 || animalcode == 5) {
                rcount++;
                if (rcount == (numbercode + 1)) {
                    [self scoreplus];
                }
            } else {
                [self scoreminus];
            }
        } else if (CGRectContainsPoint([button2 boundingBox],convertedLocation)) {
            //펭귄 버튼 클릭시
            [sound2 playEffect:@"buttonpush.wav"];
            if (animalcode == 1 || animalcode == 3 || animalcode == 5) {
                //펭귄 버튼을 클릭하면 숫자을 올림
                bcount++;
                if (bcount == (numbercode + 1)) {
                    [self scoreplus];
                }
            } else {  //파란색버튼을 누르면 안되는 경우
                [self scoreminus];
            }
        } else if (CGRectContainsPoint([button3 boundingBox],convertedLocation)) {
            //병아리 버튼 클릭시
            [sound2 playEffect:@"buttonpush.wav"];
            if (animalcode == 2 || animalcode == 3 || animalcode == 4) { //해당 동물을 눌렀을때 
            
                ycount++;
                if (ycount == (numbercode + 1)) {
                    [self scoreplus];
                }
            } else {  //병아리 버튼을 누르면 안되는 경우
                [self scoreminus];
            }
        }
    }
    return YES;
}


-(void) Time {
    timer -= .01;
    [self performSelector:@selector(timer)];
    if(timer == 0) {
        [self gameover];
    }
}
-(void)maketimebar{
    timeBar = [CCProgressTimer progressWithSprite:timeM];
    timeBar.type = kCCProgressTimerTypeBar;
    timeBar.midpoint = ccp(0, .5);//우->좌로만 줄어듬
    timeBar.position = ccp(size.width / 2 , size.height / 2 - 140);
    timeBar.barChangeRate = ccp(1, 0);//세로 변동x, 가로만 변함
    timeBar.percentage=100;
    [self addChild:timeBar z:22];
}
-(void)timer{
    if (timer<0) timer=0;
	float timeRate =(float)timer/60;
	timeBar.percentage=timeRate*100;
}

-(void)pausegame {
    [self removeChild:paumenu cleanup:YES];
    AppController *delegate = [self delegate];
    
    if (delegate.soundON == NO) {
        soundoff = [CCSprite spriteWithFile:@"pause_soundoff.gif"];
        soundoff.position = ccp(size.width / 2, size.height / 2 + 10);
        soundoff.opacity = 255;
        [pausegroup addChild:soundoff z:1000];
    }
    
    [sound1 stopBackgroundMusic];
    [[CCDirector sharedDirector] pause];
	self.isTouchEnabled = NO;
    
    CCSprite *pausebg = [CCSprite spriteWithFile:@"White.png"];
    pausebg.position = ccp(size.width / 2, size.height / 2);
    [pausegroup addChild:pausebg];
    
    CCSprite *pauseback = [CCSprite spriteWithFile:@"pause_back.gif"];
    pauseback.position = ccp(size.width/2, size.height/2);
    [pausegroup addChild:pauseback];
    
    
    
    CCMenuItemImage *home = [CCMenuItemImage itemWithNormalImage:@"pause_home.gif" selectedImage:@"pause_home1.gif" target:self selector:@selector(gohome)];
    CCMenuItemImage *resume = [CCMenuItemImage itemWithNormalImage:@"pause_resume.gif" selectedImage:@"pause_resume1.gif" target:self selector:@selector(resume)];
    CCMenuItemImage *soundonoff = [CCMenuItemImage itemWithNormalImage:@"pause_soundon.gif" selectedImage:@"pause_soundon.gif" target:self selector:@selector(sound:)];
    CCMenu *pausemenu = [CCMenu menuWithItems:home,soundonoff,resume, nil];
    pausemenu.position = ccp(size.width / 2, size.height / 2 + 10);
    [pausemenu alignItemsHorizontallyWithPadding:50];
    [pausegroup addChild:pausemenu];
    
}

-(void) resume {
    [sound1 playBackgroundMusic:@"gamebgsound.aif" loop:YES];
    
    [pausegroup removeAllChildrenWithCleanup:YES];
    
    CCMenuItemImage *pause = [CCMenuItemImage itemWithNormalImage:@"pause_button.gif" selectedImage:@"pause_button.gif" target:self selector:@selector(pausegame)];
    paumenu = [CCMenu menuWithItems:pause, nil];
    paumenu.position = ccp(size.width - 30, size.height - 30);
    [self addChild:paumenu];
    
    [[CCDirector sharedDirector] resume];
}

-(void)gameover {
    [sound1 stopBackgroundMusic];
    touchenable = 1;
    CCSprite *gameovertext = [CCSprite spriteWithFile:@"Gameover_Text.png"];
    gameovertext.position = ccp(size.width/2, size.height/2);
    [self addChild:gameovertext];
    
    id action = [CCSequence actions:[CCDelayTime actionWithDuration:1.5],[CCCallFuncN actionWithTarget:self selector:@selector(gogameover)], nil];
    [gameovertext runAction:action];
}

-(void) gogameover {
    [SceneManager goGameover];
}
-(void)goanimal {
    [sound1 stopBackgroundMusic];
    [SceneManager goanimal];
}

-(void) gohome {
    [sound1 stopBackgroundMusic];
    [[CCDirector sharedDirector] resume];
    [SceneManager goanimal];
}
@end
