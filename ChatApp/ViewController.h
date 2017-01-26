//
//  ViewController.h
//  ChatApp
//
//  Created by dedam on 24/1/17.
//  Copyright © 2017 dedam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *HeaderView;

@property (weak, nonatomic) IBOutlet UIView *ToolBarView;
@property (weak, nonatomic) IBOutlet UITextField *chatField;

@end

