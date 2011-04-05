//
//  HatenaBookmarkSampleViewController.h
//  HatenaBookmarkSample
//
//  Created by 浅野 慧 on 4/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HatenaBookmarkSampleViewController : UIViewController<UIAlertViewDelegate, UITextFieldDelegate>
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UITextField *urlTextField;
-(IBAction)hatenaBookmarkButtonPushed:(id)sender;
@end
