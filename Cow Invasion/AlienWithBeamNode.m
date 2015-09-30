//
//  AlienWithBeamNode.m
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-06-04.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import "AlienWithBeamNode.h"
#import "BeamNode.h"
#import "Util.h"
#import <AVFoundation/AVFoundation.h>

@interface AlienWithBeamNode ()
@property (strong, nonatomic) AVAudioPlayer *laserBeamSFX;
@end

@implementation AlienWithBeamNode

+(instancetype)alienWithBeamAtPosition:(CGPoint)position {
    AlienWithBeamNode *alienWithBeam = [self spriteNodeWithImageNamed:@"Alien_1"];
    alienWithBeam.alienActionComplete = NO;
    alienWithBeam.position = position;
    
    alienWithBeam.name = @"AlienWithBeam";
    alienWithBeam.xScale = 0.5;
    alienWithBeam.yScale = 0.5;
    
    [alienWithBeam setupPhysicsBody];
    
    BeamNode *beam = [BeamNode beamAtPosition:CGPointMake(0, -10)];
    [alienWithBeam addChild:beam];
    
    return alienWithBeam;
}

-(void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.allowsRotation = NO;
    self.physicsBody.categoryBitMask = CollisionCategoryAlienBeam;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = CollisionCategoryProjectile;
}

-(void)moveTowardsCowAtPosition:(CGPoint)position withBeamSound:(AVAudioPlayer *)beamSound {
    SKAction *alienWithBeam = [SKAction moveTo:CGPointMake(position.x, position.y + 110) duration:3.0];
    [self runAction:alienWithBeam completion:^{
        SKEmitterNode *forceFieldParticle = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"ForceFieldParticle" ofType:@"sks"]];
        forceFieldParticle.position = CGPointMake(0, -20);
        [self addChild:forceFieldParticle];
        
        // play laser beam sound
        [beamSound play];
        [self makeAlienBeamAtCow];
    }];
}

-(void)makeAlienBeamAtCow {
    BeamNode *beam = (BeamNode *)[self childNodeWithName:@"Beam"];
    SKAction *beamMoveToCow = [SKAction moveTo:CGPointMake(0, -250) duration:0.3];
    [beam runAction:beamMoveToCow completion:^{
        beam.position = CGPointMake(0, -20);
        [self makeAlienBeamAtCow];
    }];
    
}

-(SKAction *)moveAlienOffScreen:(CGPoint)position stopLaserSound:(AVAudioPlayer *)beamSound {
    SKAction *moveAlienShip = [SKAction moveTo:position duration:0.3];
    // stop laser beam sound
    [beamSound stop];
    return moveAlienShip;
}

-(void)removeBeam {
    BeamNode *beam = (BeamNode *)[self childNodeWithName:@"Beam"];
    [beam removeFromParent];
}

@end
