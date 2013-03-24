//
//  ImmutableFraction.h
//  
//
//  Created by Alex.E on 2/28/13.
//
//

#import <Cocoa/Cocoa.h>

@interface ImmutableFraction : NSObject
@property (assign) int numerator;
@property (assign) int denominator;

-(void) initWithNumretor:(int) Num;
        andDenominator:(int) Dem;

-(void) initWithFraction: (Fraction*);


-(float) floatvalue;

-(Fraction*)negative;
-(Fraction*)reciprocal;
-(Fraction*)sumWith:(Fraction*) arg;
-(Fraction*)subtractFrom:(Fraction*) arg;
-(Fraction*)add:(Fraction*) arg;
-(Fraction*)minus:(Fraction*) arg;
-(Fraction*)multiply:(Fraction*) arg;
-(Fraction*)multiplyBy:(Fraction*) arg;
-(Fraction*)divideBy:(Fraction*) arg;
-(Fraction*)divideInto:(Fraction*) arg;
-(Fraction*)reduced:(Fraction*) arg;


@end
int GCD(int x, int y);