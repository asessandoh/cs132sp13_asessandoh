//
//  ImmutableFraction.m
//  
//
//  Created by Alex.E on 2/28/13.
//
//

#import "ImmutableFraction.h"

@implementation ImmutableFraction
@synthesize numerator;
@synthesize denominator;


- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    [self release];
    return nil;
}

-(id) Description
{
    [self doesNotRecognizeSelector:_cmd];// printf("running init method\n);
    [self release];
    return nil;
}
-(fraction*)negative
{
    int a = [self numerator];
    int b = [self denominator];
    int newNumerator = 0 - a;
    int newDenominator = 0 - b;
    fraction* Theresult = [[fraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
}
-(fraction*)reciprocal
{
    int a = [self numerator];
    int b = [self denominator];
    int newNumerator = b;
    int newDenominator = a;
    fraction* Theresult = [[fraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
}
-(fraction*)sumwith: (fraction*) Arg;
{
    [self @Selector:_cmd];// Print...
    [self release];
    return nil;
}
-(fraction*)subtractFrom: (fraction*) Arg;
{
    return[self add: [negative Arg]];
}
-(fraction*)minus: (fraction*) Arg;
{
    fraction* Theresult = [self subtractFrom: Arg];
    return Theresult;
}
-(fraction*)multiplyBy: (fraction*) Arg;
{
    int a = [self numerator];
    int b = [self denominator];
    int c = [Arg numerator];
    int d =  [Arg denominator];
    int newDenominator = a*c;
    int newNumerator = b*d;
    fraction* Theresult = [[fraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
}
-(fraction*)divideBy: (fraction*) Arg;
{
    return[self multiplyBy:[Arg reciprocal]];
    
}
-(fraction*)divideInto: (fraction*) Arg;
{
    return  [Arg multiplyBy: [self reciprocal]];
    
}
-(fraction*)reduced (fraction*);
{
    int x = [self numerator];
    int y = [self denominator];
    int d = GCD ( int x, int y);
    int newNumerator = x/d;
    int newDenominator = x/d;
    fraction* Theresult = [[fraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
    
    
}



@end

int GCD( int x, int y)
{
    //printf
}
