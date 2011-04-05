//
//  HatenaBookmarkSampleViewController.m
//  HatenaBookmarkSample
//
//  Created by 浅野 慧 on 4/1/11.
//  Copyright 2011 Hatena Co, Ltd. All rights reserved.
//

#import "HatenaBookmarkSampleViewController.h"
#import "NSString+URLEncoding.h"


#define HATENA_BOOKMARK_APP_STORE_URL @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=354976659"

@interface HatenaBookmarkSampleViewController ()
-(void)openHatenaBookmarkApp:(NSURL *)url;
-(void)openAppStore;
-(void)loadWebPage;
@end

@implementation HatenaBookmarkSampleViewController
@synthesize webView;
@synthesize urlTextField;

#pragma mark HatenaBookmarkApp

-(void)openHatenaBookmarkApp:(NSURL *)URL {
    NSURL *appURL = [NSURL URLWithString:
                        [NSString stringWithFormat:@"hatenabookmark:/entry?url=%@&backurl=%@&backtitle=%@",
                         [[URL absoluteString] stringByURLEncoding:NSUTF8StringEncoding], 
                         [@"hatenabookmarksample:/" stringByURLEncoding:NSUTF8StringEncoding], 
                         [@"はてなブックマークサンプル" stringByURLEncoding:NSUTF8StringEncoding]]
                     ];
    if ([[UIApplication sharedApplication] canOpenURL:appURL]) {
        [[UIApplication sharedApplication] openURL:appURL];
    }
    else {
        UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:@"はてなブックマークがインストールされていません" message:@"AppStoreからはてなブックマークをインストールしますか?" delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil] autorelease];
        [alertView show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 1:
            [self openAppStore];
            break;
        default:
            break;
    }
}

-(void)openAppStore {
    NSURL *appStoreURL = [NSURL URLWithString:HATENA_BOOKMARK_APP_STORE_URL];
    [[UIApplication sharedApplication] openURL:appStoreURL];
}

#pragma mark ViewControllerAction

-(IBAction)hatenaBookmarkButtonPushed:(id)sender {
    [self openHatenaBookmarkApp:[webView.request URL]];
}

-(void)loadWebPage {
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:urlTextField.text]];
    [webView loadRequest:req];
}

#pragma mark -
#pragma mark ViewLifecycleManagement

- (void)dealloc
{
    [webView release]; webView = nil;
    [urlTextField release]; urlTextField = nil;
    [super dealloc];
}

-(void)viewDidLoad {
    [self loadWebPage];
    [super viewDidLoad];
}

- (void)viewDidUnload {
    self.webView = nil;
    self.urlTextField = nil;
    [super viewDidUnload];
}

#pragma mark -
#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        urlTextField.text = [[request URL] absoluteString];
    }
    return YES;
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self loadWebPage];
    return YES;
}


@end
