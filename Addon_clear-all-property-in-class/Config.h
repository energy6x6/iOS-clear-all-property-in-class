//
//  Config.h
//  Addon_clear-all-property-in-class
//
//  Created by TeamGear66 on 1/28/17.
//  Copyright © 2017 TeamGear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject

// -- There are many properies --
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, assign) NSUInteger ident;
@property (nonatomic, strong) NSString *sessionKey;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, assign) NSInteger countScore;
@property (nonatomic, assign) BOOL isSubscriber;

- (instancetype) initWithUserName:(NSString *)username email:(NSString *)email ident:(NSUInteger)ident sessionKey:(NSString *)sessionKey token:(NSString *)token countScore:(NSInteger)countScore isSubscriber:(BOOL)isSubscriber;

- (void) resetProperties;

@end
