//
//  ViewController.m
//  MySafari
//
//  Created by Ronald Hernandez on 3/11/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.activityIndicator.hidesWhenStopped = true;
    self.backButton.alpha = 0.1;
    self.forwardButton.alpha = 0.1;
    self.webView.scrollView.userInteractionEnabled = false;

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:true];

    
}

#pragma mark - UIWebDelegate Protocols

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];


}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];
    self.webView.scrollView.userInteractionEnabled = true;

    if (webView.canGoBack){


    self.backButton.enabled = true;
        self.backButton.alpha = 1.0;
    }else{
        self.backButton.enabled = false;
        self.backButton.alpha = 0.1;
    }

    if (webView.canGoForward) {
        self.forwardButton.enabled = true;
        self.forwardButton.alpha = 1.0;
    } else {
        self.forwardButton.enabled = false;
        self.forwardButton.alpha = 0.1;
    }


}

#pragma mark - UIWTextFieldDelegate Protocols

-(BOOL)textFieldShouldReturn:(UITextField *)textField {

    NSString *tempString = [NSString stringWithFormat:@"http://%@", textField.text];
    NSURL *url = [NSURL URLWithString:tempString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:request];
    [textField resignFirstResponder];

    return true;

}

- (IBAction)OnBackButtonPressed:(id)sender {
    [self.webView goBack];
}

- (IBAction)onForwadButtonPressed:(id)sender {
    [self.webView goForward];

}

- (IBAction)onStopLoadingButtonPressed:(id)sender {
    [self.webView stopLoading];

}

- (IBAction)onReloadbuttonPressed:(id)sender {

    [self.webView reload];
    
}
- (IBAction)commingSoonButtonPressed:(id)sender {

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Coming Soon!"
                                                    message:@"Be Ready!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];


}
@end
