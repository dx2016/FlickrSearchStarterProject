//
//  RWTFlickrSearchViewModel.m
//  RWTFlickrSearch
//
//  Created by Dxue on 16/6/24.
//  Copyright © 2016年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewModel.h"

@interface RWTFlickrSearchViewModel ()

@property (nonatomic, weak) id<RWTViewModelServices> services;

@end

@implementation RWTFlickrSearchViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype) initWithServices:(id<RWTViewModelServices>)services {
    self = [super init];
    if (self) {
        _services = services;
        [self initialize];
    }
    return self;
}

- (void)initialize {
//    self.searchText = @"search text";
    self.title = @"Flickr Search";
    
    RACSignal *signal = [[RACObserve(self, searchText) map:^id(NSString * text) {
        return @(text.length>3);
    }] distinctUntilChanged];
    
    [signal subscribeNext:^(id x) {
        NSLog(@"search text is valid %@", x);
    }];
    
    
    self.excuteSearch = [[RACCommand alloc] initWithEnabled:signal signalBlock:^RACSignal *(id input) {
        
        return  [self executeSearchSignal];

    }];
    
}

- (RACSignal *)executeSearchSignal {
    
    return [[[self.services getFlickrSearchService]
             flickrSearchSignal:self.searchText]
            logAll];

}
@end
