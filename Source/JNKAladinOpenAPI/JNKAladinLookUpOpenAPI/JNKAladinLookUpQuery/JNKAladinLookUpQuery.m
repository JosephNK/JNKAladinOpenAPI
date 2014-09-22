//
//  JNKAladinLookUpQuery.m
//
//  Copyright (c) 2014-2014 JNKAladinOpenAPI
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "JNKAladinLookUpQuery.h"
#import "JNKMacro.h"
#import "NSString+JNKAladinURLEncode.h"

@implementation JNKAladinLookUpQuery

- (void)dealloc
{
    LLog(@"<dealloc> JNKAladinProductQuery");
    
    if (_TTBKey)
        JNK_RELEASE(_TTBKey); _TTBKey = nil;
    if (_ItemId)
        JNK_RELEASE(_ItemId); _ItemId = nil;
    if (_ItemIdType)
        JNK_RELEASE(_ItemIdType); _ItemIdType = nil;
    if (_Cover)
        JNK_RELEASE(_Cover); _Cover = nil;
    if (_Output)
        JNK_RELEASE(_Output); _Output = nil;
    if (_Partner)
        JNK_RELEASE(_Partner); _Partner = nil;
    
    JNK_SUPER_DEALLOC();
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _TTBKey = AladinOpenAPITTBKey;
        _ItemId = nil;
        _ItemIdType = @"ISBN";
        _Cover = @"Mid";
        _Output = @"XML";
        _Partner = nil;
        _Omitkey = 0;
        _Version = 20070901;
    }
    return self;
}

#pragma mark -
#pragma mark Make URL Method

- (NSString *)getURLRequestBase {
    return [NSString stringWithFormat:@"%@?ttbkey=%@", AladinAPILookUpUrl, _TTBKey];
}

- (NSURL *)getURLRequestLookUpBase {
    NSMutableString *strRequestURL = [NSMutableString stringWithString:[self getURLRequestBase]];
    
    if (_ItemId) {
        [strRequestURL appendFormat:@"&ItemId=%@",
         [NSString URLEncodeWithUnEncodedString:_ItemId withEncoding:NSUTF8StringEncoding]];
    }
    if (_ItemIdType) {
        [strRequestURL appendFormat:@"&ItemIdType=%@",
         [NSString URLEncodeWithUnEncodedString:_ItemIdType withEncoding:NSUTF8StringEncoding]];
    }
    if (_Cover) {
        [strRequestURL appendFormat:@"&Cover=%@",
         [NSString URLEncodeWithUnEncodedString:_Cover withEncoding:NSUTF8StringEncoding]];
    }
    if (_Output) {
        [strRequestURL appendFormat:@"&Output=%@",
         [NSString URLEncodeWithUnEncodedString:_Output withEncoding:NSUTF8StringEncoding]];
    }
    if (_Partner) {
        [strRequestURL appendFormat:@"&Partner=%@",
         [NSString URLEncodeWithUnEncodedString:_Partner withEncoding:NSUTF8StringEncoding]];
    }
    if (_Omitkey) {
        [strRequestURL appendFormat:@"&Omitkey=%ld", (long)_Omitkey];
    }
    if (_Version) {
        [strRequestURL appendFormat:@"&Version=%ld", (long)_Version];
    }
    
    //NSString *escaped = [strRequestURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return JNK_AUTORELEASE([[NSURL alloc] initWithString:strRequestURL]);
}

#pragma mark -
#pragma mark Helper Method

- (BOOL)checkSumDefaultParam {
    if (_TTBKey == nil || [_TTBKey isEqualToString:@""]) {
        NSAssert(NO, @"Key 필수값");
    }
    
    if (_ItemId == nil || [_ItemId isEqualToString:@""]) {
        NSAssert(NO, @"ItemId 필수값");
    }
    
    return YES;
}

@end
