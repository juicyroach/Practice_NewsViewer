//
//  NewsViwerDetailControllerViewController.m
//  NewsViwer
//
//  Created by juicyroach on 2017/5/1.
//  Copyright © 2017年 juicyroach. All rights reserved.
//

#import "NewsViwerDetailControllerViewController.h"

@interface NewsViwerDetailControllerViewController ()

@end

@implementation NewsViwerDetailControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"News Detail";
    
    self.newsTitle.text = self.newsModel.title;
    self.publishTime.text = self.newsModel.publishedAt;
    self.descriptionContent.text = self.newsModel.descriptionContent;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.newsModel.urlToImage]]];
    self.newsImage.image=image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
