//
//  NewsModel.m
//  NewsViwer
//
//  Created by juicyroach on 2017/5/1.
//  Copyright © 2017年 juicyroach. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

@synthesize author;
@synthesize title;
@synthesize descriptionContent;
@synthesize url;
@synthesize urlToImage;
@synthesize publishedAt;


-(void)test {
    NSLog(@"juicyroach");
}

-(NewsModel *) initWithDictionary:(NSDictionary *)datas {
    
    self = [super init];
    
    self.author = [datas valueForKey:AUTHOR];
    self.title = [datas valueForKey:TITLE];
    self.descriptionContent = [datas valueForKey:DESCRIPTION];
    self.url = [datas valueForKey:URL];
    self.urlToImage = [datas valueForKey:URL_TO_IMAGE];
    self.publishedAt = [datas valueForKey:PUBLISHED_AT];
    
    return self;
}


@end
