//
//  HatenaBookmarkSampleAppDelegate.h
//  HatenaBookmarkSample
//
//  Created by 浅野 慧 on 4/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HatenaBookmarkSampleViewController;

@interface HatenaBookmarkSampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HatenaBookmarkSampleViewController *viewController;

@end
