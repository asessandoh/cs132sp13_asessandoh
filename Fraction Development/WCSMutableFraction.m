//
//  WCSMutableFraction.m
//  Fraction Development
//
//  Created by Alex.E on 3/26/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSMutableFraction.h"

@implementation WCSMutableFraction

-(void) setNumerator: (int) A andDenominator:(int) B ;
{
    int D = GCD(A,B);
    int a = A/D;
    int b = B/D;
    
    if (B<0) {
        
        int c = -1;
        
        int NewNum = a * c;
        int NewDenom = b *c;
        
    }
    
}

- (void) modifyByInverting;
{
    
}

-(void) modifyByNegative;
{
    
}

-(void) modifyByAdding;
{
    
}

-(void) modifyByMultiplying;
{
    
}


@end

