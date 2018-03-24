//
//  ViewController.m
//  LRQAnimationTest
//
//  Created by lirenqiang on 23/03/2018.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "ViewController.h"
#import <stdlib.h>
#import "LRQAnimationTest-Swift.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *controllers;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.textLabel.text = self.controllers[indexPath.row][@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class vcClass = NSClassFromString(self.controllers[indexPath.row][@"vc"]);
    UIViewController *vc = [vcClass new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [NSMutableArray array];
        [_controllers addObject:@{@"title": @"Cube", @"vc":@"LRQAnimationCubeViewController"}];
        [_controllers addObject:@{@"title": @"CAShapeLayer", @"vc":@"LRQShapeLayerViewController"}];
    }
    return _controllers;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
























