//
//  Util.m
//  
//
//  Created by Eric Hodgins on 2015-05-28.
//
//

#import "Util.h"

@implementation Util

+(NSInteger)randomWithMin:(NSInteger)min max:(NSInteger)max {
    return arc4random() % (max - min) + min;
}

+(float)randomWithFloatMin:(float)min max:(float)max {
    float diff = max - min;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + min;
}

+(BOOL)getYesOrNo {
    int tmp = (arc4random() % 30) + 1;
    if (tmp % 5 == 0) {
        return YES;
    }
    
    return NO;
}

@end
