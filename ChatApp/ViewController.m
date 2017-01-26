//
//  ViewController.m
//  ChatApp
//
//  Created by dedam on 24/1/17.
//  Copyright © 2017 dedam. All rights reserved.
//

#import "ViewController.h"
#import "Chat_MyMessage_Cell.h"
#import "Chat_OtherMessage_Cell.h"
#import "Chat_MyImage_Cell.h"
#import "Chat_OtherImage_Cell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _HeaderView.layer.borderColor = [UIColor grayColor].CGColor;
    _HeaderView.layer.borderWidth = 2.0f;
    
    _ToolBarView.layer.borderColor = [UIColor grayColor].CGColor;
    _ToolBarView.layer.borderWidth = 2.0f;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
