//
//  WCSMutableFraction.h
//  Fraction Development
//
//  Created by Alex.E on 3/26/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSFraction.h"

int GCD(int A,int B);

@interface WCSMutableFraction : WCSFraction <NSCopying>

@property (assign) int numerator;
@property  (assign) int denominator;

-(void) setNumerator:(int) Num andDenominator:(int) Dem;
-(void) modifyByInverting;
-(void) modifyByNegative;
-(void) modifyByAdding:(WCSFraction*) Arg;
-(void)modifyByMultiplying:(WCSFraction*) Arg;
-(id) copyWithZone: (NSZone *) zone;
@end


