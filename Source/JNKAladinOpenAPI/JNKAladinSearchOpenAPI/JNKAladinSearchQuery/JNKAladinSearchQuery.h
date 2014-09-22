//
//  JNKAladinSearchQuery.h
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
//  알라딘 도서(검색)
//  http://blog.aladin.co.kr/openapi/5353290

#import <Foundation/Foundation.h>
#import "JNKAladinOpenAPIConf.h"

@interface JNKAladinSearchQuery : NSObject

/**
* @brief TTBKey값
* @see 필수
* @author
**/
@property (nonatomic, strong) NSString *TTBKey;

/**
 * @brief 검색어
 * @see 필수
 * @author
 **/
@property (nonatomic, strong) NSString *Query;

/**
 * @brief 검색 대상
 * @see Book(기본값) : 도서
        foreign : 외국도서
        Music : 음반
        DVD : DVD
        Beauty : 화장품
        Gift : 기프트
        used : 중고샵(도서/음반/DVD 등)
        Movie : 영화정보
        All : 위의 모든 타겟(몰)
 * @author
 **/
@property (nonatomic, strong) NSString *QueryType;

/**
 * @brief 검색어 종류
 * @see Keyword (기본값) : 제목+저자
        Title : 제목검색
        Author : 저자검색
        Publisher : 출판사검색
 * @author
 **/
@property (nonatomic, strong) NSString *SearchTarget;

/**
 * @brief 검색결과 시작페이지
 * @see 1이상, 양의 정수(기본값:1)
 * @author
 **/
@property (nonatomic) NSInteger Start;

/**
 * @brief 검색결과 한 페이지당 최대 출력 개수
 * @see 1이상 100이하, 양의 정수(기본값:10)
 * @author
 **/
@property (nonatomic) NSInteger MaxResults;

/**
 * @brief 정렬순서
 * @see accuracy : 정확도순(기본값)
        PublishTime : 출간일
        Title : 제목
        SalesPoint : 판매량
        CustomerRating 고객평점
        MyReviewCount :마이리뷰갯수
 * @author
 **/
@property (nonatomic, strong) NSString *Sort;

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
 * @brief 특정 분야로 검색결과를 제한함
 * @see 양의정수 - 분야의 고유 번호(기본값:0, 전체)
        (참고 : 알라딘 모든 분야 카테고리)
 * @author
 **/
@property (nonatomic, strong) NSString *CategoryId;

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
 * @brief 검색어의 인코딩 값을 설정.
 * @see 문자열(인코딩의 영문이름 - 기본값:utf-8) "utf-8"이나 "euc-kr"과 같은 인코딩의 영문이름.
 * @author
 **/
@property (nonatomic, strong) NSString *InputEncoding;

/**
 * @brief 정수형 날짜(기본값: 20070901)
 * @see 검색API의 Version(날짜형식)을 설정.
 * @author
 **/
@property (nonatomic) NSInteger Version;

/**
 * @brief 숫자
 * @see 품절/절판 등 재고 없는 상품 필터링("1"이 제외 필터)
 * @author
 **/
@property (nonatomic) NSInteger outofStockfilter;

- (NSURL *)getURLRequestSearchBase;
- (BOOL)checkSumDefaultParam;

@end
