//
//  RWTFlickrSearchViewModel.h
//  RWTFlickrSearch
//
//  Created by Dxue on 16/6/24.
//  Copyright © 2016年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RWTViewModelServices.h"

@interface RWTFlickrSearchViewModel : NSObject

@property (strong, nonatomic) NSString *searchText;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) RACCommand *excuteSearch;




- (instancetype) initWithServices:(id<RWTViewModelServices>)services;

@end
