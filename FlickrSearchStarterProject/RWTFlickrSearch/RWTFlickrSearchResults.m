//
//  RWTFlickrSearchResults.m
//  RWTFlickrSearch
//
//  Created by Dxue on 16/6/25.
//  Copyright © 2016年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchResults.h"

@implementation RWTFlickrSearchResults

- (NSString *)description {
    return [NSString stringWithFormat:@"searchString=%@, totalresults=%lU, photos=%@",
            self.searchString, self.totalResults, self.photos];
}



@end
