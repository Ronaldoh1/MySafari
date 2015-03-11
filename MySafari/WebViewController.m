//
//  ViewController.m
//  MySafari
//
//  Created by Ronald Hernandez on 3/11/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


}



#pragma mark - UIWebDelegate Protocols

-(void)webViewDidStartLoad:(UIWebView *)webView {

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{


}

#pragma mark - UIWTextFieldDelegate Protocols

-(BOOL)textFieldShouldReturn:(UITextField *)textField {

    NSURL *url = [NSURL URLWithString:textField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:request];

    return true;

}




@end
