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
    int D = GCD(A,B);
    int a = A/D;
    int b = B/D;
    
    if (b<0) {
        
        int c = -1;
        
        int Newa = a * c;
        int Newb = b *c;
        
    }
    [self setNumerator:a];
    [self setDenominator:b];
    
}

- (void) modifyByInverting;
{
    
}

-(void) modifyByNegative;
{
    
}

-(void) modifyByAdding: Arg;
{
    int a = [self numerator];
    int b = [self denominator];
    int c = [Arg numerator];
    int d =  [Arg denominator];
    int newDenominator = (a*d) / (b*d);
    int newNumerator = (b*c) / (b*d);
}

-(void) modifyByMultiplying: Arg;
{
    int a = [self numerator];
    int b = [self denominator];
    int c = [Arg numerator];
    int d =  [Arg denominator];
    int newDenominator = a*c;
    int newNumerator = b*d;
}


@end

