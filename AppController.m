/* 
   Project: IconDrawing

   Author: Graham Lee

   Created: 2021-03-31 18:02:30 +0000 by leeg
   
   Application Controller
*/

#import "AppController.h"

@implementation AppController
{
  NSImage *dockImage;
  NSImageView *dockImageView;
}

+ (void) initialize
{
  NSMutableDictionary *defaults = [NSMutableDictionary dictionary];

  /*
   * Register your app's defaults here by adding objects to the
   * dictionary, eg
   *
   * [defaults setObject:anObject forKey:keyForThatObject];
   *
   */
  
  [[NSUserDefaults standardUserDefaults] registerDefaults: defaults];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id) init
{
  if ((self = [super init]))
    {
      dockImage = [[NSImage alloc] initWithSize:NSMakeSize(64,64)];
      dockImageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0,0,64,64)];
    }
  return self;
}

- (void) dealloc
{
  [dockImage release];
  [dockImageView release];
  [super dealloc];
}

- (void) awakeFromNib
{
}

- (void) applicationDidFinishLaunching: (NSNotification *)aNotif
{
// Uncomment if your application is Renaissance-based
//  [NSBundle loadGSMarkupNamed: @"Main" owner: self];
  [dockImage lockFocus];
  [[NSColor redColor] set];
  NSRectFill(NSMakeRect(0,0,63,63));
  [dockImage unlockFocus];
  [dockImageView setImage:dockImage];
  if ([[NSUserDefaults standardUserDefaults] boolForKey:@"UseIconWindow"])
  {
    [[[NSApp iconWindow] contentView] addSubview:dockImageView];
  }
  else
  {
    [NSApp setApplicationIconImage:dockImage];
  }
}

- (BOOL) applicationShouldTerminate: (id)sender
{
  return YES;
}

- (void) applicationWillTerminate: (NSNotification *)aNotif
{
}

- (BOOL) application: (NSApplication *)application
	    openFile: (NSString *)fileName
{
  return NO;
}

- (void) showPrefPanel: (id)sender
{
}

@end
