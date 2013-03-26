//
//  WCSFraction.h
//  Fraction Development
//
//  Created by Alex.E on 3/23/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCSFraction : NSObject

@property (assign) int numerator;
@property (assign) int denominator;

-(void) initWithNumretor:(int) Num
andDenominator:(int) Dem;

-(void) initWithFraction: (WCSFraction*) Arg;


-(float) floatvalue;

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


@end
int GCD(int x, int y);