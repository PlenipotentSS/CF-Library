//
//  Library.h
//  Public Library
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
}

-(Library*) initWithShelfNames: (NSArray*) names;
-(void) addShelf: (NSString*) shelfName;
-(void) removeShelf: (Shelf*) theShelf;
-(NSArray*) getShelves;
-(NSArray*) getBooks;

@end
