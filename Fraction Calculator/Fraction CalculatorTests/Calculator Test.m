//
//  Fraction Calculator - Calculator Test.m
//  Copyright 2013 Alex.E. All rights reserved.
//
//  Created by: Alex.E
//

    // Class under test
#import "Calculator.h"
#import "WCSFraction.h"
#import "WCSMutableFraction.h"

    // Collaborators

    // Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

// Uncomment the next two lines to use OCMockito for mock objects:
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

@interface Calculator_Test : SenTestCase
@end

@implementation Calculator_Test

    {
        Calculator* sut;
    }
    - (void)setUp
    {
        [super setUp];
        sut = [[Calculator alloc] init];
    }
    - (void)tearDown
    {
        sut= nil;
        [super tearDown];
    }
    - (void)testCreateCalculator
    {
        assertThat(sut, isNot(nil));
    }
    -(void)pressKeys:(NSString*) keystring
    {
        for(NSUInteger i=0; i<[keystring length]; i+=1)
        {
            [sut pressKey:[keystring characterAtIndex:i]];
        }
    }


-(void)testExample
{
    STFail(@"Unit tests are not implemented yet in Calculator_Test");
}

- (void)testClearWorks
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    [self pressKeys:@"123c"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testinput
{
        WCSFraction* testing;
        testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
        
        [self pressKeys:@"9"];
        assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testmultidigit
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"123"];
    assertThat([sut numberOnScreen] is(equal(testing));
}
-(void)test???
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"%5"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testinputtodenominator
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"1%5"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testtonumerator
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"15"];
    assertThat([sut numberOnScreen] is(equal(testing));
}
        
-(void)testinputaftersecondswapreturnstonumerator
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"1%5%2"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testinputafterdoubleswapstaysonnumerator
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"1%%2"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testpushingbsdeletesinnumeratormode
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"12<"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testpushingbsdeletesindenominatormode
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"%<"];
    assertThat([sut numberOnScreen] is(equal(testing));
}
               
-(void)testpushingbsdeletesindenominatormode
{
    
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"3%104<"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testbswithnovaluedoesntaddvalue
{
    
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"1234<"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testbswithnovaluedoesntaddvalue
{
    
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"1<<"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testeffectofdeletingentiredenominator
{
    
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"5%<"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testsequenceofoperationswithoutdidgitinput
{
    
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"15+-+"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testcheckthatautoreductionworks
{
    
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"122/4"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)fractionfractionaddition
{
    
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"10/15+10/16"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testfractionfractionmultication
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"5/1*2/10"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testfractionfractiondivision
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"5/1/2/10"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testfractionfractionsubtraction
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"10/15-10/16"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

-(void)testintegerintegerdivision
{
        WCSFraction* testing;
        testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
        
        [self pressKeys:@"6/4"];
        assertThat([sut numberOnScreen] is(equal(testing));
}
                   
-(void)testintegerintegermodulo
{
    WCSFraction* testing;
    testing = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1 ];
    
    [self pressKeys:@"6%4"];
    assertThat([sut numberOnScreen] is(equal(testing));
}

@end