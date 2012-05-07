//
//  NSURL+query.m
//
//  Created by Giuseppe Basile on 07/05/12.
//  Copyright (c) 2012 Sharit. All rights reserved.
//

#import "NSURL+query.h"

@implementation NSURL (query)

- (NSURL *)URLByAppendingQueryString:(NSString *)queryString {
    if (![queryString length]) {
        return self;
    }
	
    NSString *URLString = [[NSString alloc] initWithFormat:@"%@%@%@", [self absoluteString],
                           [self query] ? @"&" : @"?", queryString];
    NSURL *theURL = [NSURL URLWithString:URLString];
    [URLString release];
    return theURL;
}

@end
