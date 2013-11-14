//
//  Library.h
//  Code Fellows Library Assignment
//
//  Created by Steven Stevenson on 11/13/13.
//
//

#import <Foundation/Foundation.h>
@class Shelf;
@class Book;

@interface Library : NSObject {
    NSMutableArray *shelves;
    NSMutableArray *unshelved_books;
    NSString *library_name;
}

-(Library*) initWithShelfNames: (NSArray*) names;
-(void) setLibraryName: (NSString*) name;
-(NSString*) getLibraryName;
-(void) addShelf: (NSString*) shelfName;
-(void) removeShelf: (Shelf*) theShelf;
-(NSArray*) getShelves;
-(NSArray*) getBooks;

@end
