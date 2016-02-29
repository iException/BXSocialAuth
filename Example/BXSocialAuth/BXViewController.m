//
//  BXViewController.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 02/22/2016.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXViewController.h"
#import <BXSocialAuth/BXSocialAuth+WeChat.h>
#import <BXSocialAuth/BXSocialAuth+Tencent.h>

@interface BXViewController ()

@property (nonatomic) NSArray<NSString *> *providerKeys;

@end


@implementation BXViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"BXSocialAuthDemo";
    self.providerKeys = @[@"WeChat", @"Tencent"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.providerKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.providerKeys[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *providerKey = self.providerKeys[indexPath.row];
    [[BXSocialAuth sharedInstance] authorize:providerKey completion:^(BXSocialAuthResult *result, NSError *error) {
        NSLog(@"Result: %@", result);
    }];
}

@end
