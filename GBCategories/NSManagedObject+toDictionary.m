//
//  NSManagedObject+toDictionary.m
//
//  Created by Giuseppe Basile on 30/03/12.
//  Copyright (c) 2012 Giuseppe Basile. All rights reserved.
//

#import "NSManagedObject+toDictionary.h"

@implementation NSManagedObject (toDictionary)

- (NSDictionary *) toDictionary
{
	NSMutableSet *visited = [NSMutableSet set];
	NSMutableArray *toVisit = [NSMutableArray arrayWithObject: self];
	NSMutableDictionary* dict = [NSMutableDictionary dictionary];
	
	while ([toVisit count]) {
		id currentObject = [toVisit objectAtIndex: 0];						// Take element toVisit
		[toVisit removeObjectAtIndex: 0];									// Pop element from the Stack
		[visited addObject: currentObject];									// Mark this entity as visited
		
		[dict setObject:[[self class] description] forKey:@"class"];		// Set Class Name
	
		NSArray* attributes = [[[self entity] attributesByName] allKeys];	// Fill attributes
		for (NSString* attr in attributes) {
			NSObject* value = [self valueForKey:attr];
			
			if (value != nil) {
				[dict setObject:value forKey:attr];
			}
		}
		
		// Add entities from relationship
		NSArray* relationships = [[[self entity] relationshipsByName] allKeys];
		[relationships enumerateObjectsUsingBlock: ^(id aRelationship, NSUInteger anIndex, BOOL *outStop) 
		 {		
			 NSObject* value = [self valueForKey: aRelationship];
			 if ([value isKindOfClass:[NSSet class]]) {						// To-many relationship
				 
				 NSSet* relatedObjects = (NSSet*) value;
				 NSMutableSet* dictRels = [NSMutableSet setWithCapacity:[relatedObjects count]];
				 
				 for (NSManagedObject* relatedObject in relatedObjects) {
					 if (![visited containsObject: aRelationship]) {
						 [toVisit addObject: aRelationship];				// Add object to visit
					 }
					 [dictRels addObject:[relatedObject toDictionary]];
				 }
				 
				 [dict setObject:dictRels forKey:aRelationship];
			 }
			 else if ([value isKindOfClass:[NSManagedObject class]]) {
				 NSManagedObject* relatedObject = (NSManagedObject*) value;	// To-one relationship
				 
				 // Call toDictionary on the referenced object and put the result back into our dictionary.
				 [dict setObject:[relatedObject toDictionary] forKey:aRelationship];
				 
				 if (![visited containsObject: aRelationship]) {
					 [toVisit addObject: aRelationship]; 
				 }
			 }
		 }];
	}
	return dict;
}
@end
