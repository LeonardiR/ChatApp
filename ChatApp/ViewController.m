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
{
    NSMutableArray* m_aMessages;
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    m_aMessages = [[NSMutableArray alloc] init];
    
    for (int i= 0; i<4; i++) {
        [m_aMessages addObject:[NSString stringWithFormat:@"kaka%d",i]];
    }

    
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
    if (indexPath.row == 0)
    {
        height = 70.0f;
    }
    
    if (indexPath.row == 1)
    {
        height = 70.0f;
    }

    if (indexPath.row == 2)
    {
        height = 104.0f;
    }

    if (indexPath.row == 3)
    {
        height = 104.0f;
    }

    return height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell_;
    
    
    if (indexPath.row == 0) {
        Chat_MyMessage_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chat_MyMessage_Cell" forIndexPath:indexPath];
        cell_=cell;
    
    }if (indexPath.row == 1) {
        Chat_OtherMessage_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chat_OtherMessage_Cell" forIndexPath:indexPath];
        cell_=cell;
    
    }if (indexPath.row == 2) {
        Chat_MyImage_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chat_MyImage_Cell" forIndexPath:indexPath];
        cell_=cell;
    
    }if (indexPath.row == 3) {
        Chat_OtherImage_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chat_OtherImage_Cell" forIndexPath:indexPath];
        cell_=cell;
    }
    
    return cell_;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
