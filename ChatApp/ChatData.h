//
//  ChatData.h
//  ChatApp
//
//  Created by dedam on 27/1/17.
//  Copyright © 2017 dedam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum{
    ChatData_Message = 0,
    ChatData_Image,
    ChatData_None
}ChatDataType;



@interface ChatData : NSObject
{}

@property (nonatomic, assign) ChatDataType   m_eChatDataType;
@property (nonatomic, copy) NSString* m_sMessage;
@property (nonatomic, copy) UIImage*  m_Image;
@property (nonatomic, assign) BOOL    m_bIsMine;

@end
