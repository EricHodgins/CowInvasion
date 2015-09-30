//
//  AlienNode.m
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-05-25.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import "AlienNode.h"
#import "Util.h"

@implementation AlienNode

+ (instancetype)alienAtPosition:(CGPoint)position {
    AlienNode *alien = [self spriteNodeWithImageNamed:@"Alien_1"];
    alien.position = CGPointMake(position.x, position.y + 200);
    alien.zPosition = 15;
    alien.xScale = 0.7;
    alien.yScale = 0.7;
    
    [alien setupAnimation];
    [alien setupPhysicsBody];
    return alien;

}

-(void)setupAnimation {
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"Alien_1"],
                          [SKTexture textureWithImageNamed:@"Alien_2"],
                          [SKTexture textureWithImageNamed:@"Alien_3"],
                          [SKTexture textureWithImageNamed:@"Alien_3"]];
    
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.2];
    SKAction *repeatAction = [SKAction repeatActionForever:animation];
    [self runAction:repeatAction];
    
}


-(void) setupPhysicsBody {
    // Randomly choose how fast the alien flys towards the ground
    NSInteger randomSpeed = [Util randomWithMin:1 max:4];
    int vectorSpeed;
    switch (randomSpeed) {
        case 1:
            vectorSpeed = easy;
            break;
        case 2:
            vectorSpeed = hard;
            break;
        case 3:
            vectorSpeed = veryHard;
            break;
        default:
            break;
    }
    
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.mass = 100;
    self.physicsBody.velocity = CGVectorMake(0, vectorSpeed);
    self.physicsBody.categoryBitMask = CollisionCategoryEnemy;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = CollisionCategoryFarmer;
}

@end
