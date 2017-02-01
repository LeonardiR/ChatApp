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


@interface ViewController ()  {
    NSMutableArray* m_aMessages;
    
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property int actualLastRow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _actualLastRow = 10;
    
    [self initDataChat];
    
    _HeaderView.layer.borderColor = [UIColor grayColor].CGColor;
    _HeaderView.layer.borderWidth = 2.0f;
    _ToolBarView.layer.borderColor = [UIColor grayColor].CGColor;
    _ToolBarView.layer.borderWidth = 2.0f;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return m_aMessages.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = 0.0f;
    ChatData* chatData = m_aMessages[indexPath.row];
    
    switch (chatData.m_eChatDataType) {
        case ChatData_Message:
        {
            height = 70.0f;
        
        }
            break;
        case ChatData_Image:
        {
            height = 104.0f;
        }
            break;
        default:
            break;
    }
    
    return height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell_;
    
      ChatData *chatData = m_aMessages[indexPath.row];
        
        switch (chatData.m_eChatDataType) {
            case ChatData_Message:
            {
                if (chatData.m_bIsMine) {
                    Chat_MyMessage_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chat_MyMessage_Cell" forIndexPath:indexPath];
                    cell.lblMyMsg.text = [NSString stringWithFormat:@"%@", chatData.m_sMessage];
                    cell_=cell;
                    
                }else{
                    Chat_OtherMessage_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chat_OtherMessage_Cell" forIndexPath:indexPath];
                    cell.lblOtherMsg.text = [NSString stringWithFormat:@"%@", chatData.m_sMessage];
                    cell_=cell;
                    
                }
            }
                break;
            case ChatData_Image:
            {
                if (chatData.m_bIsMine) {
                    Chat_MyImage_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chat_MyImage_Cell" forIndexPath:indexPath];
                    cell.MyImage.image = chatData.m_Image;
                    cell_=cell;
                }else{
                    Chat_OtherImage_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chat_OtherImage_Cell" forIndexPath:indexPath];
                    cell.OtherImage.image = chatData.m_Image;
                    cell_=cell;
                    
                }
            }
                break;
            case ChatData_None:
                NSLog(@"Error_ChatRoom:tableView--> chatData with ChatData_None value");
                return nil;
            default:
                break;
        }
    return cell_;
    }

- (void) initDataChat{
    
    ChatData *MyMessage = [[ChatData alloc] init];
    MyMessage.m_sMessage = @"Hola como estas";
    MyMessage.m_bIsMine = true;
    MyMessage.m_eChatDataType = ChatData_Message;
    
    ChatData *OtherMessage = [[ChatData alloc] init];
    OtherMessage.m_sMessage = @"Bien y tu";
    OtherMessage.m_eChatDataType = ChatData_Message;
    
    ChatData *MyMessage2 = [[ChatData alloc] init];
    MyMessage2.m_sMessage = @"Todo Bien";
    MyMessage2.m_bIsMine = true;
    MyMessage2.m_eChatDataType = ChatData_Message;
    
    ChatData *OtherMessage2 = [[ChatData alloc] init];
    OtherMessage2.m_sMessage = @"Mandamemlas la foto del logo de la Caixa";
    OtherMessage2.m_eChatDataType = ChatData_Message;
    
    ChatData *MyImage = [[ChatData alloc] init];
    MyImage.m_Image = [UIImage imageNamed:@"la_caixa_logo.png"];
    MyImage.m_eChatDataType = ChatData_Image;
    
    ChatData *OtherMessage3 = [[ChatData alloc] init];
    OtherMessage3.m_sMessage = @"Y la de la carita feliz";
    OtherMessage3.m_eChatDataType = ChatData_Message;
    
    ChatData *MyImage2 = [[ChatData alloc] init];
    MyImage2.m_Image = [UIImage imageNamed:@"woowos_contact.png"];
    MyImage2.m_bIsMine = true;
    MyImage2.m_eChatDataType = ChatData_Image;
    
    ChatData *OtherMessage4 = [[ChatData alloc] init];
    OtherMessage4.m_sMessage = @"Tambien la del oso";
    OtherMessage4.m_eChatDataType = ChatData_Message;
    
    
    ChatData *MyImage3 = [[ChatData alloc] init];
    MyImage3.m_Image = [UIImage imageNamed:@"company.png"];
    MyImage3.m_eChatDataType = ChatData_Image;
    
    ChatData *MyMessage3 = [[ChatData alloc] init];
    MyMessage3.m_sMessage = @"Mandame tu la imagen de las llaves";
    MyMessage3.m_bIsMine = true;
    MyMessage3.m_eChatDataType = ChatData_Message;
    
    ChatData *OtherImage = [[ChatData alloc] init];
    OtherImage.m_Image = [UIImage imageNamed:@"key.png"];
    OtherImage.m_eChatDataType = ChatData_Image;
    
    m_aMessages = [NSMutableArray arrayWithObjects:MyMessage,OtherMessage,MyMessage2,OtherMessage2,MyImage,OtherMessage3,MyImage2,OtherMessage4,MyImage3,MyMessage3,OtherImage, nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CameraBtn:(id)sender {
    
    actionSheet = [UIAlertController alertControllerWithTitle:@"CAMARA" message:@"Seleccione una opcion" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Galeria" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            if (m_ImgPicker == nil)
                m_ImgPicker = [[UIImagePickerController alloc] init];
            
            m_ImgPicker.allowsEditing = YES;
            m_ImgPicker.delegate = self;
            m_ImgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            [self presentViewController:m_ImgPicker animated:YES completion:nil];
        }

            }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Tomar Foto" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            if (m_ImgPicker == nil)
            {
                m_ImgPicker = [[UIImagePickerController alloc] init];
            }
            m_ImgPicker.allowsEditing = YES;
            m_ImgPicker.delegate = self;
            m_ImgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:m_ImgPicker animated:YES completion:nil];
        }

        }]];
    [self presentViewController:actionSheet animated:YES completion:nil];
}

- (IBAction)send:(id)sender {
    if (_TextField.text && _TextField.text.length > 0){
        ChatData *textEntered = [[ChatData alloc] init];
        textEntered.m_sMessage = [_TextField text];
        textEntered.m_bIsMine=true;
        textEntered.m_eChatDataType = ChatData_Message;
        [m_aMessages addObject:textEntered];
    
        ChatData *textEnteredRes = [[ChatData alloc] init];
        textEnteredRes.m_sMessage = [_TextField text];
        textEnteredRes.m_eChatDataType = ChatData_Message;
        [m_aMessages addObject:textEnteredRes];
        [_TableView reloadData];
        _TextField.text = [NSString stringWithFormat:@""];
        
        _actualLastRow+=2;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_actualLastRow inSection:0];
        [_TableView scrollToRowAtIndexPath:indexPath
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPt = CGPointMake(_TextField.frame.origin.x, _TextField.frame.origin.y);
    [_TableView setContentOffset:scrollPt animated:YES];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
       ChatData *imageEntered = [[ChatData alloc] init];
       imageEntered.m_Image = info[UIImagePickerControllerEditedImage];
       imageEntered.m_bIsMine=true;
       imageEntered.m_eChatDataType= ChatData_Image;
       [m_aMessages addObject:imageEntered];
    
       ChatData *imageEnteredRes = [[ChatData alloc] init];
       imageEnteredRes.m_Image = info[UIImagePickerControllerEditedImage];
       imageEnteredRes.m_eChatDataType= ChatData_Image;
       [m_aMessages addObject:imageEnteredRes];
       [_TableView reloadData];
       [picker dismissViewControllerAnimated:YES completion:NULL];
    
       _actualLastRow+=2;
       NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_actualLastRow inSection:0];
       [_TableView scrollToRowAtIndexPath:indexPath
                      atScrollPosition:UITableViewScrollPositionTop
                              animated:YES];
}
@end
