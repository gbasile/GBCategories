//
//  NSString+filename.h
//  Sharit
//
//  Created by Giuseppe Basile on 06/04/12.
//  Copyright (c) 2012 Giuseppe Basile. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FILENAME_RESERVED_CHARS CFSTR("/\\0")

@interface NSString (filename)

//! Encode a string so that is possible to store it into the filesystem
//! @param NSString *the string to encode
//! @return NSString *the encoded string
//! @see http://en.wikipedia.org/wiki/Filename#Reserved_characters_and_words
- (NSString *) stringByEncodingFileName;

//! Decoded a NSString with %code chars
//! Reverse function for + (NSString *) stringByEncodingFileName:(NSString *) fileName
//! @param NSString *the string to decode
//! @return NSString *the decoded string
//! @see http://en.wikipedia.org/wiki/Filename#Reserved_characters_and_words
- (NSString *) stringByDecodingFileName;

@end
