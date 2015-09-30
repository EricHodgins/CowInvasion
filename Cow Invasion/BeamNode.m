//
//  BeamNode.m
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-06-02.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import "BeamNode.h"
#import "Util.h"

@implementation BeamNode

+(instancetype)beamAtPosition:(CGPoint)position {
    BeamNode *beam = [BeamNode spriteNodeWithColor:[SKColor colorWithRed:223/225.0f green:206/255.0f blue:65/255.0f alpha:1.0] size:CGSizeMake(60, 3) ];
    beam.position = position;
    beam.anchorPoint = CGPointMake(0.5, 0.5);
    beam.name = @"Beam";
    
    [beam setupPhysicsBody];
    
    return beam;
}

//-(void) activateBeam {
//
//    SKAction *beamAppear = [SKAction resizeToWidth:15 height:100 duration:3.0];
//    SKAction *beamDisappear = [SKAction resizeToWidth:1 height:1 duration:0.3];
//    SKAction *turnContactOn = [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode *node, CGFloat elapsedTime) {
//        self.physicsBody.contactTestBitMask = CollisionCategoryCow;
//    }];
//    SKAction *sequence = [SKAction sequence:@[beamAppear, turnContactOn, beamDisappear]];
//    [self runAction:[SKAction repeatAction:sequence count:1]];
//
//}

-(void)setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size center:CGPointMake(0, 0)];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.categoryBitMask = CollisionCategoryBeam;
    self.physicsBody.contactTestBitMask = 0;
    self.physicsBody.collisionBitMask = 0;
}

@end
