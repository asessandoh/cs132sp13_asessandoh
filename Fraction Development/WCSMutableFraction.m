//
//  WCSMutableFraction.m
//  Fraction Development
//
//  Created by Alex.E on 3/26/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSMutableFraction.h"

@implementation WCSMutableFraction 

@synthesize numerator = _AOII_numerator;
@synthesize denominator = _AOII_denominator;

-(void) setNumerator: (int) A andDenominator:(int) B ;
{
    int D = gcd(A,B);
    int a = A/D;
    int b = B/D;
    
    if (b<0)
    {
        
        int c = -1;
        
        int Newa = a * c;
        int Newb = b *c;
        
        [self setNumerator:Newa];
        [self setDenominator:Newb];

    }
    [self setNumerator:a];
    [self setDenominator:b];
    
}

- (void) modifyByInverting;
{
    int a = [self numerator];
    int b = [self denominator];
    
    [self setNumerator:b];
    [self setDenominator:a];
    
}

-(void) modifyByNegative;
{
    
    int a = [self numerator];
    int b = [self denominator];
    int newNumerator = 0 - a;
    int newDenominator = b;
    
    [self setNumerator:newNumerator];
    [self setDenominator:newDenominator];
}

-(void) modifyByAdding: (WCSFraction*)Arg;
{
    int a = [self numerator];
    int b = [self denominator];
    int c = [Arg numerator];
    int d =  [Arg denominator];
    int newDenominator = (a*d) / (b*d);
    int newNumerator = (b*c) / (b*d);
    
    [self setNumerator:newNumerator];
    [self setDenominator:newDenominator];
    
}

-(void) modifyByMultiplying:(WCSFraction*) Arg;
{
    int a = [self numerator];
    int b = [self denominator];
    int c = [Arg numerator];
    int d =  [Arg denominator];
    int newDenominator = a*c;
    int newNumerator = b*d;
    
    [self setNumerator:newNumerator];
    [self setDenominator:newDenominator];
}

-(id) copyWithZone: (NSZone *) zone
{
    WCSFraction* newfraction = nil;
    newfraction = [[WCSFraction allocWithZone:zone]initWithNumerator:[self numerator] andDenominator:[self denominator]];
    return 0;
    
    // newfraction = [[WCSFraction allocWithZone:zone]initWithFraction:self];
}

@end

