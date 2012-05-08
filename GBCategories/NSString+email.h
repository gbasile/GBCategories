//
//  NSString+email.h
//  Giuseppe Basile
//
//  Created by Giuseppe Basile on 08/05/12.
//  Copyright (c) 2012 Sharit. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MAIL_ADDRESS_REG_EXP @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

@interface NSString (email)

//! Check if the mail address is valid
//! @param mailAddress	The email address to test
//! @return BOOL
- (BOOL) isValidMailAddress;

@end
