//
//  NSManagedObject+toDictionary.h
//
//  Created by Giuseppe Basile on 30/03/12.
//  Copyright (c) 2012 Giuseppe Basile. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (toDictionary)

//! UNTESTED!
//! Create an NSDictionary representation of the NSManagedObject. 
//! It create all the attributes, relationship and store the class
//! of each NSManagedObject inside the @"class" key
- (NSDictionary *) toDictionary;

@end
