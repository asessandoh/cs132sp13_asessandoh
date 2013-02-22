
#import "Calculator.h"

@implementation Calculator

@synthesize numberAccumulated = numberAccumulated;
@synthesize numberOnScreen = numberOnScreen;
@synthesize OperationPending = OperationPending ;

- (id)init
{
    self = [super init];
    if (self)
    {
        //Set up initial calculator conditions here
        
        numberAccumulated = 0;
        numberOnScreen = 0;
        OperationPending = '+';
        
    }
    return self;
}
-(void) pressKey: (char ) pressKey
{

    if (isADigit(pressKey)){
        
        [self appendDigit:pressKey];
        
    }
    else if(isClearScreenKey(pressKey)) {
        
        [self clearscreen:pressKey];
        
    }
    else if(isclearaccumulator(pressKey)){
        
        [self clearaccumulator:pressKey];
        
    }
    else if(isclearoperation(pressKey)){
        
        [self clearoperation:pressKey];
        
    }
    else if(isresultkey(pressKey)) {
        
        [self resultkey:pressKey];
        
    }
    else if(isarithmeticallkey(pressKey)) {
        
        [self arithmeticallkey:pressKey];
        
    }
    else if (isclearallkey(pressKey)) {
        
        [self clearallkey:(pressKey)];
        
    }else{
        
        NSLog(@"Uncovered argument '%c' in %@ message received by object at %p (%@)", pressKey, NSStringFromSelector(_cmd), self, self);
    
    return;
    }
}
-(void) appendDigit:(char)NewDigit
{
    numberOnScreen = (numberOnScreen *10 + NewDigit - '0');
}

-(void) clearscreen: (char) clearscreen
{
   [self setNumberOnScreen:0]; 
}

-(void) clearaccumulator:(char)clearaccumulator
{
    [self setNumberAccumulated:0];
}

-(void) clearoperation:(char)clearoperation
{
    [self setOperationPending:'?'];
}

-(void) registerarithmetic: (char) theoperator
{
    [ self setNumberAccumulated:numberOnScreen];
    
    [self setNumberOnScreen:0];
    
    [self setOperationPending:theoperator];
}

-(void)ComputeAndDisplayResult
{
    char op;
    int lhs;
    int rhs;
    int result;
    rhs = [self numberOnScreen];
    lhs = [self numberAccumulated];
    op = [self OperationPending];
    switch(op)
    {
        case '+':
             result= lhs + rhs;
            break;
           
        case '-':
            result = lhs - rhs;
            break;
            
        case '*':
            result= lhs * rhs;
            break;
            
        case '/':
            result= lhs / rhs;
            break;
            
        case '%':
            result= lhs%rhs;
            break;
            
        default :
            result = rhs;
            break;
    }
    
    [self setNumberOnScreen:result];
    [self setNumberAccumulated: 0];
    [self setOperationPending:'?'];

}



-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen." , numberOnScreen ];
}
@end

BOOL isADigit(char Digit)
{
    if( Digit > '9') return NO;
    if( Digit < '0') return NO;
    return YES;
}

BOOL isClearScreenKey(char Clear)
{
    if(Clear == 'c') return YES;
    if(Clear == 'C') return YES;
    return NO;
}

BOOL isclearaccumulator(char clearaccumalator)
{
    if(clearaccumalator == 'c') return YES;
    if(clearaccumalator == 'C') return YES;
    return NO;
}

BOOL isclearoperation(char clearoperation)
{
    if(clearoperation == 'c') return YES;
    if(clearoperation == 'C') return YES;
    return NO;
}


BOOL isclearallkey( char clearall)
{
    if(clearall == 'a') return YES;
    if(clearall == 'A') return YES;
    return NO;
}

BOOL isresultkey( char result)
{
    if(result == '=') return YES;
    return NO;
}

BOOL isarithmeticallkey( char arithmetickey)
{
    if(arithmetickey == '+') return YES;
    if(arithmetickey == '-') return YES;
    if(arithmetickey == '/') return YES;
    if(arithmetickey == '%') return YES;
    if(arithmetickey == '*') return YES;
    return NO;
}








