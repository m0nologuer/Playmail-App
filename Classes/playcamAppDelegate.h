//
//  playcamAppDelegate.h
//  playcam
//
//  Created by Sakunthala Panditharatne on 27/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class playcamViewController;

@interface playcamAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    playcamViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet playcamViewController *viewController;

@end

