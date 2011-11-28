//
//  playcamViewController.m
//  playcam
//
//  Created by Sakunthala Panditharatne on 27/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "playcamViewController.h"
#import "PhotoSettingsViewController.h"

@implementation playcamViewController

- (IBAction) openCamera{
	UIImagePickerController* pickerController = [[UIImagePickerController alloc] init];
	pickerController.delegate = self;
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
		pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
	}
	else {
		pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	}
	
	[self presentModalViewController:pickerController animated:YES];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *) Picker {
	
	[[Picker parentViewController] dismissModalViewControllerAnimated:YES];
	[Picker release];
	
}
- (void)imagePickerController:(UIImagePickerController *)Picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	
	PhotoSettingsViewController* more_nav = [[PhotoSettingsViewController alloc] 
											 initWithNibName:@"PhotoSettingsViewController" bundle:nil];
	more_nav.imgSelected = [[info objectForKey:UIImagePickerControllerOriginalImage] retain];
	[Picker pushViewController:more_nav animated:YES];
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
