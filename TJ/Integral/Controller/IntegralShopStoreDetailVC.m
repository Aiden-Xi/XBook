
//
//  IntegralShopStoreDetailVC.m
//  YaoYD
//
//  Created by Tianjian on 16/3/3.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "IntegralShopStoreDetailVC.h"
#import "DetailHeaderCell.h"
#import "DetailFirstCell.h"
#import "DetailOtherCell.h"
#import "NSString+Size.h"

@interface IntegralShopStoreDetailVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *evtblList;
@property (strong,nonatomic) NSMutableArray<NSDictionary*> *arrList;


@end

static NSString *const cellIndentifierHeader = @"cellIndentifierHeader";
static NSString *const cellIndentifierFirst  = @"cellIndentifierFirst";
static NSString *const cellIndentifierOther  = @"cellIndentifierOther";

@implementation IntegralShopStoreDetailVC


#pragma mark -initMethod
- (void)initXibProperty{
    _arrList = [[NSMutableArray alloc]init];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];

    [_evtblList registerNib:[UINib nibWithNibName:@"DetailHeaderCell" bundle:nil] forCellReuseIdentifier:cellIndentifierHeader];
    [_evtblList registerNib:[UINib nibWithNibName:@"DetailFirstCell"  bundle:nil] forCellReuseIdentifier:cellIndentifierFirst ];
    [_evtblList registerNib:[UINib nibWithNibName:@"DetailOtherCell"  bundle:nil] forCellReuseIdentifier:cellIndentifierOther ];
    
    _evtblList.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_efReloadHeader)];
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
    
    [self efSetNavBarTitle:@"商品详情" textColor:nil];
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
    if (indexPath.row == 0) {
        DetailHeaderCell *cell = (DetailHeaderCell*)[tableView dequeueReusableCellWithIdentifier:cellIndentifierHeader];
        cell.imageUrl = @"";
        return cell;
    } else if(indexPath.row == 1){
        DetailFirstCell *cell = (DetailFirstCell*)[tableView dequeueReusableCellWithIdentifier:cellIndentifierFirst];
        cell.model = nil;
        return cell;
    } else {
        DetailOtherCell *cell = (DetailOtherCell*)[tableView dequeueReusableCellWithIdentifier:cellIndentifierOther];
        cell.model = _arrList[indexPath.row];
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return SCREEN_WIDTH*350/750.0;
    } else if(indexPath.row == 1){
        return 110;
    } else {
        NSString *content = _arrList[indexPath.row][@"content"];
        
        return 50+[content heightWithFont:[UIFont systemFontOfSize:15] constrainedToWidth:SCREEN_WIDTH-20];
    }
    return 44;
}

#pragma mark -Action Responegi
- (IBAction)_efOnClickExChange:(id)sender {
    NSLog(@"商品详情");
}

#pragma mark -OtherMethod

#pragma mark -Getters and Setters

#pragma mark -Request

- (void)_efReloadHeader{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_arrList removeAllObjects];
        
        [_arrList addObjectsFromArray:@[@{},
                                        @{},
                                        @{@"title":@"商品说明",@"content":@"兑换的运动豆可在下单时选择运动豆支付。"},
                                        @{@"title":@"兑换步骤",@"content":@"点击[立即兑换],确认后完成兑换过程,运动豆将发放到您的帐户,您可在个人中心－余额中查询。"},
                                        @{@"title":@"注意事项",@"content":@"本活动最终解释权归我要运动所有。"}]];
        
        [_evtblList.header endRefreshing];
        [_evtblList reloadData];
    });
}


@end
