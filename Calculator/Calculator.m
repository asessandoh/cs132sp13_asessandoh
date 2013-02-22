
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
    _DNU_numberOnScreen = (_DNU_numberOnScreen *10 + NewDigit - '0');
}

-(void) clearscreen: (char) clearscreen
{
   [self setNumberOnScreen:0]; 
}

-(void) registerarithmetic: (char) theoperator
{
    [ self setNumberAccumulated:_DNU_numberOnScreen];
    
    [self setNumberOnScreen:0];
    
    [self setOperationPending:theoperator];
}
/*
-(void)ComputeAndDisplayResult
{
    char op
    int lhs
    int rhs
    int result
    rhs = [self numberOnScreen];
    lhs = [self numberAccumulated];
    op = [self operationPending];
    switch(operator)
    {
        case: '+':
            break;
        case: '-':
            result = lhs - rhs;
            break;
        case: '*':
            break;
        case: '/'
    }
    numberOnScreen = result;
 [self setNumberAccumulated: 0];
 [self setoperationPending: '?'];
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

BOOL isarithmeticallkey( char arithmetickey)
{
    if(arithmetickey == '+') return YES;
    if(arithmetickey == '-') return YES;
    if(arithmetickey == '/') return YES;
    if(arithmetickey == '%') return YES;
    if(arithmetickey == '*') return YES;
    return NO;
}








