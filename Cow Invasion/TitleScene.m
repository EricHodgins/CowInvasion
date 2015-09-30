//
//  TitleScene.m
//  Cow Invasion
//
//  Created by Eric Hodgins on 2015-09-21.
//  Copyright © 2015 Eric Hodgins. All rights reserved.
//

#import "TitleScene.h"
#import "GamePlayScene.h"
#import <AVFoundation/AVFoundation.h>

@interface TitleScene ()
@property (strong, nonatomic)AVAudioPlayer *introSong;
@end

@implementation TitleScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        // Setup the scene
        self.backgroundColor = [UIColor blackColor];
        
        SKLabelNode *labelText = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        labelText.text = @"Tap to Start!";
        labelText.position = CGPointMake(self.frame.size.width/2, self.frame.size.height - 50);
        [self addChild:labelText];
        
        
        SKSpriteNode *earth = [SKSpriteNode spriteNodeWithImageNamed:@"Earth"];
        earth.anchorPoint = CGPointMake(0, 0);
        earth.position = CGPointMake(0, 0);
        [self addChild:earth];
        
        SKSpriteNode *sun = [SKSpriteNode spriteNodeWithImageNamed:@"Sun"];
        sun.anchorPoint = CGPointMake(0.1, 0.5);
        sun.position = CGPointMake(0, 300);
        [self addChild:sun];
        
        SKSpriteNode *alien1 = [SKSpriteNode spriteNodeWithImageNamed:@"Alien_1"];
        alien1.position = CGPointMake(150, 200);
        [self addChild:alien1];
        
        SKSpriteNode *alien2 = [SKSpriteNode spriteNodeWithImageNamed:@"Alien_2"];
        alien2.position = CGPointMake(220, 300);
        [self addChild:alien2];
        
        SKSpriteNode *alien3 = [SKSpriteNode spriteNodeWithImageNamed:@"Alien_3"];
        alien3.position = CGPointMake(300, 180);
        [self addChild:alien3];
        
        // Eventually get high score here
        NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"high_score"];
        SKLabelNode *highScoreLabel = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"High Score %d", (int)highScore]];
        highScoreLabel.fontName = @"Chalkduster";
        highScoreLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height - 150);
        [self addChild:highScoreLabel];
        
        
        // setup sound intro
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"TitleSceneSong" ofType:@"caf"]];
        self.introSong = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        self.introSong.numberOfLoops = -1;
        [self.introSong play];
        
    }
    
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    GamePlayScene *gamePlayScene = [GamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition fadeWithDuration:0.5];
    [self.view presentScene:gamePlayScene transition:transition];
}


@end
