//
//  TOValue.m
//  Tosti
//
//  Copyright (c) 2012 Tosti. All rights reserved.
//

#import "TOValue.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>


#define TOStructReturn(__struct, __prop) if (!strncmp(self.objCType, ("{"#__struct), strlen("{"#__struct))) return TOValueGet(self, __struct).__prop
#define TONamedStructReturn(__name, __struct, __prop) if (!strncmp(self.objCType, ("{"#__name), strlen("{"#__name))) return TOValueGet(self, __struct).__prop


@implementation TOValue {
    NSValue *value;
}


#pragma mark - NSValue Wrap

- (id)initWithBytes:(const void *)bytes objCType:(const char *)type
{
    self = [super init];
    if (self) {
        value = [[NSValue alloc] initWithBytes:bytes objCType:type];
    }
    return self;
}

- (id)initWithPointer:(const void *)pointer objCType:(const char *)type
{
    self = [super init];
    if (self) {
        value = [[NSValue alloc] initWithBytes:&pointer objCType:type];
    }
    return self;
}

- (void)getValue:(void *)bytes
{
    [value getValue:bytes];
}

- (void *)pointerValue
{
    return [value pointerValue];
}

- (const char *)objCType
{
    return [value objCType];
}

- (NSString *)description
{
    return [value description];
}


#pragma mark - Foundation Struct Helpers

- (NSUInteger)length
{
    TONamedStructReturn(_NSRange, NSRange, length);
    return 0;
}

- (NSUInteger)location
{
    TONamedStructReturn(_NSRange, NSRange, location);
    return 0;
}


#pragma mark - Core Graphics Struct Helpers

- (CGPoint)origin
{
    TOStructReturn(CGRect, origin);
    return CGPointZero;
}

- (CGSize)size
{
    TOStructReturn(CGRect, size);
    return CGSizeZero;
}

- (CGFloat)x
{
    TOStructReturn(CGPoint, x);
    return 0.f;
}

- (CGFloat)y
{
    TOStructReturn(CGPoint, y);
    return 0.f;
}

- (CGFloat)width
{
    TOStructReturn(CGSize, width);
    return 0.f;
}

- (CGFloat)height
{
    TOStructReturn(CGSize, height);
    return 0.f;
}

- (CGFloat)top
{
    TOStructReturn(UIEdgeInsets, top);
    return 0.f;
}

- (CGFloat)left
{
    TOStructReturn(UIEdgeInsets, left);
    return 0.f;
}

- (CGFloat)bottom
{
    TOStructReturn(UIEdgeInsets, bottom);
    return 0.f;
}

- (CGFloat)right
{
    TOStructReturn(UIEdgeInsets, right);
    return 0.f;
}

@end
