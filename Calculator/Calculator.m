
#import "Calculator.h"
#import "WCSFraction.h"
#import "WCSMutableFraction.h"

@implementation Calculator


- (id)init
{
    self = [super init];
    if (self)
    {
        [self clearScreen];
        [self clearAccumulator];
        [self clearOperation];
    }
    return self;
}
-(void)clearScreen
{
    [self setNumberOnScreen:0] ;
}
-(void)clearAccumulator
{
    [self setNumberAccumulated:0] ;
}
-(void)clearOperation
{
    [self setOperatingPending:'?'] ;
}
-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen.", [self numberOnScreen ]];
}
-(void) pressKey:(char)theKey
{
    
    
    if(isADigit(theKey) == YES)
    {
        [self appendDigit:theKey] ;
    }
    
    else
        if(isClearScreenKey(theKey))
        {
            [self clearScreen] ;
        }
    
        else
            if(isArithmeticAllKey(theKey))
            {
                [self registerArithmetic:theKey] ;
            }
            else
                if (isClearAllKey(theKey))
                {
                    [self clearOperation] ;
                    [self clearScreen] ;
                    [self clearOperation] ;
                }
                else
                    if(isResultKey(theKey))
                    {
                        [self computeAndDisplayResult];
                    }
    
                    else
                    {
                        NSLog(@"Uncovered argument '%c' in %@ message received by object at %p (%@)", theKey, NSStringFromSelector(_cmd), self, self);
                    }
    
    return;
}


-(void) appendDigit: (char) theDigit
{
    WCSMutableFraction* old =[self numberOnScreen] ;
    switch ([self fractional])
    {
        case WCSPartTop:
            [old setNumerator:[old numerator]*10+theKey];
            break;
            
        case WCSPartBottom:
            [old setNumerator:[old denominator]*10+theKey];
            break;
            
        default:
            NSLog(@"ERROR!");
            break;
    }
}
-(void) registerArithmetic:(char)theOperator
{
    [self computeAndDisplayResult] ;
    [self setNumberAccumulated : [self numberOnScreen]] ;
    [self clearScreen] ;
    [self setOperatingPending:theOperator] ;
}
-(void) computeAndDisplayResult
{
    
    WCSMutableFraction* result = [self numberOnScreen];
    WCSFraction* accumlated = [self numberAccumulated];    char operation = [self operatingPending] ;
   
    
    switch (operation)
    {
        case '+':
		    [result modifyByAdding:accumlated];
		    break;
		case '-':
            [result modifyByAdding:[accumlated negative]];
            break;
		case '*':
            [result modifyByMultiplying:accumlated];
            break;
        case '/':
            [result modifyByMultiplying:[accumlated reciprocal]];
            break;
        case '%':
            switch ([self fractional]) {
                case WCSPartTop:
                    [self setFractional:WCSPartBottom];
                    break;
                case WCSPartBottom :
                    [self setFractional:WCSPartTop];
                default:
                    NSLog(@"NOPES");
                    break;
                    
            }
            break;
		default:
            break;
	}
	[self setNumberOnScreen:result];
    [self clearAccumulator];
    [self clearOperation];}
@end
BOOL isADigit(char someChar)
{
    int value = someChar-'0' ;
    if(value <= 9 && value >= 0)
    {
        return YES;
    }
    else
        return NO;
}
BOOL isClearScreenKey(char someChar)
{
    switch (someChar)
    {
        case 'c':
            return YES;
            break;
            
        case 'C':
            return YES;
            break;
            
        default:
            return NO ;
    }
}
BOOL isClearAllKey(char someChar)
{
    switch (someChar)
    {
        case 'a':
            return YES;
            break;
            
        case 'A':
            return YES;
            break;
            
        default:
            return NO ;
    }
}
BOOL isResultKey(char someChar)
{
    switch (someChar)
    {
        case '=':
            return YES;
            break;
            
            
        default:
            return NO ;
    }
}
BOOL isArithmeticAllKey(char someChar)
{
    switch (someChar)
    {
        case '+':
            return YES;
            break;
            
        case '-':
            return YES;
            break;
            
        case '/':
            return YES;
            break;
            
            
        case '*':
            return YES;
            break;
            
        case '%':
            return YES;
            break;
            
        default:
            return NO ;
    }
}