//
//  NSInvocation+encapsulate.h
//  Archy
//
//  Created by Giuseppe Basile on 07/05/12.
//  Copyright (c) 2012 Archy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSInvocation (encapsulate)

//! Create an invocation starting from a selector and a target
//! @param selector		The selector used for the invocation
//! @param object		The target used for the invocation
//! @return The NSInvocation created with the provided selector and target
+ (NSInvocation *) invocationForSelector:(SEL) selector target:(id) object;

//! This method encapsulate 2 invocations so that the second is invoked with the return value of the first one
//! If the return value of the 1st invocation can not be directly used as a parameter of the 2nd invocation 
//! you need to specify a custom encapsulation invocation
//! @param firstInvocation		The first invoked invocation 
//! @param secondInvocation		The second invoked invocation
//! @param parameters			The input parameter for the first invocation
//! @param customEncapsulation	(Optional) The invocation used to encapsulate to adapt the output of the 1st invocation as input for the 2nd
//! @return An NSInvocation that encaspule the 1st and 2nd provided encapsulations
+ (NSInvocation *) invocationWithInvocation:(NSInvocation *)firstInvocation
							  andInvocation:(NSInvocation *)secondInvocation
								 parameters:(id)parameters 
						customEncapsulation:(NSInvocation *)customInvokeEncapsulation;

+ (NSString *) ciao;

@end
