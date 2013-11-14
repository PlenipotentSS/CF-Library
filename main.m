//
//  main.m
//  Code Fellows Library Assignment
//
//  Main Testing file to confirm Library Object structure behavior
//
//  Created by Steven Stevenson on 11/13/13.
//  Copyright (c) 2013 Steven Stevenson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Library.h"
#import "Shelf.h"
#import "Book.h"


//print books in each category
void booksToConsole (Library *theLibrary) {
    //print books in each category
    NSArray *theShelves = [theLibrary getShelves];
    int numShelves = [theShelves count];
    for (int i=0; i< numShelves; i++ ) {
        if ( (int)[[theLibrary getShelves] count] != 0) {
            Shelf *aShelf = [[theLibrary getShelves] objectAtIndex: i];
            NSLog(@"SECTION HEADER: %@",[aShelf getSection]);
            NSArray *theBooksInAShelf = [aShelf getBooks];
            for (Book *aBook in theBooksInAShelf) {
                NSLog(@"     %@ by: %@",[aBook getTitle], [aBook getAuthor]);
            }
        }
    }
    NSLog(@" ");
}

int main (int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *sectionNames = @[@"Fiction",@"Non-Fiction",@"Children",@"Fantasy",@"Education"];
        NSArray *titles = @[@"Ender's Game", @"Lord of the Rings", @"Steve Jobs", @"Go Dog Go", @"Topics in Mathematical Models", @"Sherlock Homes",@"Charlotte's Web",@"I am Malala",@"The Help",@"Harry Potter"];
        NSArray *authors = @[@"Orson Scott Card",@"J.R.R. Toklien",@"Walter Isaacson",@"P.D. Eastman",@"K.K. Tung",@"Arthur Conan Doyle",@"E.B. White",@"Christina Lamb",@"Kahtryn Stocket",@"J.K. Rowling"];
        
        //create the library with shelves by section names
        NSLog (@"Creating Library with Shelves");
        Library *myLibrary = [[Library new] initWithShelfNames:sectionNames];
        
        //create the books from array
        NSLog(@"Creating Books...");
        NSMutableArray *theBooks = [[NSMutableArray new] init];
        for (int i = 0; i <10; i++ ) {
            Book *thisBook = [[Book new] initWithTitle:[titles objectAtIndex:i] andAuthor:[authors objectAtIndex:i]];
            [theBooks addObject:thisBook];
        }
        
        //add books to shelves
        NSLog (@"Putting Books on Shelves");
        [[theBooks objectAtIndex:0] enShelf:[[myLibrary getShelves] objectAtIndex:3]];
        [[theBooks objectAtIndex:1] enShelf:[[myLibrary getShelves] objectAtIndex:3]];
        [[theBooks objectAtIndex:2] enShelf:[[myLibrary getShelves] objectAtIndex:1]];
        [[theBooks objectAtIndex:3] enShelf:[[myLibrary getShelves] objectAtIndex:2]];
        [[theBooks objectAtIndex:4] enShelf:[[myLibrary getShelves] objectAtIndex:4]];
        [[theBooks objectAtIndex:5] enShelf:[[myLibrary getShelves] objectAtIndex:0]];
        [[theBooks objectAtIndex:6] enShelf:[[myLibrary getShelves] objectAtIndex:2]];
        [[theBooks objectAtIndex:7] enShelf:[[myLibrary getShelves] objectAtIndex:1]];
        [[theBooks objectAtIndex:8] enShelf:[[myLibrary getShelves] objectAtIndex:0]];
        [[theBooks objectAtIndex:9] enShelf:[[myLibrary getShelves] objectAtIndex:3]];
        
        
        
        booksToConsole(myLibrary);
        
        // Remove a few books:
        [[theBooks objectAtIndex: 1] unShelf];
        [[theBooks objectAtIndex: 5] unShelf];
        
        booksToConsole(myLibrary);
        
        // Remove a few books:
        [[theBooks objectAtIndex: 0] unShelf];
        [[theBooks objectAtIndex: 2] unShelf];
        [[theBooks objectAtIndex: 4] unShelf];
        
        booksToConsole(myLibrary);
        
    }
}