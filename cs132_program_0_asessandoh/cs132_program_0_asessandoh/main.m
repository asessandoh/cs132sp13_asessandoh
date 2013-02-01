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
        
        //part C
        NSMutableArray * words = nil;
        NSLog(@" uninitialized : %@", words);
        
        words = [[NSMutableArray alloc] init];
        NSLog(@"initialized : %@", words);
        
        [words addObject:@","];
        NSLog(@" one added : %@", words);
        
        [words addObject:@"Hello"];
        NSLog(@" two added %@", words);
        
        [words addObject:@"World"];
        NSLog(@" all added %@", words);
        
        [words sortUsingSelector: @selector(localizedCaseInsensitiveCompare:)];
        NSLog(@" LocalizedcaseInsensitiveCompare : %@", words);
        
        //part D
        
        NSMutableString * word = nil;
        NSLog(@" uninitialized %@", word);
        
        word = [[NSMutableString alloc]initWithString:[words objectAtIndex:0]];
         NSLog(@" initialized %@", word);
        
        [word appendString:[words objectAtIndex:2]];
         NSLog(@"Post append %@", word);
        
        [word insertString:[words objectAtIndex:1] atIndex:0];
         NSLog(@"Post reformat %@", word);
        
    }
    return EXIT_SUCCESS;
    
}