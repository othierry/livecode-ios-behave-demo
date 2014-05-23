//
//  BHLevel.h
//  Behave
//
//  Created by Olivier THIERRY on 16/05/14.
//  Copyright (c) 2014 Behave.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHLevel : NSObject

@property (nonatomic, readonly) NSString     *name;
@property (nonatomic, readonly) NSString     *message;
@property (nonatomic, readonly) NSURL        *iconURL;
@property (nonatomic, readonly) NSDictionary *social;
@property (nonatomic, readonly) NSDictionary *localization;
@property (nonatomic, readonly) double        progress;

- (id) initWithPayload:(NSDictionary*)payload;

@end
