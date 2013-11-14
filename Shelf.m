//
//  Shelf.m
//  Code Fellows Library Assignment
//
//  Created by Steven Stevenson on 11/13/13.
//
//

#import "Shelf.h"
#import "Book.h"

@implementation Shelf

/*
 *  Shelf Constructors
 *
 */

-(id)init {
    self = [super init];
    if (self) {
        book_arr = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(Shelf*) initWithSectionName: (NSString*) name {
    self = [super init];
    if (self) {
        [self setSection: name];
    }
    
    return self;
}

/*
 *  Other Shelf Methods
 *
 */

-(void) setSection: (NSString*) name {
    section = name;
}

-(NSString*) getSection {
    return section;
}

-(void)putBook:(Book*) theBook {
    [book_arr addObject: theBook];
}

-(Book*) removeBook: (Book*) theBook {
    if ([book_arr containsObject: theBook] ) {
        [book_arr removeObject: theBook];
    }
    return theBook;
}

-(NSArray*)getBooks {
    NSArray *arr =[book_arr copy];
    return arr;
}

@end
