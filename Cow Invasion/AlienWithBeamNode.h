//
//  AlienWithBeamNode.h
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-06-04.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BeamNode.h"
#import <AVFoundation/AVFoundation.h>

@interface AlienWithBeamNode : SKSpriteNode

@property (nonatomic) BOOL alienActionComplete;

+ (instancetype) alienWithBeamAtPosition: (CGPoint)position;

-(SKAction *)moveAlienOffScreen:(CGPoint)position stopLaserSound:(AVAudioPlayer *)beamSound;
-(void)removeBeam;

-(void)moveTowardsCowAtPosition:(CGPoint)position withBeamSound:(AVAudioPlayer *)beamSound;

@end
