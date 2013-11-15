//
//  Book.m
//  Code Fellows Library Assignment
//
//  Created by Steven Stevenson on 11/13/13.
//
//  Object Book containing Author and, Title,
//  and Location (type Shelf)
//
//

#import "Book.h"
#import "Shelf.h"
#import "Library.h"

@implementation Book

//////////////Book Constructors


-(id)init {
    self = [super init];
    if (self) {
        title = @"";
        author = @"";
        location = nil;
    }
    
    return self;
}

-(Book*) initWithTitle: (NSString*) t {
    self = [super init];
    if (self) {
        [self setTitle: t];
    }
    
    return self;
}

-(Book*) initWithTitle: (NSString*) t andAuthor: (NSString*) a {
    self = [super init];
    if (self) {
        [self setTitle: t setAuthor: a];
    }
    
    return self;
}


////////////// Book Accessors & Mutators


-(void) setTitle: (NSString*) t setAuthor: (NSString*) a {
    title = t;
    author = a;
}

-(void) setTitle: (NSString*) t {
    title = t;
}

-(void) setAuthor: (NSString*) a {
    author = a;
}

-(NSString*) getAuthor {
    return author;
}

-(NSString*) getTitle {
    return title;
}

-(Shelf*) getLocation {
    return location;
}

//////////////Other Book Methods


/*
 *  @param theShelf puts the current Book object in the given Shelf
 *
 *  and updates current location
 */
-(void) enShelf: (Shelf*) theShelf {
    if ( [location.getSection isEqualToString:@"Unshelved Books"]) {
        [location.getLocation.unshelved_books removeBook:self];
    }
    location = theShelf;
    [theShelf putBook: self];
}

/*
 *  removes book from shelf (to be put in Unshelved Books)
 */
-(Book*) unShelf {
    [location removeBook: self];
    return self;
}

/*
 *  removes the current book from shelf and destroys it from any
 *  reference
 */
-(void) destroyBook {
    [location destroyBook:self];
    location = NULL;
}

@end
