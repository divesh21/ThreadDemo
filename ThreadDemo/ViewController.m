//
//  ViewController.m
//  ThreadDemo
//
//  Created by student14 on 22/12/16.
//  Copyright © 2016 Felix-ITs-Divesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)download:(id)sender {
    
    
    NSString *str =@"http://img1.sendscraps.com/se/042/004.jpg";
    
    [_indicator startAnimating];
    
    [NSThread detachNewThreadSelector:@selector(downloadImage:) toTarget:self withObject:str];
    
}

-(void) downloadImage:(NSString *)str
{

    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    
    UIImage *img= [UIImage imageWithData:data];
    
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:img waitUntilDone:YES];

}


-(void) updateUI:(UIImage *)img
{
    _ImageView.image=img;
    [_indicator stopAnimating];

}

@end
