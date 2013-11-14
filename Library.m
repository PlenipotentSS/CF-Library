//
//  Library.m
//  Code Fellows Library Assignment
//
//  Created by Steven Stevenson on 11/13/13.
//
//

#import "Library.h"
#import "Shelf.h"
#import "Book.h"

@implementation Library

/*
 *  Library Constructors
 *
 */

-(id) init {
    self = [super init];
    if (self) {
        shelves = [[NSMutableArray alloc] init];
        unshelved_books = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(Library*) initWithShelfNames: (NSArray*) names {
    self = [super init];
    if (self) {
        int namesCount = [names count];
        for (int i=0; i<namesCount; i++ ){
            [self addShelf: [names objectAtIndex: i]];
        }
    }
    
    return self;
}

/*
 *  Other Library Methods
 *
 */

-(void) setLibraryName: (NSString*) name {
    library_name = name;
}

-(NSString*) getLibraryName {
    return library_name;
}

-(void) addShelf: (NSString*) shelfName {
    [shelves addObject: [[Shelf new] initWithSectionName: shelfName]];
}

-(void) removeShelf: (Shelf*) theShelf {
    if ( [shelves containsObject: theShelf]) {
        NSArray *booksRemoved = [theShelf getBooks];
        [unshelved_books addObjectsFromArray: booksRemoved];
        [shelves removeObject: theShelf];
    }
}

-(NSArray*) getShelves {
    NSArray *arr =[shelves copy];
    return arr;
}

-(NSArray*) getBooks {
    NSMutableArray *allBooks = [[NSMutableArray alloc] init];
    for (Shelf *thisShelf in shelves) {
        [allBooks addObjectsFromArray: [thisShelf getBooks]];
    }
    NSArray *arr = [allBooks copy];
    return arr;
}


@end
