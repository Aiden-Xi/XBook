//
//  PunchCardRecordVC.m
//  YaoYD
//
//  Created by YM on 16/2/23.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "PunchCardRecordVC.h"
#import <MJRefresh.h>
#import "ActivityRecordsCell.h"
#import "AssetsService.h"
#import "UserServiceDTO.h"
@interface PunchCardRecordVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger       _currentPage;
    NSMutableArray  *_dataArray;
    UITableView     *_tableView;
    UIImageView     *_noDataView;
    UILabel *_scoreLabel;
}
@end

@implementation PunchCardRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    [self configUI];
}



/**配置数据*/
- (void)configData{
    _currentPage = 0;
    _dataArray = [NSMutableArray array];
}


/**配置UI*/
- (void)configUI{
    
    [self efSetNavBarTitle:@"打卡积分" textColor:nil];
    //头部
    UIView *topView = [[UIView alloc] init];
    [self.view addSubview:topView];
    topView.backgroundColor = RGBCOLOR(228, 228, 228);
    WeakSelf(weakSelf);
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).with.offset(64);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(@50);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [topView addSubview:titleLabel];
    titleLabel.textColor = RGBCOLOR(51, 51, 51);
    titleLabel.text = @"当前积分：";
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.left.equalTo(topView).with.offset(20);
        make.height.mas_equalTo(@20);
        make.width.mas_equalTo(@75);
    }];
    
    _scoreLabel = [[UILabel alloc] init];
    [topView addSubview:_scoreLabel];
    _scoreLabel.textColor = RGBCOLOR(255, 102, 51);
    _scoreLabel.text = [UserServiceDTO shareInstance].currentUser.mark?:@"0";
    _scoreLabel.font = [UIFont systemFontOfSize:18];
    [_scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(titleLabel.mas_centerY);
        make.left.mas_equalTo(titleLabel.mas_right).with.offset(10);
        make.height.mas_equalTo(titleLabel.mas_height);
        make.right.equalTo(topView);
    }];
    
    //tableView
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view);
    }];
    _tableView.delegate = self;
    _tableView.dataSource =  self;
    _tableView.rowHeight = 84;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = RGBCOLOR(248, 248, 248);
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    [_tableView registerNib:[UINib nibWithNibName:@"ActivityRecordsCell" bundle:nil] forCellReuseIdentifier:@"ActivityRecordsCell"];
    [_tableView.header beginRefreshing];
    
    
    
    _noDataView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageIconNoData]];
    _noDataView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:_noDataView];
    [_noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(64+50, 0, 0, 0));
    }];

}

#pragma mark -TableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityRecordsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityRecordsCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row < _dataArray.count) {
        [cell feedPunchCardWithModel:_dataArray[indexPath.row]];
        if (indexPath.row == _dataArray.count-1) {
            [cell setLastCell];
        }
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    _noDataView.hidden = _dataArray.count >0;
    return _dataArray.count;
}



#pragma mark - Request

- (void)requsetForActivityRecords{
    [[TJProgressHud shareInstance]showProgressView:@"加载数据..."];
    WeakSelf(weakSelf);
    [AssetsService searchPunchCardWithPage:_currentPage complite:^(BOOL success, OrdersIntegralDTO *response, NSString *errMsg) {
        [[TJProgressHud shareInstance] removeSVProgress];
        if (success) {
            [weakSelf updateView:response];
        }else{
            [TJToastView showWithText:errMsg];
        }
    }];
}

- (void)refresh{
    _currentPage = 0;
    [self requsetForActivityRecords];
}

- (void)loadMore{
    _currentPage ++;
    [self requsetForActivityRecords];
}

- (void)updateView:(OrdersIntegralDTO *)model{
    if (_currentPage == 0) {
        [_dataArray removeAllObjects];
    }
    [_dataArray addObjectsFromArray:model.content];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView reloadData];
        [_tableView.header endRefreshing];
        _scoreLabel.text = model.total_integral;
        if (model.content.count == 0) {
            [_tableView.footer noticeNoMoreData];
        }else{
            [_tableView.footer endRefreshing];
        }
    });
}


@end
