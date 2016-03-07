//
//  ExChangeRecordsVC.m
//  YaoYD
//
//  Created by Tianjian on 16/3/2.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ExChangeRecordsVC.h"
#import "ExChangeRecordsCell.h"
#import "IntegralService.h"

@interface ExChangeRecordsVC ()
@property (weak, nonatomic) IBOutlet UITableView *evtblList;

@property (strong,nonatomic) NSMutableArray<id> *arrList;
@property (assign,nonatomic) NSInteger currentPage;

@end

static NSString *const CellIndentifier = @"ExChangeRecordsVC";

@implementation ExChangeRecordsVC

#pragma mark -initMethod
- (void)initXibProperty{
    _arrList = [[NSMutableArray alloc]init];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [_evtblList setRowHeight:110];
    [_evtblList registerNib:[UINib nibWithNibName:@"ExChangeRecordsCell" bundle:nil] forCellReuseIdentifier:CellIndentifier];
    _evtblList.header = [MJRefreshNormalHeader     headerWithRefreshingTarget:self refreshingAction:@selector(_efReloadHeader  )];
    _evtblList.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_efReloadMoreData)];
    [_evtblList.header beginRefreshing];
}
- (void)initBaseDataInfo{
}
#pragma mark -Life Cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self efSetNavBarTitle:@"兑换记录" textColor:nil];
    [self initXibProperty];
    [self initBaseDataInfo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrList.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExChangeRecordsCell *cell = (ExChangeRecordsCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    cell.model = nil;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

#pragma mark -Action Respone

#pragma mark -OtherMethod

#pragma mark -Getters and Setters

#pragma mark -Request

- (void)_efReloadHeader{
    _currentPage = 0;
    [self _efRequestForRecoreds];
}
- (void)_efReloadMoreData{
    [self _efRequestForRecoreds];
}
/**兑换记录*/
- (void)_efRequestForRecoreds{
    //兑换记录.....
    [IntegralService searchCouponRecordsWithPage:_currentPage complete:^(BOOL success, id model) {
        
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_currentPage == 0) {
            [_arrList removeAllObjects];
        }
        
        [_arrList addObjectsFromArray:@[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"]];
        _currentPage ++;
        
        [_evtblList.header endRefreshing];
        [_evtblList.footer endRefreshing];
        [_evtblList reloadData];
    });
}

@end
