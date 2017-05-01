//
//  NewsViwerDetailControllerViewController.h
//  NewsViwer
//
//  Created by juicyroach on 2017/5/1.
//  Copyright © 2017年 juicyroach. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsViwerDetailControllerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *publishTime;
@property (weak, nonatomic) IBOutlet UITextView *descriptionContent;
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;

@property NewsModel* newsModel;

@end
