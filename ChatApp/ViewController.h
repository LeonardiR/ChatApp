//
//  ViewController.h
//  ChatApp
//
//  Created by dedam on 24/1/17.
//  Copyright © 2017 dedam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ChatData.h"


@interface ViewController : UIViewController <UIActionSheetDelegate ,UIImagePickerControllerDelegate,
UINavigationControllerDelegate>
{
UIAlertController*  actionSheet;
UIImagePickerController  *m_ImgPicker;
}
@property (strong, nonatomic) ChatData *ChatData;
@property (weak, nonatomic) IBOutlet UIView *HeaderView;
@property (weak, nonatomic) IBOutlet UIView *ToolBarView;
@property (weak, nonatomic) IBOutlet UITextField *chatField;
- (IBAction)CameraBtn:(id)sender;
- (IBAction)send:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *TextField;

@end

