//
//  Book.m
//  Public Library
//
//  Created by Steven Stevenson on 11/13/13.
//
//

#import "Book.h"
#import "Shelf.h"

@implementation Book

/*
 *  Book Constructors
 *
 */

-(id)init {
    self = [super init];
    if (self) {
        title = @"";
        author = @"";
        location = Nil;
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

/*
 *  Book Accessors & Mutators
 *
 */

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


/*
 *  Other Book Methods
 *
 */

-(void) enShelf: (Shelf*) theShelf {
    location = theShelf;
    [theShelf putBook: self];
}

-(Book*) unShelf {
    [location removeBook: self];
    location = Nil;
    return self;
}

@end
