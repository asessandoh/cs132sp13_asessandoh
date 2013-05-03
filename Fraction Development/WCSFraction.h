//
//  WCSFraction.h
//  Fraction Development
//
//  Created by Alex.E on 3/23/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import <Foundation/Foundation.h>



int gcd(int a, int b);

@interface WCSFraction : NSObject <NSCopying>

@property (readonly,assign) int numerator;
@property (readonly,assign) int denominator;

-(id) initWithNumerator:(int)Num
         andDenominator:(int) Dem;

-(id) initWithFraction: (WCSFraction*) Arg;
-(id) initWithInteger:(int) TheInt;

-(float) floatValue;

-(WCSFraction*)negative;
-(WCSFraction*)reciprocal;
-(WCSFraction*)sumWith:(WCSFraction*) Arg;
-(WCSFraction*)subtractFrom:(WCSFraction*) Arg;
-(WCSFraction*)add:(WCSFraction*) Arg;
-(WCSFraction*)minus:(WCSFraction*) Arg;
-(WCSFraction*)multiply:(WCSFraction*) Arg;
-(WCSFraction*)multiplyBy:(WCSFraction*) Arg;
-(WCSFraction*)divideBy:(WCSFraction*) Arg;
-(WCSFraction*)divideInto:(WCSFraction*) Arg;
-(WCSFraction*)reduced:(WCSFraction*) Arg;
-(id) copyWithZone: (NSZone *) zone;

@end