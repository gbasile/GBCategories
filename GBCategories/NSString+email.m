//
//  NSString+email.m
//  Giuseppe Basile
//
//  Created by Giuseppe Basile on 08/05/12.
//  Copyright (c) 2012 Sharit. All rights reserved.
//

#import "NSString+email.h"

@implementation NSString (email)

- (BOOL) isValidMailAddress
{
    NSString *emailRegex = MAIL_ADDRESS_REG_EXP;   
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];   
    return [emailTest evaluateWithObject: self];  
}

@end
