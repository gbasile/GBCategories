//
//  NSString+filename.m
//  Sharit
//
//  Created by Giuseppe Basile on 06/04/12.
//  Copyright (c) 2012 Giuseppe Basile. All rights reserved.
//

#import "NSString+filename.h"

@implementation NSString (filename)

//! Encode a string so that is possible to store it into the filesystem
//! @param NSString *the string to encode
//! @return NSString *the encoded string
//! @see http://en.wikipedia.org/wiki/Filename#Reserved_characters_and_words
- (NSString *) stringByEncodingFileName
{
	if (!self || ![self length]) {
		return nil;
	}
	
	if (self.length >= 256) {
		self = [self substringToIndex: 250];
	}
	return [(NSString *)CFURLCreateStringByAddingPercentEscapes( NULL,
																(CFStringRef) self,
																(CFSTR(" ")),
																FILENAME_RESERVED_CHARS,
																kCFStringEncodingUTF8 
																) autorelease];
}

- (NSString *) stringByDecodingFileName
{
	if (!self || ![self length]) {
		return nil;
	}
	
	return [(NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding ( NULL,
																				  (CFStringRef)self,
																				  (CFSTR("")),
																				  kCFStringEncodingUTF8
																				  ) autorelease];
}

@end
