//
//  main.m
//  Fraction Development
//
//  Created by Bryant Adams on 3/19/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import <Cocoa/Cocoa.h>


int main(int argc, char *argv[])
{
    return NSApplicationMain(argc, (const char **)argv);
    
    int oneThird = 1/3;
    int oneHalf = 1/2;
    int oneEight = 1/8;
    
    int Result = oneThird - oneHalf;
    
    NSLog(@"My code says that %d - %d is %d", oneThird, oneHalf, Result);
    
    
}
