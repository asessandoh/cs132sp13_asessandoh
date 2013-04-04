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
    
    WCSFraction* Result ;
    
   oneThird = [oneThird initWithNumerator:1 andDenominator:3];
    oneHalf = [ oneHalf initWithNumerator:1 andDenominator:2];
    
    Result = [oneThird minus:oneHalf];
    
    NSLog(@"the result is %d over %d",[Result numerator], [Result denominator]);
    
    

    

    
}
