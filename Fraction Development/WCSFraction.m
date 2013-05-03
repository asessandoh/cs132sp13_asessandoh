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


@synthesize numerator =  _initializedNumerator;
@synthesize denominator =  _initializedDenominator;

-(id) initWithNumerator:(int) Num
         andDenominator:(int) Dem
{
    
    int a = Num;
    int b = Dem;
    int newNumerator = a / gcd( a , b ) ;
    int newDenominator = b / gcd( a , b ) ;
    
    if (newDenominator<0)
    {
        newDenominator = newDenominator*-1;
        newNumerator = newNumerator*-1;
    }
    
    
    
    self = [super init];
    if (self) {
        _initializedNumerator = newNumerator;
        _initializedDenominator = newDenominator;
    }
    return self;
}
-(id)initWithInteger:(int) TheInt
{
   return [self initWithNumerator: TheInt andDenominator: 1 ];
    
}

-(id) copyWithZone: (NSZone *) zone
{
    WCSFraction* newfraction = nil;
    newfraction = [[WCSFraction allocWithZone:zone]initWithNumerator:[self numerator] andDenominator:[self denominator]];
    return 0;
    
}

-(NSComparisonResult) compareToFraction:(WCSFraction*) otherFraction
{
    //Common math trick:
    //   Do not compare two things directly :   a  vs b
    //   Do compare their difference to zero :  a-b vs 0
    //   It is often easiest to determine whether
    //    a value is postive, negative, or zero
    WCSFraction* diff = [self minus:otherFraction];
    int difference = [diff numerator];
    
    NSLog(@"Comparing %@ (%d/%d) to %@ (%d/%d), diff is %@", self, [self numerator], [self denominator], otherFraction, [otherFraction numerator], [otherFraction denominator], diff);
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
    self = [self initWithNumerator:1 andDenominator:1];
    
    return self ;
}

-(float)floatValue
{
    if([self denominator]==0)
    {
        return 0;
    }
    else
    {
        float answer = [self numerator]/[self denominator];

        return answer ;
    }
}
-(id) initWithFraction: (WCSFraction*) Arg
{
    return [self initWithNumerator:[Arg numerator] andDenominator:[Arg denominator]];
    }

-(id) description
{
    if([self denominator] == 1)
    {
        return [NSString stringWithFormat: @"%d" , [self numerator]];
    }
    else
        
        if([self denominator] == 0)
        {
            return [NSString stringWithFormat: @"ERROR" ];
        }
        else
            
            
            
        {
            return [NSString stringWithFormat: @"%d/%d" , [self numerator] , [self denominator]];
        }
    
}
-(WCSFraction*)negative
{
    int a = [self numerator];
    int b = [self denominator];
    int newNumerator = 0 - a;
    int newDenominator =  b;
    WCSFraction* Theresult = [[WCSFraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    NSLog(@"The negative of %@ is %@?\n\n", self, Theresult);
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
-(WCSFraction*)sumWith:(WCSFraction*) Arg;
{
    return [Arg add:self];
}
-(WCSFraction*)subtractFrom: (WCSFraction*) Arg;
{
    return[self add: [Arg negative]];
}
-(WCSFraction*)minus: (WCSFraction*) Arg;
{
    WCSFraction* Theresult = [Arg subtractFrom: self];
    return Theresult;
}
-(WCSFraction*)multiplyBy: (WCSFraction*) Arg;
{
    int a = [self numerator];
    int b = [self denominator];
    int c = [Arg numerator];
    int d =  [Arg denominator];
    int newDenominator = b*d;
    int newNumerator = a*c;
    WCSFraction* Theresult = [[WCSFraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
}

-(WCSFraction*)multiply:(WCSFraction*) Arg
{
    WCSFraction* Theresult;
    
    Theresult = [Arg multiplyBy:self];
    return Theresult;
    
}

-(WCSFraction*)add:(WCSFraction *)Arg;
{
    int a = [self numerator];
    int b = [self denominator];
    int c = [Arg numerator];
    int d =  [Arg denominator];
    int newNumerator = a*d + c*b;
    int newDenominator = b*d;
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
    int d = gcd (a,b);
    int newNumerator = a/d;
    int newDenominator = b/d;
    WCSFraction* Theresult = [[WCSFraction alloc]initWithNumerator:newNumerator andDenominator:newDenominator];
    return Theresult;
    
    if (newDenominator < 0)
    {
        int c = -1;
        
        int PosNumerator = newNumerator * c;
        int PosDenominator = newDenominator *c;
        
        WCSFraction* Theresult = [[WCSFraction alloc]initWithNumerator:PosNumerator andDenominator:PosDenominator];
        return Theresult;
        
    }

    
}



@end

