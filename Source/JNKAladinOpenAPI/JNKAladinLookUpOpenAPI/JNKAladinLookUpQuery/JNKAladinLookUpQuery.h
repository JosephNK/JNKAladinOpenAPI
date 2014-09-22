//
//  JNKAladinLookUpQuery.h
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
//
//  알라딘 도서(상품)
//  http://blog.aladin.co.kr/openapi/5353294

#import <Foundation/Foundation.h>
#import "JNKAladinOpenAPIConf.h"

@interface JNKAladinLookUpQuery : NSObject

/**
 * @brief TTBKey값
 * @see 필수
 * @author
 **/
@property (nonatomic, strong) NSString *TTBKey;

/**
 * @brief 상품을 구분짓는 유일한 값
 * @see 필수 (ItemIdType으로 정수값과 ISBN중에 택일)
 * @author
 **/
@property (nonatomic, strong) NSString *ItemId;

/**
 * @brief 조회용 파라미터인 ItemId가 ISBN으로 입력되었는지, 알라딘고유의"ItemId"값으로 입력되었는지 선택
 * @see ISBN(기본값) : ISBN10자리
        ISBN13 : ISBN13자리
        ItemId
 * @author
 **/
@property (nonatomic, strong) NSString *ItemIdType;

/**
 * @brief 표지크기
 * @see Big : 큰 크기
        Mid(기본값) : 중간 크기
        Small : 작은 크기
        Mini : 매우 작은 크기
        None : 없음
 * @author
 **/
@property (nonatomic, strong) NSString *Cover;

/**
 * @brief 출력방법
 * @see XML(기본값) : REST XML형식
        OS : 확장RSS(OpenSearch방식)
        JS : JSON방식
 * @author
 **/
@property (nonatomic, strong) NSString *Output;

/**
 * @brief 파트너코드. 제휴사의 경우 파트너코드 입력으로 제휴사 유효성 체크.
 * @see 문자
 * @author
 **/
@property (nonatomic, strong) NSString *Partner;

/**
 * @brief Omitkey가 1인경우 결과링크값에 TTBKey가 제외됨.
 * @see 양의정수(기본값:0)
 * @author
 **/
@property (nonatomic) NSInteger Omitkey;

/**
 * @brief 검색API의 Version(날짜형식)을 설정.
 * @see 정수형 날짜(기본값: 20070901)
 * @author
 **/
@property (nonatomic) NSInteger Version;

- (NSURL *)getURLRequestLookUpBase;
- (BOOL)checkSumDefaultParam;

@end