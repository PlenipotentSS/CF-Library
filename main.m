#import <Foundation/Foundation.h>
#import "Library.h"

int main (int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *sectionNames = @[@"Fiction",@"Non-Fiction",@"Children",@"Mystery",@"Education"];
    
        Library *myLibrary = [Library new];
        [myLibrary initWithShelfNames: sectionNames];
        // insert code here...
        NSLog (@"Hello World!");
    }
}