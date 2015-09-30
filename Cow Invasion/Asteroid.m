//
//  Asteroid.m
//  Cow Invasion
//
//  Created by Eric Hodgins on 2015-09-29.
//  Copyright © 2015 Eric Hodgins. All rights reserved.
//

#import "Asteroid.h"
#import "Util.h"

@implementation Asteroid

+(instancetype)asteroidAtPosition:(CGPoint)position {
    Asteroid *asteroid = [Asteroid spriteNodeWithImageNamed:@"Asteroid"];
    asteroid.position = position;
    asteroid.anchorPoint = CGPointMake(0.5, 0.5);
    asteroid.name = @"Asteroid";
    asteroid.zPosition = 15;
    
    [asteroid setupPhysicsBody];
    [asteroid setupAction];
    
    return asteroid;
}

-(void)setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.allowsRotation = YES;
    
    CGFloat x = 0;
    CGFloat y = -150;
    self.physicsBody.velocity = CGVectorMake(x, y);
    self.physicsBody.categoryBitMask = CollisionCategoryAsteroid;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = CollisionCategoryFarmer;
}

-(void)setupAction {
    SKAction *spinAction = [SKAction rotateByAngle:M_PI_4 duration:1.0];
    SKAction *repeat = [SKAction repeatActionForever:spinAction];
    [self runAction:repeat];
}

@end
