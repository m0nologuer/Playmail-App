//
//  PhotoSettingsViewController.h
//  phtgrphr1
//
//  Created by Sakunthala Panditharatne on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <coreLocation/CoreLocation.h>


@interface PhotoSettingsViewController : UIViewController {
	NSMutableArray *titles;
	NSArray *subtitles;
	
	UIImage *imgSelected;
	bool licence;
	NSNumber *challenge_id;
	IBOutlet UIImageView *imageView;
}
-(IBAction)done;
-(void)upload;

@property (nonatomic,assign) UIImage *imgSelected;
@property (nonatomic,assign) NSNumber *challenge_id;

@end
