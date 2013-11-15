//
//  Shelf.h
//  Code Fellows Library Assignment
//
//  Created by Steven Stevenson on 11/13/13.
//
//  Object Shelf containing Section Name,
//  list of Books (type Book),
//  and location of Shelf (type Library)
//

#import <Foundation/Foundation.h>
@class Book;
@class Library;

@interface Shelf : NSObject {
    NSMutableArray *book_arr;
    NSString *section;
    Library *location;
}

-(Shelf*) initWithSectionName: (NSString*) name;
-(void) setLocation: (Library*) loc;
-(Library*) getLocation;
-(void) setSection: (NSString*) name;
-(NSString*) getSection;
-(void) putBook: (Book*) theBook;
-(void) removeBook: (Book*) theBook;
-(void) destroyBook: (Book*) theBook;
-(NSArray*) getBooks;

@end
