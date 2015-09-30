//
//  Util.h
//  
//
//  Created by Eric Hodgins on 2015-05-28.
//
//

#import <Foundation/Foundation.h>

static const int FarmerSpeed = 100;
static const int MaxLives = 3;

typedef NS_OPTIONS(uint32_t, CollisionCategory) {
    CollisionCategoryEnemy      = 1 << 0,
    CollisionCategoryAlienBeam  = 1 << 1,
    CollisionCategoryProjectile = 1 << 2,
    CollisionCategoryGround     = 1 << 3,
    CollisionCategoryDebris     = 1 << 4,
    CollisionCategoryFarmer     = 1 << 5,
    CollisionCategoryCow        = 1 << 6,
    CollisionCategoryBeam       = 1 << 7,
    CollisionCategoryAsteroid   = 1 << 8
};

enum AlienVectorSpeed {
    easy = -150,
    hard = -200,
    veryHard = -400
};

@interface Util : NSObject

+(NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max;
+(float) randomWithFloatMin:(float)min max:(float)max;
+(BOOL) getYesOrNo;

@end
