//
//  ViewController.m
//  MySafari
//
//  Created by Manas Pradhan on 3/12/14.
//  Copyright (c) 2014 Manas Pradhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UITextField *myURLTextField;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *forwardButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (strong, nonatomic) IBOutlet UIButton *reloadButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    textField.text = self.myURLTextField.text;
    NSString *urlString = textField.text;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.myWebView loadRequest:request];
    return YES;
}

- (IBAction)onBackButtonPressed:(id)sender
{
    [self.myWebView goBack];
}

- (IBAction)onForwardButtonPressed:(id)sender
{
    [self.myWebView goForward];
}

- (IBAction)onStopLoadingButtonPressed:(id)sender
{
    [self.myWebView stopLoading];
}

- (IBAction)onReloadButtonPressed:(id)sender
{
    [self.myWebView reload];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (self.myWebView.canGoForward)
    {
        self.forwardButton.enabled = YES;
    }
    if (self.myWebView.canGoBack)
    {
        self.backButton.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
