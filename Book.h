//
//  Book.h
//  Code Fellows Library Assignment
//
//  Created by Steven Stevenson on 11/13/13.
//
//  Object Book containing Author and, Title,
//  and Location (type Shelf)
//
//

#import <Foundation/Foundation.h>
@class Shelf;

@interface Book : NSObject {
    Shelf *location;
    NSString *title;
    NSString *author;
}

-(Book*) initWithTitle: (NSString*) t;
-(Book*) initWithTitle: (NSString*) t andAuthor: (NSString*) a;
-(void) setTitle: (NSString*) t setAuthor: (NSString*) a;
-(void) setTitle: (NSString*) t;
-(void) setAuthor: (NSString*) a;
-(Shelf*) getLocation;
-(NSString*) getAuthor;
-(NSString*) getTitle;
-(void) enShelf: (Shelf*) theShelf;
-(Book*) unShelf;
-(void) destroyBook;

@end
