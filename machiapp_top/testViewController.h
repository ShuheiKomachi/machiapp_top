//
//  testViewController.h
//  machiapp_top
//
//  Created by techcamp on 12/09/12.
//  Copyright (c) 2012年 techcamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>


@interface testViewController : UIViewController
 <ABPeoplePickerNavigationControllerDelegate> {
    
}

- (IBAction)sendingEmail:(id)sender;
 
@end
