#import <Cocoa/Cocoa.h>
#import "xcc_general_include.h"

@interface AppController : NSObject

@property (assign) IBOutlet NSWindow* theWindow;
@property (assign) IBOutlet NSTableView* myTableView;
@property (assign) IBOutlet NSSearchField* mySearchField;

- (IBAction)searchChanged:(id)sender;

@end
