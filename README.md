# iOS-clear-all-property-in-class
Objective-C: Clear all property in your class automatically.

This project help you to understand how to reset properties automatically.
Property:
```objc
// -- There are many properies --
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, assign) NSUInteger ident;
@property (nonatomic, strong) NSString *sessionKey;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, assign) NSInteger countScore;
@property (nonatomic, assign) BOOL isSubscriber;
```

Method:
```objc
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
```
Result:
```
---
2017-01-28 23:20:18.845463 Addon_clear-all-property-in-class[2396:909949] [berore]XXXresetProperties => [NSTaggedPointerString] email=user@gmail.com
2017-01-28 23:20:18.845719 Addon_clear-all-property-in-class[2396:909949] [after]XXXresetProperties => [NSTaggedPointerString] email=(null)
---
2017-01-28 23:20:18.846098 Addon_clear-all-property-in-class[2396:909949] [berore]XXXresetProperties => [NSTaggedPointerString] ident=123
2017-01-28 23:20:18.846461 Addon_clear-all-property-in-class[2396:909949] [after]XXXresetProperties => [NSTaggedPointerString] ident=0
---
2017-01-28 23:20:18.846758 Addon_clear-all-property-in-class[2396:909949] [berore]XXXresetProperties => [__NSCFString] sessionKey=xxx-123-324-567-33-45-xb
2017-01-28 23:20:18.846999 Addon_clear-all-property-in-class[2396:909949] [after]XXXresetProperties => [__NSCFString] sessionKey=(null)
---
2017-01-28 23:20:18.847284 Addon_clear-all-property-in-class[2396:909949] [berore]XXXresetProperties => [NSTaggedPointerString] token=24325436547653457696787657635443
2017-01-28 23:20:18.847452 Addon_clear-all-property-in-class[2396:909949] [after]XXXresetProperties => [NSTaggedPointerString] token=(null)
---
2017-01-28 23:20:18.847751 Addon_clear-all-property-in-class[2396:909949] [berore]XXXresetProperties => [NSTaggedPointerString] countScore=345
2017-01-28 23:20:18.847964 Addon_clear-all-property-in-class[2396:909949] [after]XXXresetProperties => [NSTaggedPointerString] countScore=0
---
2017-01-28 23:20:18.848364 Addon_clear-all-property-in-class[2396:909949] [berore]XXXresetProperties => [__NSCFString] isSubscriber=1
2017-01-28 23:20:18.848617 Addon_clear-all-property-in-class[2396:909949] [after]XXXresetProperties => [__NSCFString] isSubscriber=0
---
```
