//
//  HudNode.m
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-06-05.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import "HudNode.h"
#import "Util.h"

@implementation HudNode

+(instancetype)hudAtPosition:(CGPoint)position {
    HudNode *hud = [self node];
    hud.position = position;
    hud.zPosition = 20;
    hud.name = @"HUD";
    hud.lives = MaxLives;
    
    SKLabelNode *livesLabel = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"Cows: %d", (int)hud.lives]];
    livesLabel.name = @"Lives";
    livesLabel.fontSize = 24;
    livesLabel.fontName = @"Copperplate";
    livesLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    livesLabel.position = CGPointMake(20, -10);
    [hud addChild:livesLabel];
    
    SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"Score: %d", (int)hud.score]];
    scoreLabel.name = @"Score";
    scoreLabel.fontSize = 24;
    scoreLabel.fontName = @"Copperplate";
    scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    scoreLabel.position = CGPointMake(-200, -10);
    [hud addChild:scoreLabel];
    
    return hud;
}

-(BOOL)loseLife {
    SKLabelNode *lives = (SKLabelNode *)[self childNodeWithName:@"Lives"];
    self.lives -= 1;
    lives.text = [NSString stringWithFormat:@"Cows: %d", (int)self.lives];
    if (self.lives > 0) {
        return FALSE;
    }
    
    return TRUE;
}

-(void)increaseScore {
    SKLabelNode *score = (SKLabelNode *)[self childNodeWithName:@"Score"];
    self.score += 1;
    score.text = [NSString stringWithFormat:@"Score: %d", (int) self.score];
}

@end
