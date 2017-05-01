//
//  NewsModel.h
//  NewsViwer
//
//  Created by juicyroach on 2017/5/1.
//  Copyright © 2017年 juicyroach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

#define AUTHOR @"author"
#define TITLE @"title"
#define DESCRIPTION @"description"
#define URL @"url"
#define URL_TO_IMAGE @"urlToImage"
#define PUBLISHED_AT @"publishedAt"

@property NSString *author;
@property NSString *title;
@property NSString *descriptionContent;
@property NSString *url;
@property NSString *urlToImage;
@property NSString *publishedAt;

-(void)test;

-(NewsModel *) initWithDictionary:(NSDictionary *)datas;

@end
