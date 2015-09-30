//
//  Farmer.m
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-05-23.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import "Farmer.h"
#import "Util.h"

@interface Farmer()

@property (nonatomic) SKAction *tapAction;

@end

@implementation Farmer
{
    float farmerSpeed;
}

+ (instancetype)farmerAtPosition:(CGPoint)position {
    
    Farmer *farmer = [Farmer spriteNodeWithImageNamed:@"Farmer_1"];
    farmer.farmerRunning = YES;
    farmer.farmerCanShoot = NO;
    farmer.position = position;
    farmer.anchorPoint = CGPointMake(0.5, 0.5);
    farmer.name = @"Farmer";
    farmer.zPosition = 10;
    
    [farmer setupPhysicsBody];
    [farmer farmerStandStill];

    return farmer;
    
}



-(void)farmerStandStill {
    if (self.farmerRunning) {
        [self removeActionForKey:@"farmerRunning"];
        NSArray *textures = @[[SKTexture textureWithImageNamed:@"Farmer_1"]];
        SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
        [self runAction:animation withKey:@"farmerStandingStill"];
        self.farmerRunning = NO;
    }
}

-(void)farmerRun {
    if (!self.farmerRunning) {
        [self removeActionForKey:@"farmerStandingStill"];
        NSArray *textures = @[[SKTexture textureWithImageNamed:@"Farmer_1"],
                              [SKTexture textureWithImageNamed:@"Farmer_2"]];
        SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
        [self runAction:[SKAction repeatActionForever:animation] withKey:@"farmerRunning"];
        self.farmerRunning = YES;
    }
}

-(void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = YES;
    self.physicsBody.allowsRotation = NO;
    self.physicsBody.categoryBitMask = CollisionCategoryFarmer;
    self.physicsBody.collisionBitMask = CollisionCategoryGround | CollisionCategoryEnemy | CollisionCategoryAsteroid;
    self.physicsBody.contactTestBitMask = CollisionCategoryGround;
}



@end
