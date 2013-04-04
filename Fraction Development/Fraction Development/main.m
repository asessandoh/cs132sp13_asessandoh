//
//  main.m
//  Fraction Development
//
//  Created by Bryant Adams on 3/19/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WCSFraction.h"
#import "WCSMutableFraction.h"

int main(int argc, char *argv[])
{
    return NSApplicationMain(argc, (const char **)argv);
    
    WCSFraction* oneThird ;
    WCSFraction* oneHalf ;
    WCSFraction* oneEight ;
    WCSFraction* fourhalves;
    WCSFraction* Result ;
    WCSMutableFraction* Theans;
    WCSMutableFraction* Ans;
     WCSMutableFraction* mutant;
    
   oneThird = [oneThird initWithNumerator:1 andDenominator:3];
    oneHalf = [ oneHalf initWithNumerator:1 andDenominator:2];
    
    Result = [oneThird minus:oneHalf];
    
    NSLog(@"the result is %d over %d",[Result numerator], [Result denominator]);
    
    oneEight = [oneEight initWithNumerator:1 andDenominator:8];
    
   
    
    [mutant setNumerator:5 andDenominator:8 ];
    
    Theans = [mutant modifyByNegative: oneEight];
    Ans = [ mutant modifyByAdding: fourhalves];
    
    NSLog(@"theans is %d over %d",[Theans numerator], [Theans denominator]);
    
    NSLog(@"Ans is %d over %d",[Ans numerator], [Ans denominator]);
    
    
return NSApplicationMain(argc, (const char **)argv);
    
}
