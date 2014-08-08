/*
 * AppController.j
 * cpsearchfield
 *
 * Created by You on August 8, 2014.
 * Copyright 2014, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
    @outlet CPTableView myTableView;
    @outlet CPSearchField mySearchField;

    CPArray nameArray;
    CPArray searchResultArray;
    CPString searchFieldValue;
    CPPredicate predicate;

}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (id)init
{
    self = [super init];
    if (self)
    {
        nameArray = ["Andy1", "Andy12", "Andy123", "Bjorn","Camille"];
    }
    return self;
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];

    [mySearchField setAction:@selector(searchChanged:)];
    [mySearchField setSendsWholeSearchString: NO];
}

- (int)numberOfRowsInTableView: (CPTableView)aTableView
{
    if ([searchResultArray count] == nil)
        return [nameArray count];
    else
        return [searchResultArray count];
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn: (CPTableColumn)aColumn row:(int)rowIndex
{
    if ([searchResultArray count] == nil)
        return [nameArray objectAtIndex: rowIndex];
    else
        return [searchResultArray objectAtIndex: rowIndex];
}

- (IBAction)searchChanged:(id)sender
{
    searchFieldValue = [mySearchField stringValue];

    if ([searchFieldValue isEqual:@""])
    {
        searchResultArray = nil;
        [myTableView reloadData];
    }
    else {
        predicate = [CPPredicate predicateWithFormat:"SELF CONTAINS [cd] %@", searchFieldValue];
        searchResultArray = [nameArray filteredArrayUsingPredicate: predicate];
        [myTableView reloadData];
    }

}

@end
