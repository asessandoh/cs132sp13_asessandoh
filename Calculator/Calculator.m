
#import "Calculator.h"

@implementation Calculator



- (id)init
{
    self = [super init];
    if (self)
    {
        //Set up initial calculator conditions here
        
        [self clearaccumulator];
        [self clearscreen];
        [self clearoperation];
        
    }
    return self;
}
-(void) pressKey: (char ) pressKey
{

    if (isADigit(pressKey)){
        
        [self appendDigit:pressKey];
        
       
    }
    else if(isClearScreenKey(pressKey)) {
        
        [self clearscreen];
        
    }
    else if(isclearaccumulator(pressKey)){
        
        [self clearaccumulator];
        
    }
    else if(isclearoperation(pressKey)){
        
        [self clearoperation];
        
    }
    else if(isresultkey(pressKey)) {
    
        [self ComputeAndDisplayResult];
        
    }
    else if(isarithmeticallkey(pressKey)) {
        
        [self arithmeticallkey:pressKey];
        [self registerarithmetic:pressKey];
        
    }
    else if (isclearallkey(pressKey)) {
        
        [self clearallkey];
        
    }else{
        
        NSLog(@"Uncovered argument '%c' in %@ message received by object at %p (%@)", pressKey, NSStringFromSelector(_cmd), self, self);
    
    return;
    }
}
-(void) appendDigit:(char)NewDigit
{
    [self setNumberOnScreen:([self numberOnScreen] *10 + NewDigit - '0')];
}

-(void) clearscreen
{
   [self setNumberOnScreen:0]; 
}

-(void)clearallkey
{
    [self setNumberAccumulated:0];
    [self setNumberOnScreen:0];
    [self setOperationPending:'?'];
}

-(void) clearaccumulator
{
    [self setNumberAccumulated:0];
}

-(void) clearoperation
{ 
    [self setOperationPending:'?'];
}

-(void) registerarithmetic: (char) theoperator
{
    [ self setNumberAccumulated:[self numberOnScreen]];
    
    [self clearscreen];
    
    [self setOperationPending:theoperator];
}
-(void)resultkey:(char)resultkey
{
    [self numberOnScreen];
}
-(void)arithmeticallkey:(char)arithmetickey
{
    if (arithmetickey == '+') {
        [self setNumberAccumulated:'+'];
    }
    else if (arithmetickey == '-'){
        [self setNumberAccumulated:'-'];
    }
    else if (arithmetickey == '*'){
        [self setNumberAccumulated:'*'];
    }
    else if (arithmetickey == '/'){
        [self setNumberAccumulated:'/'];
    }
    else if (arithmetickey == '%'){
        [self setNumberAccumulated:'%'];
    }
        
}


-(void)ComputeAndDisplayResult
{
    char op;
    int lhs;
    int rhs;
    int result;
    rhs = [self numberOnScreen];
    lhs = [self numberAccumulated];
    op =  [self operationPending];
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
    [self clearaccumulator];
    [self clearoperation];
}



-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen." , [self numberOnScreen] ];
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








