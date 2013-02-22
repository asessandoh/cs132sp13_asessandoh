
#import "Calculator.h"

@implementation Calculator

@synthesize numberAccumulated = _DNU_numberAccumulated;
@synthesize numberOnScreen = _DNU_numberOnScreen;
@synthesize operationPending = _DNU_operationPending ;

- (id)init
{
    self = [super init];
    if (self)
    {
        //Set up initial calculator conditions here
        
        _DNU_numberAccumulated = 0;
        _DNU_numberOnScreen = 0;
        _DNU_operationPending = '+';
        
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
    else if(isresultkey(pressKey)) {
        
        [self resultkey:pressKey];
        
    }
    else if (isclearallkey(pressKey))
    {
        [self clearallkey:(pressKey)];
        
    }else{
        
        NSLog(@"Uncovered argument '%c' in %@ message received by object at %p (%@)", pressKey, NSStringFromSelector(_cmd), self, self);
    
    return;
    }
}
-(void) appendDigit:(char)NewDigit
{
    _DNU_numberOnScreen = (_DNU_numberOnScreen *10 + NewDigit - '0');
}

-(void) clearscreen: (char) clearscreen
{
   [self setNumberOnScreen:0]; 
}

/*
-(void)computeAmdDisplayResult
{
    char operator
    int lhs
    int rhs
    int result
    rhs = [self numberOnScreen];
    lhs = [self numberAccumulated];
    operator = [self operationPending];
    switch(operator)
    {
        case: '+':
            break;
        case: '-':
            result = lhs - rhs;
            break;
        case: '*':
            break;
    }
    numberOnScreen = result;
}
*/


-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen.", _DNU_numberOnScreen ];
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










