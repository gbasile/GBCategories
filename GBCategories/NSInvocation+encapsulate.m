//
//  NSInvocation+encapsulate.m
//
//  Created by Giuseppe Basile on 07/05/12.
//  Copyright (c) 2012 Archy. All rights reserved.
//

#import "NSInvocation+encapsulate.h"

@interface NSInvocation (PrivateMethods)
+ (void) _encapsulateInvocation:(NSInvocation *)firstInvocation
				 withInvocation:(NSInvocation *)secondInvocation
					  paramater:(NSDictionary *)params;
@end

@implementation NSInvocation (encapsulate)

+ (NSInvocation *) invocationForSelector:(SEL) selector target:(id) object
{
	NSMethodSignature *signature = [object methodSignatureForSelector:selector];
	NSInvocation *callbackInvocation = [NSInvocation invocationWithMethodSignature:signature];
	[callbackInvocation setSelector:selector];
	[callbackInvocation setTarget:object];
	[callbackInvocation retainArguments];
	
	return callbackInvocation;
}

+ (NSInvocation *) invocationWithInvocation: (NSInvocation *) firstInvocation
							  andInvocation: (NSInvocation *) secondInvocation
								 parameters: (id) parameters
						customEncapsulation: (NSInvocation *) customInvokeEncapsulation

{
	if (nil == customInvokeEncapsulation )
	{
		customInvokeEncapsulation = [NSInvocation invocationForSelector:@selector(_encapsulateInvocation:withInvocation:paramater:) 
																 target:[NSInvocation class]];
	}
	
	//Retain each argument in order to ensure their existence.
	// Be careful! We don't need to explicity release the arguments, it will be done automatically.
	//! @see http://www.cocoabuilder.com/archive/cocoa/241994-surprise-nsinvocation-retainarguments-also-autoreleases-them.html
	[customInvokeEncapsulation retainArguments];
	
	[customInvokeEncapsulation setArgument:&firstInvocation atIndex:2];
	[customInvokeEncapsulation setArgument:&secondInvocation atIndex:3];
	[customInvokeEncapsulation setArgument:&parameters atIndex:4];
	
	return customInvokeEncapsulation;
}

#pragma Private Methods

+ (void)_encapsulateInvocation: (NSInvocation *) firstInvocation
				withInvocation: (NSInvocation *) secondInvocation
					 paramater: (NSDictionary *) parameter
{
	id newParams;
	
	[firstInvocation setArgument:&parameter atIndex:2];
	[firstInvocation invoke];
	
	[firstInvocation getReturnValue: &newParams];
	
	//Bind new Params
	[secondInvocation setArgument:&newParams atIndex:2];
	[secondInvocation invoke];
}

+ (NSString *) ciao
{
	return [NSString string];
}

@end
