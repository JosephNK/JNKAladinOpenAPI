//
//  JNKAladinSearchRequest.h
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

#import <Foundation/Foundation.h>

@class JNKAladinSearchRequest;
typedef id   (^JNKAladinSearchRequestParserHandler) (JNKAladinSearchRequest *request, NSData *responseData);
typedef void (^JNKAladinSearchRequestSuccessHandler)(JNKAladinSearchRequest *request, id items);
typedef void (^JNKAladinSearchRequestErrorHandler)  (JNKAladinSearchRequest *request, NSError *error);

@interface JNKAladinSearchRequest : NSObject

@property (nonatomic) id queryObj;

- (void)requestSearchAPI:(id)queryitem
                 parsing:(JNKAladinSearchRequestParserHandler)parser
                 success:(JNKAladinSearchRequestSuccessHandler)success
                 failure:(JNKAladinSearchRequestErrorHandler)failure;

- (void)requestSearchAPI:(id)queryitem
                   TITLE:(NSString *)title
                 parsing:(JNKAladinSearchRequestParserHandler)parser
                 success:(JNKAladinSearchRequestSuccessHandler)success
                 failure:(JNKAladinSearchRequestErrorHandler)failure;

@end
