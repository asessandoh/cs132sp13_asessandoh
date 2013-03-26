//
//  WCSFraction.m
//  Fraction Development
//
//  Created by Alex.E on 3/23/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSFraction.h"


int gcd(int a, int b)
{ //Euclidean algorithm. It works!
    if(b==0) return a;
    else return gcd(b, a%b);
}


@implementation WCSFraction


@synthesize numerator;
@synthesize denominator;


-(NSComparisonResult) compareToFraction:(WCSFraction*) otherFraction
{
    //Common math trick:
    //   Do not compare two things directly :   a  vs b
    //   Do compare their difference to zero :  a-b vs 0
    //   It is often easiest to determine whether
    //    a value is postive, negative, or zero
    
    int difference = [[self minus: otherFraction] numerator];
    
    if(difference > 0) return NSOrderedDescending; // self > other
    if(difference < 0) return NSOrderedAscending; // self < other
    if(difference == 0) return NSOrderedSame; //self == other
    
    return NSOrderedSame; //This line should never execute
    
}

- (BOOL)isEqual:(id)other
{
    if (other == self)
        return YES; //That's ME!
    if (!other)
        return NO; //There's no "that" to compare to
    if(![other isKindOfClass:[WCSFraction class]])
        return NO; //Meh, it's not a fraction. Apples'n'oranges.
    
    return [self compareToFraction:other]==NSOrderedSame; //Comparing Fractions
}

-(NSUInteger) hash
{ //This has to do with how these could be stored in sets and dictionaries
    return MAX([self numerator], [self denominator]);
} //Wait until CS222 (Data Structures) to ask about this one


-(id)init
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

-(id) Description
{
    printf("running init method\n");
    
    return NULL ;
}
-(WCSFraction*)negative
{
    int a = [self numerator];
    int b = [self denominator];
    int newNumerator = 0 - a;
    int newDenominator = 0 - b;
    WCSFraction* Theresult = [[WCSFraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
}
-(WCSFraction*)reciprocal
{
    int a = [self numerator];
    int b = [self denominator];
    int newNumerator = b;
    int newDenominator = a;
    WCSFraction* Theresult = [[WCSFraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
}
-(WCSFraction*)sumwith: (WCSFraction*) Arg;
{
    
}
-(WCSFraction*)subtractFrom: (WCSFraction*) Arg;
{
    return[self add: [Arg negative]];
}
-(WCSFraction*)minus: (WCSFraction*) Arg;
{
    WCSFraction* Theresult = [self subtractFrom: Arg];
    return Theresult;
}
-(WCSFraction*)multiplyBy: (WCSFraction*) Arg;
{
    int a = [self numerator];
    int b = [self denominator];
    int c = [Arg numerator];
    int d =  [Arg denominator];
    int newDenominator = a*c;
    int newNumerator = b*d;
    WCSFraction* Theresult = [[WCSFraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
}
-(WCSFraction*)divideBy: (WCSFraction*) Arg;
{
    return[self multiplyBy:[Arg reciprocal]];
    
}
-(WCSFraction*)divideInto: (WCSFraction*) Arg;
{
    return  [Arg multiplyBy: [self reciprocal]];
    
}
-(WCSFraction*)reduced: (WCSFraction*) Arg;
{
    int a = [self numerator];
    int b = [self denominator];
    int d = GCD (a,b);
    int newNumerator = a/d;
    int newDenominator = b/d;
    WCSFraction* Theresult = [[WCSFraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
    
    
}



@end

