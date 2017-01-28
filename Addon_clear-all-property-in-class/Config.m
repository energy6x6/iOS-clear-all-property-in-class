//
//  Config.m
//  Addon_clear-all-property-in-class
//
//  Created by TeamGear66 on 1/28/17.
//  Copyright © 2017 TeamGear. All rights reserved.
//

#import "Config.h"
#import "objc/runtime.h"

@implementation Config

- (instancetype) initWithUserName:(NSString *)username email:(NSString *)email ident:(NSUInteger)ident sessionKey:(NSString *)sessionKey token:(NSString *)token countScore:(NSInteger)countScore isSubscriber:(BOOL)isSubscriber
{
    self = [super init];
    if (self) {
        self.username = username;
        self.email = email;
        self.ident = ident;
        self.sessionKey = sessionKey;
        self.token = token;
        self.countScore = countScore;
        self.isSubscriber = isSubscriber;
    }
    
    return self;
}

- (void) resetProperties {
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            NSString *propertyName = [NSString stringWithCString:propName encoding:[NSString defaultCStringEncoding]];
            
            id value = [self valueForKey:propertyName];
            NSLog(@"[berore]XXXresetProperties => [%@] %@=%@", [propertyName class],propertyName, value);
            
            /* You can add some other checks */
            if ([value isKindOfClass:[NSNumber class]]) {
                [self setValue:[NSNumber numberWithInteger:0] forKeyPath:propertyName];
            }
            if ([value isKindOfClass:[NSString class]]) {
                [self setValue:nil forKeyPath:propertyName];
            }
            if ([value isKindOfClass:[NSDictionary class]]) {
                [self setValue:nil forKeyPath:propertyName];
            }
            
            id valueRes = [self valueForKey:propertyName];
            NSLog(@"[after]XXXresetProperties => [%@] %@=%@\n---\n", [propertyName class],propertyName, valueRes);
        }
    }
    free(properties);
}

@end
