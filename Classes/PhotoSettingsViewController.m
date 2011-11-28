//
//  PhotoSettingsViewController.m
//  phtgrphr
//
//  Created by Sakunthala Panditharatne on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoSettingsViewController.h"
#import "ASIFormDataRequest.h"

@implementation PhotoSettingsViewController
@synthesize imgSelected;
@synthesize challenge_id;


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
		
	titles = [[NSMutableArray alloc] initWithObjects:@"Add Location", @"Use Licence", nil];
	subtitles = [[NSArray alloc] initWithObjects:@"Location is not needed for this challenge", 
				 @"Creative Commons 3.0 Attribution Licence",nil];
	
	UIBarButtonItem *rButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
							target:self action:@selector(done)];
	self.navigationItem.rightBarButtonItem=rButton;
	[rButton release];
	licence = FALSE;
	
	imageView.image = imgSelected;	
}
-(IBAction)done{
	[self upload];
	[[self parentViewController] dismissModalViewControllerAnimated:YES];
	[[[self parentViewController] parentViewController] dismissModalViewControllerAnimated:NO];
	[[self parentViewController] release];
};
- (void) upload{
	NSURL *url = [NSURL URLWithString:@"http://stark-stone-8798.herokuapp.com/pictures"];
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	if (imgSelected) {
		NSData *imageData = UIImageJPEGRepresentation(imgSelected, 0.7);
		[request setDelegate:self];
		[request addRequestHeader:@"Accept" value:@"text/plain"];
		[request addData:imageData withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:@"picture[photo]"];
		[request startAsynchronous];
	}
}
- (void)requestFinished:(ASIFormDataRequest *)request
{
	//NSString *responseString = [request responseString];
}
- (void)requestFailed:(ASIFormDataRequest *)request
{
	//NSError *error = [request error];
}

/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Table view data source


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.row ==1) {
		licence = !licence;
	}
	
    // Navigation logic may go here. Create and push another view controller.
    /*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
	 // ...
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	
	[imgSelected release];
	[titles release];
	[subtitles release];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

