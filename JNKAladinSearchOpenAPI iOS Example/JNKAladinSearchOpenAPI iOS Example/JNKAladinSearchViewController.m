//
//  JNKAladinSearchViewController.m
//  JNKAladinSearchOpenAPI iOS Example
//
//  Created by Joseph NamKung on 2014. 9. 23..
//  Copyright (c) 2014년 JosephNK. All rights reserved.
//

#import "JNKAladinSearchViewController.h"

#import "JNKAladinSearchOpenAPI.h"
#import "JNKAladinLookUpOpenAPI.h"
#import "UIAlertView+JNKAladinError.h"


@implementation JNKAladinSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    JNKAladinSearchQuery *query = [[JNKAladinSearchQuery alloc] init];
//    JNKAladinSearchRequest *api = [[JNKAladinSearchRequest alloc] init];
//    [api requestSearchAPI:query TITLE:@"삼국지"
//                  parsing:^id(JNKAladinSearchRequest *request, NSData *responseData) {
//                      return responseData;
//                  } success:^(JNKAladinSearchRequest *request, id items) {
//                      
//                  } failure:^(JNKAladinSearchRequest *request, NSError *error) {
//                      
//                  }];
    
    JNKAladinLookUpQuery *query = [[JNKAladinLookUpQuery alloc] init];
    JNKAladinLookUpRequest *api = [[JNKAladinLookUpRequest alloc] init];
    [api requestLookupAPI:query ISBN13:@"9791195149247"
                  parsing:^id(JNKAladinLookUpRequest *request, NSData *responseData) {
                      return responseData;
                  } success:^(JNKAladinLookUpRequest *request, id items) {
                      
                  } failure:^(JNKAladinLookUpRequest *request, NSError *error) {
                      
                  }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
