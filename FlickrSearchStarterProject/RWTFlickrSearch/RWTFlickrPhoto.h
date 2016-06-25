//
//  RWTFlickrPhoto.h
//  RWTFlickrSearch
//
//  Created by Dxue on 16/6/25.
//  Copyright © 2016年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWTFlickrPhoto : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSString *identifier;

@end
