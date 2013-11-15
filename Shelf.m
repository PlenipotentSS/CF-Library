//
//  Shelf.m
//  Code Fellows Library Assignment
//
//  Created by Steven Stevenson on 11/13/13.
//
//  Object Shelf containing Section Name,
//  list of Books (type Book),
//  and location of Shelf (type Library)
//

#import "Shelf.h"
#import "Book.h"
#import "Library.h"

@implementation Shelf

//////////////Shelf Constructors
 


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

////////////// Library Accessors & Mutators

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

//////////////Other Shelf Methods

/*
 *  @param theBook put this theBook on this shelf
 *
 */
-(void)putBook:(Book*) theBook {
    [book_arr addObject: theBook];
}

/*
 *  @param theBook remove this theBook from this shelf
 *      and put it in unshelved_books in parent Library
 *
 */
-(void) removeBook: (Book*) theBook {
    if ([book_arr containsObject: theBook]) {
        [book_arr removeObject: theBook];
        if (![self.getSection isEqualToString:@"Unshelved Books"]) {
            [theBook enShelf: location.unshelved_books];
        }
    }
}

/*
 *  @param theBook destroys theBook from any reference
 *
 */
-(void) destroyBook: (Book*) theBook {
    if ([book_arr containsObject: theBook] ) {
        [book_arr removeObject: theBook];
    }
}

/*
 *  returns NSArray of all books on Shelf
 *
 */
-(NSArray*)getBooks {
    NSArray *arr =[book_arr copy];
    return arr;
}

@end
