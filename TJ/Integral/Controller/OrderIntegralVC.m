//
//  OrderIntegralVC.m
//  YaoYD
//
//  Created by Tianjian on 16/2/23.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "OrderIntegralVC.h"
#import "OrderIntegralCell.h"
#import "AssetsService.h"
#import "OrdersIntegralDTO.h"


@interface OrderIntegralVC ()

@property (strong,nonatomic) UITableView *evtblList;

@property (strong,nonatomic) UILabel *evlblIntegralMark;//积分

@property (strong,nonatomic) NSMutableArray<OrdersIntegralSingleDTO*> *arrList;

@property (assign,nonatomic) NSInteger currentPage;

@end

static NSString *const cellIndentifierCell = @"OrderIntegralVC";

@implementation OrderIntegralVC


#pragma mark -initMethod
- (void)initBaseDataInfo{
    _arrList = [NSMutableArray array];
}
- (void)initXibProperty{
    _evtblList = [UITableView emptyPlainType:CGRectZero];
    _evtblList.delegate   = self;
    _evtblList.dataSource = self;
    _evtblList.rowHeight  = 80;
    _evtblList.backgroundColor = color_EEEEE;
    [_evtblList registerNib:[UINib nibWithNibName:@"OrderIntegralCell" bundle:nil] forCellReuseIdentifier:cellIndentifierCell];
    _evtblList.tableFooterView = [UIView new];
    [self.view addSubview:_evtblList];
    _evtblList.sd_layout.spaceToSuperView(UIEdgeInsetsMake(64, 0, 0, 0));
    
    UIView *etTableViewHeader = [UIView new];
    etTableViewHeader.frame = CGRectMake(0, 0, SCREEN_WIDTH, 30);
    etTableViewHeader.backgroundColor = color_EEEEE;
    [_evtblList setTableHeaderView:etTableViewHeader];
    
    NSString *mark = @" ";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:mark];

    
    _evlblIntegralMark = [UILabel new];
    _evlblIntegralMark.backgroundColor = color_EEEEE;
    _evlblIntegralMark.font = [UIFont systemFontOfSize:15];
    _evlblIntegralMark.textColor = color_66666;
    _evlblIntegralMark.frame = CGRectMake(10, 0, SCREEN_WIDTH-20, 30);
    _evlblIntegralMark.attributedText = string;
    [etTableViewHeader addSubview:_evlblIntegralMark];
    
    _evtblList.header = [MJRefreshNormalHeader     headerWithRefreshingTarget:self refreshingAction:@selector(_efReloadHeader)];
    _evtblList.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_efReloadMoreData)];
    [_evtblList.header beginRefreshing];
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
    
    [self efSetNavBarTitle:@"订单积分" textColor:nil];
    [self initBaseDataInfo];
    [self initXibProperty];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrList.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderIntegralCell *cell = (OrderIntegralCell*)[tableView dequeueReusableCellWithIdentifier:cellIndentifierCell];
    cell.model = _arrList[indexPath.row];
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
    [self _efRequestForOrderIntegralList];
}
- (void)_efReloadMoreData{
    [self _efRequestForOrderIntegralList];
}
/**请求列表数据*/
- (void)_efRequestForOrderIntegralList{
    
    __weak typeof(self) weakSelf = self;    
    [AssetsService searchOrderIntegralWithPage:_currentPage complite:^(BOOL success,OrdersIntegralDTO *response,NSString *errMsg) {
        if (success) {
            [weakSelf _efUpdateListData:response];
        } else {
            NSLog(@"errMsg = %@",errMsg);
        }
    }];
}
- (void)_efUpdateListData:(OrdersIntegralDTO*)DataDTO{
    if (_currentPage == 0) {
        NSString *mark =DataDTO.total_integral?[NSString stringWithFormat:@"当前积分：  %@",DataDTO.total_integral]:@"当前积分：  0";
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:mark];
        [string setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],
                                NSForegroundColorAttributeName:[UIColor redColor]}
                        range:NSMakeRange(5, mark.length-5)];
        _evlblIntegralMark.attributedText = string;
        [_arrList removeAllObjects];
    }
    [_arrList addObjectsFromArray:DataDTO.content];
    
    [_evtblList reloadData];
    if (_currentPage == 0) {
        [_evtblList.header endRefreshing];
    } else {
        [_evtblList.footer endRefreshing];
    }
    _currentPage ++;

}


@end
