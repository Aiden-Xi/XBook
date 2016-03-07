//
//  IntegralShopStroeVC.m
//  YaoYD
//
//  Created by Tianjian on 16/3/2.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "IntegralShopStroeVC.h"
#import "ExChangeRecordsVC.h"
#import "IntegralShopStroeCell.h"
#import "IntegralService.h"
#import "IntegralShopStroeHeader.h"
#import "IntegralShopStoreDetailVC.h"

@interface IntegralShopStroeVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *evlblTotleIntegral;
@property (weak, nonatomic) IBOutlet UIButton *evbtnIntegralRecords;
@property (weak, nonatomic) IBOutlet UICollectionView *evcltItem;

@property (strong,nonatomic) NSMutableArray<id> *arrList;
@property (assign,nonatomic) CGSize itemSize;
@property (assign,nonatomic) NSInteger currentPage;

@end

static NSString *const cellIndentifier       = @"IntegralShopStroeVC";
static NSString *const cellIndentifierHeader = @"cellIndentifierHeader";

@implementation IntegralShopStroeVC

#pragma mark -initMethod
- (void)initXibProperty{
    _arrList = [NSMutableArray array];
    _itemSize = CGSizeMake((SCREEN_WIDTH-10*3)*0.5, (SCREEN_WIDTH-10*3)*0.5+50);
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [_evcltItem setBackgroundColor:[UIColor whiteColor]];
    [_evcltItem registerNib:[UINib nibWithNibName:@"IntegralShopStroeCell" bundle:nil]   forCellWithReuseIdentifier:cellIndentifier];
    [_evcltItem registerNib:[UINib nibWithNibName:@"IntegralShopStroeHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cellIndentifierHeader];
    _evcltItem.header = [MJRefreshNormalHeader     headerWithRefreshingTarget:self refreshingAction:@selector(_efReloadBegin) ];
    _evcltItem.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_efReloadFooter)];
    [_evcltItem.header beginRefreshing];
    
    [TJNotificationCenter addObserver:self selector:@selector(_efOnClickGotoIntegralRecords:) name:kNotificationPushIntegralRecord object:nil];
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
    
    [self efSetNavBarTitle:@"积分商城" textColor:nil];
    [self initXibProperty];
    [self initBaseDataInfo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理
//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arrList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    IntegralShopStroeCell *cell = (IntegralShopStroeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    cell.model = nil;
    return cell;
}
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    IntegralShopStroeHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cellIndentifierHeader forIndexPath:indexPath];
    NSString *mark = [UserServiceDTO shareInstance].currentUser.mark==nil?@"0":[NSString stringWithFormat:@"%@",[UserServiceDTO shareInstance].currentUser.mark];
    headerView.numberOfIntegral = mark;
    return headerView;
}
//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return _itemSize;
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, 100);
}
//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    IntegralShopStoreDetailVC *integralShopStoreDetailVC = [[IntegralShopStoreDetailVC alloc]init];
    [self.navigationController pushViewController:integralShopStoreDetailVC animated:YES];
}

#pragma mark -Action Respone
- (void)_efOnClickGotoIntegralRecords:(NSNotification*)sender {
    NSLog(@"积分记录");
    ExChangeRecordsVC *exChangeRecordsVC = [[ExChangeRecordsVC alloc]init];
    [self.navigationController pushViewController:exChangeRecordsVC animated:YES];
}

- (void)_efReloadBegin{
    _currentPage = 0;
    [self _efRequetForCouponListData];
}
- (void)_efReloadFooter{
    [self _efRequetForCouponListData];
}

- (void)_efRequetForCouponListData{
    //积分商城.......
    [IntegralService searchCouponShopWithPage:_currentPage complete:^(BOOL success, id model) {
        
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_currentPage == 0) {
            [_arrList removeAllObjects];
        }
        [_arrList addObjectsFromArray:@[@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5"]];
        _currentPage ++;
        
        [_evcltItem.header endRefreshing];
        [_evcltItem.footer endRefreshing];
        [_evcltItem reloadData];
    });
}

@end
