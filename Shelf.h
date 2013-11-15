//
//  Shelf.h
//  Code Fellows Library Assignment
//
//  Created by Steven Stevenson on 11/13/13.
//
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
-(Book*) removeBook: (Book*) theBook;
-(NSArray*) getBooks;

@end
