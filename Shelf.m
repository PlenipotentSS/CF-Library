//
//  Shelf.m
//  Code Fellows Library Assignment
//
//  Created by Steven Stevenson on 11/13/13.
//
//

#import "Shelf.h"
#import "Book.h"
#import "Library.h"

@implementation Shelf

/*
 *  Shelf Constructors
 *
 */

-(id)init {
    self = [super init];
    if (self) {
        book_arr = [[NSMutableArray alloc] init];
        location = NULL;
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

-(void) setLocation: (Library*) loc{
    location = loc;
}

-(BOOL) hasLocation {
    return [location isKindOfClass: [Library class]];
}

- (Library*) getLocation {
    if ( [self hasLocation] ) {
        return location;
    } else {
        return NULL;
    }
}

-(void) setSection: (NSString*) name {
    section = name;
}

-(NSString*) getSection {
    return section;
}

-(void)putBook:(Book*) theBook {
    [book_arr addObject: theBook];
}

-(void) removeBook: (Book*) theBook {
    if ([book_arr containsObject: theBook] ) {
        [book_arr removeObject: theBook];
        if (location) {
            [theBook enShelf: location.unshelved_books];
        }
    }
}

-(void) destroyBook: (Book*) theBook {
    if ([book_arr containsObject: theBook] ) {
        [book_arr removeObject: theBook];
    }
}

-(NSArray*)getBooks {
    NSArray *arr =[book_arr copy];
    return arr;
}

@end
