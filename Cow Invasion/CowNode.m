//
//  CowNode.m
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-05-31.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import "CowNode.h"
#import "Util.h"

@implementation CowNode

+(instancetype)cowAtPosition:(CGPoint)position {
    CowNode *cow = [CowNode spriteNodeWithImageNamed:@"Cow_1"];
    cow.anchorPoint = CGPointMake(0.5, 0.5);
    cow.position = position;
    cow.name = @"Cow";
    
    [cow setupPhysicsBody];
    
    return cow;
}

-(void)setupAnimation {
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"Cow_1"],
                          [SKTexture textureWithImageNamed:@"Cow_2"],
                          [SKTexture textureWithImageNamed:@"Cow_3"],
                          [SKTexture textureWithImageNamed:@"Cow_4"],
                          [SKTexture textureWithImageNamed:@"Cow_5"],
                          [SKTexture textureWithImageNamed:@"Cow_6"],
                          [SKTexture textureWithImageNamed:@"Cow_7"],
                          [SKTexture textureWithImageNamed:@"Cow_8"],
                          [SKTexture textureWithImageNamed:@"Cow_9"],
                          [SKTexture textureWithImageNamed:@"Cow_10"],
                          [SKTexture textureWithImageNamed:@"Cow_11"],
                          [SKTexture textureWithImageNamed:@"Cow_12"],
                          ];
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    [self runAction:[SKAction repeatActionForever:animation]];
}

-(void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.categoryBitMask = CollisionCategoryCow;
    self.physicsBody.contactTestBitMask = CollisionCategoryBeam;
    self.physicsBody.collisionBitMask = 0;
}

-(SKAction *)moveCowTowardsAlien:(CGPoint)position {
    SKAction *moveCow = [SKAction moveTo:position duration:3.0];
    SKAction *shrinkCow = [SKAction scaleBy:0.1 duration:3.0];
//    [self runAction:shrinkCow];
//    [self runAction:moveCow completion:^{
//        [self removeFromParent];
//    }];
    SKAction *group = [SKAction group:@[moveCow, shrinkCow]];
    return  group;
}

@end
