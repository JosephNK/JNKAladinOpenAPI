//
//  JNKAladinSearchQuery.m
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

#import "JNKAladinSearchQuery.h"
#import "JNKMacro.h"
#import "NSString+JNKAladinURLEncode.h"

@implementation JNKAladinSearchQuery

- (void)dealloc
{
    LLog(@"<dealloc> JNKAladinSearchQuery");
    
    if (_TTBKey)
        JNK_RELEASE(_TTBKey); _TTBKey = nil;
    if (_Query)
        JNK_RELEASE(_Query); _Query = nil;
    if (_QueryType)
        JNK_RELEASE(_QueryType); _QueryType = nil;
    if (_SearchTarget)
        JNK_RELEASE(_SearchTarget); _SearchTarget = nil;
    if (_Sort)
        JNK_RELEASE(_Sort); _Sort = nil;
    if (_Cover)
        JNK_RELEASE(_Cover); _Cover = nil;
    if (_CategoryId)
        JNK_RELEASE(_CategoryId); _CategoryId = nil;
    if (_Output)
        JNK_RELEASE(_Output); _Output = nil;
    if (_InputEncoding)
        JNK_RELEASE(_InputEncoding); _InputEncoding = nil;
    
    JNK_SUPER_DEALLOC();
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _TTBKey = AladinOpenAPITTBKey;
        _Query = nil;
        _QueryType = @"Book";
        _SearchTarget = @"Keyword";
        _Start = 1;
        _MaxResults = 10;
        _Sort = @"accuracy";
        _Cover = @"Mid";
        _CategoryId = 0;
        _Output = @"XML";
        _Partner = nil;
        _Omitkey = 0;
        _InputEncoding = @"utf-8";
        _Version = 20070901;
        _outofStockfilter = 0;
    }
    return self;
}

#pragma mark -
#pragma mark Make URL Method

- (NSString *)getURLRequestBase {
    return [NSString stringWithFormat:@"%@?ttbkey=%@", AladinAPISearchUrl, _TTBKey];
}

- (NSURL *)getURLRequestSearchBase {
    NSMutableString *strRequestURL = [NSMutableString stringWithString:[self getURLRequestBase]];
    
    if (_Query) {
        [strRequestURL appendFormat:@"&Query=%@",
         [NSString URLEncodeWithUnEncodedString:_Query withEncoding:NSUTF8StringEncoding]];
    }
    if (_QueryType) {
        [strRequestURL appendFormat:@"&QueryType=%@",
         [NSString URLEncodeWithUnEncodedString:_QueryType withEncoding:NSUTF8StringEncoding]];
    }
    if (_SearchTarget) {
        [strRequestURL appendFormat:@"&SearchTarget=%@",
         [NSString URLEncodeWithUnEncodedString:_SearchTarget withEncoding:NSUTF8StringEncoding]];
    }
    if (_Start) {
        [strRequestURL appendFormat:@"&Start=%ld", (long)_Start];
    }
    if (_MaxResults) {
        [strRequestURL appendFormat:@"&MaxResults=%ld", (long)_MaxResults];
    }
    if (_Sort) {
        [strRequestURL appendFormat:@"&Sort=%@",
         [NSString URLEncodeWithUnEncodedString:_Sort withEncoding:NSUTF8StringEncoding]];
    }
    if (_CategoryId) {
        [strRequestURL appendFormat:@"&CategoryId=%@", _CategoryId];
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
    if (_InputEncoding) {
        [strRequestURL appendFormat:@"&InputEncoding=%@",
         [NSString URLEncodeWithUnEncodedString:_InputEncoding withEncoding:NSUTF8StringEncoding]];
    }
    if (_Version) {
        [strRequestURL appendFormat:@"&Version=%ld", (long)_Version];
    }
    if (_outofStockfilter) {
        [strRequestURL appendFormat:@"&outofStockfilter=%ld", (long)_outofStockfilter];
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
    
    if (_Query == nil || [_Query isEqualToString:@""]) {
        NSAssert(NO, @"Query 필수값");
    }
    
    return YES;
}

@end
