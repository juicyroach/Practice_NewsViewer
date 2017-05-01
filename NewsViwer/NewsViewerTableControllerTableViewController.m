//
//  NewsViewerTableControllerTableViewController.m
//  NewsViwer
//
//  Created by juicyroach on 2017/5/1.
//  Copyright © 2017年 juicyroach. All rights reserved.
//

#import "NewsViewerTableControllerTableViewController.h"
#import "NewsModel.h"
#import "NewsViwerDetailControllerViewController.h"

@interface NewsViewerTableControllerTableViewController ()

@end

@implementation NewsViewerTableControllerTableViewController

#pragma mark - Porperty rely
- (void)setNewsModels: (NSArray *) newsModels {
    
    _newsModels=newsModels;
    [self.tableView reloadData];
}

#pragma mark - Data control
- (void)fetchNewsData {

    NSURL *url = [NSURL URLWithString:@"https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=5e2df4d0dfe44fcb82c90b8ef9e7dd12"];
    NSData *jsonNewsResult = [NSData dataWithContentsOfURL:url];
    NSError *error = nil;
    #warning  block main queue
    NSDictionary *newsLists=[NSJSONSerialization JSONObjectWithData:jsonNewsResult
                                                           options:0
                                                             error:&error];
    NSMutableArray *news=[[NSMutableArray alloc] init];
    
    for (NSDictionary *obj in [newsLists valueForKeyPath:@"articles"]) {
        NewsModel *newsModel = [[NewsModel alloc] initWithDictionary:obj];
        [news addObject:newsModel];
    }
    self.newsModels=news;
}


#pragma mark - Controller action

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchNewsData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsModels.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    
    NewsModel *newsModel = (NewsModel *)self.newsModels[indexPath.row];
    cell.textLabel.text = newsModel.title;
    cell.detailTextLabel.text = newsModel.descriptionContent;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if ([segue.destinationViewController isKindOfClass:[NewsViwerDetailControllerViewController class]] && [segue.identifier isEqualToString:@"Display News Detail"]) {
        ((NewsViwerDetailControllerViewController *)segue.destinationViewController).newsModel = (NewsModel *)self.newsModels[indexPath.row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
