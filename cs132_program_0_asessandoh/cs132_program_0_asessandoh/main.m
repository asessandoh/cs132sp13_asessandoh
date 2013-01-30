/**
 @file main.m
 @author Prof. Adams
 @date 2013 01 18
 */

#import <Foundation/Foundation.h>

/**
 @brief Entry point for the program - sets up objects and puts everything in motion
 @returns EXIT_SUCCESS if all went well
 */
int main(void)
{
    
    @autoreleasepool {
    
        NSMutableArray * words = nil;
        NSLog(@"%@", words);
        
        words = [[NSMutableArray alloc] init];
        NSLog(@"%@", words);
        
        [words addObject:@","];
        NSLog(@"%@", words);
                
        [words addObject:@"Hello"];
        NSLog(@"%@", words);
        
        [words addObject:@"World"];
        NSLog(@"%@", words);
    
        [words sortUsingSelector: @selector(localizedCaseInsensitiveCompare:)];
        NSLog(@"%@", words);
        
    }
    return EXIT_SUCCESS;
    
}