//
//  NSError+convenience.m
//
//  Created by Giuseppe Basile on 11/05/12.
//  Copyright (c) 2012 Sharit. All rights reserved.
//

#import "NSError+convenience.h"

@implementation NSError (convenience)

+ (NSError *) errorWithError:(NSError *)error domain:(NSString *)newDomain errorCode:(NSInteger)newCode
{
	NSMutableDictionary *userInfoDict = [NSMutableDictionary dictionary];
	[userInfoDict setObject:[error localizedDescription] forKey:NSLocalizedDescriptionKey];
	[userInfoDict setObject:[error localizedFailureReason] forKey:NSLocalizedFailureReasonErrorKey];
	[userInfoDict setObject:[error localizedRecoverySuggestion] forKey:NSLocalizedRecoveryOptionsErrorKey];

	return [NSError errorWithDomain:newDomain code:newCode userInfo:userInfoDict];
}

+ (NSError *) errorWithError:(NSError *)error localizedDescription:(NSString *)localizedString
{
	NSMutableDictionary *userInfoDict = [NSMutableDictionary dictionaryWithDictionary: [error userInfo]];
	[userInfoDict setObject:localizedString forKey:NSLocalizedDescriptionKey];
	return [NSError errorWithDomain:[error domain] code:[error code] userInfo:userInfoDict];
}

@end
