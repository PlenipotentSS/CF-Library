//
//  Book.h
//  Public Library
//
//  Created by Steven Stevenson on 11/13/13.
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
-(NSString*) getAuthor;
-(NSString*) getTitle;
-(void) enShelf: (Shelf*) theShelf;
-(Book*) unShelf;

@end
