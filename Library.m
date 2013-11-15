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

@synthesize unshelved_books;

/*
 *  Library Constructors
 *
 */

-(id) init {
    self = [super init];
    if (self) {
        shelves = [[NSMutableArray alloc] init];
        unshelved_books = [Shelf new];
        [unshelved_books setSection: @"Unshelved Books"];
        [self addShelf: unshelved_books];
    }
    
    return self;
}

-(Library*) initWithShelfNames: (NSArray*) names {
    self = [super init];
    if (self) {
        int namesCount = (int)[names count];
        for (int i=0; i<namesCount; i++ ){
            Shelf *temp = [Shelf new];
            [temp setSection: [names objectAtIndex: i]];
            [self addShelf: temp];
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

-(void) addShelf: (Shelf*) theShelf {
    [shelves addObject: theShelf];
    [theShelf setLocation: self];
    
}

-(void) removeShelf: (Shelf*) theShelf {
    if ( [shelves containsObject: theShelf]) {
        NSArray *booksRemoved = [theShelf getBooks];
        for (Book *removedBook in booksRemoved) {
            [removedBook enShelf: unshelved_books];
        }
        [shelves removeObject: theShelf];
        [theShelf setLocation:NULL];
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

-(NSArray*) getunShelvedBooks {
    NSMutableArray *allBooks = [[NSMutableArray alloc] init];
    for (Shelf *noShelf in unshelved_books) {
        [allBooks addObjectsFromArray: [noShelf getBooks]];
    }
    NSArray *arr = [allBooks copy];
    return arr;
}


@end
