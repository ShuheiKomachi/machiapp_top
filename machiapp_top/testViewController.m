//
//  testViewController.m
//  machiapp_top
//
//  Created by techcamp on 12/09/12.
//  Copyright (c) 2012年 techcamp. All rights reserved.
//


#import "testViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>


@interface testViewController ()

@end

@implementation testViewController

- (IBAction)tapAddAddress:(id)sender {
    
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    [self presentModalViewController:picker animated:YES];
    //[picker release];
}

- (void)peoplePickerNavigationControllerDidCancel: (ABPeoplePickerNavigationController *)peoplePicker {
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)peoplePickerNavigationController: (ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    ABMutableMultiValueRef multi = ABRecordCopyValue(person, kABPersonEmailProperty);
    if (ABMultiValueGetCount(multi)>1) {
        // 複数メールアドレスがある
        // メールアドレスのみ表示するようにする
        [peoplePicker setDisplayedProperties:[NSArray arrayWithObject:[NSNumber numberWithInt:kABPersonEmailProperty]]];
        return YES;
    } else {
        // メールアドレスは1件だけ
        NSString* email = (__bridge NSString*)ABMultiValueCopyValueAtIndex(multi, 0);
        NSLog(@"email = %@", email);
        // [email release];
        [self dismissModalViewControllerAnimated:YES];
        return NO;
    }
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    // 選択したメールアドレスを取り出す
    ABMutableMultiValueRef multi = ABRecordCopyValue(person, property);
    CFIndex index = ABMultiValueGetIndexForIdentifier(multi, identifier);
    NSString* email = (__bridge NSString*)ABMultiValueCopyValueAtIndex(multi, index);
    NSLog(@"email = %@", email);
    //[email release];
    
    [self dismissModalViewControllerAnimated:YES];
    return NO;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// ここまでがアドレス帳参照



- (IBAction)sendingEmail:(id)sender {
 	NSURL* mailURL = [NSURL URLWithString: @"mailto:satoko@somedomain.com?subject=My%20Subject&body=bodyStuff"];
	NSLog(@"mailURL: %@", mailURL); //Debug
    [[UIApplication sharedApplication] openURL: mailURL];
}
@end

