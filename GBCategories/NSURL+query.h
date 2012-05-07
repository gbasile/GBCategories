//
//  NSURL+query.h
//
//  Created by Giuseppe Basile on 07/05/12.
//  Copyright (c) 2012 Sharit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (query)

//! Add a query parameter to the NSURL. 
//! A query is definided in RFC 1808. 
//! Example: www.ipepito.com?myday=23&myMonth=5
//! In this case "myday=23" and "myMonth=5" are both queries.
//! @see http://www.w3.org/Addressing/rfc1808.txt
//! @see http://stackoverflow.com/questions/6309698/objective-c-how-to-add-query-parameter-to-nsurl
- (NSURL *)URLByAppendingQueryString:(NSString *)queryString;
@end
