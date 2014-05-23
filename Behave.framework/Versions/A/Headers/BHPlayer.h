//
//  BHPlayer.h
//  HelloBehave
//
//  Created by Olivier THIERRY on 15/11/13.
//  Copyright (c) 2013 behave.io. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BHLevel.h"

@interface BHPlayer : NSObject

@property (nonatomic, readonly) NSString   *referenceId;
@property (nonatomic, readonly) NSUInteger points;
@property (nonatomic, readonly) BHLevel    *level;
@property (nonatomic, readonly) NSString   *name;
@property (nonatomic, readonly) NSURL      *pictureURL;

+ (id) playerWithReferenceId:(NSString*)referenceId;

- (id) initWithReferenceId:(NSString*)referenceId;
- (id) initWithPayload:(NSDictionary*)payload;

- (id)   get:(NSString *)traitName;
- (void) set:(NSDictionary*)traits;
- (void) set:(id)value for:(NSString*)trait;

- (void) addIdentity:(NSString*)identity fromProvider:(NSString*)provider;

@end
