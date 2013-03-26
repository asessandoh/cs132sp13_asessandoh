//
//  WCSFraction.m
//  Fraction Development
//
//  Created by Alex.E on 3/23/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSFraction.h"

@implementation WCSFraction


@synthesize numerator;
@synthesize denominator;


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
    int x = [self numerator];
    int y = [self denominator];
    int d = GCD (x, y);
    int newNumerator = x/d;
    int newDenominator = x/d;
    WCSFraction* Theresult = [[WCSFraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
    
    
}



@end

int GCD( int x, int y)
{
    printf("running init method\n");
    
    return NULL;
    
}

