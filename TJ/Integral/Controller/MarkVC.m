//
//  MarkVC.m
//  YaoYD
//
//  Created by Tianjian on 16/2/23.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "MarkVC.h"
#import "PunchCardRecordVC.h"
#import "OrderIntegralVC.h"
#import "UserServiceDTO.h"
#import "AssetsService.h"
#import "TJFullScrWebVC.h"
#import "HomeWebVC.h"
#import "IntegralShopStroeVC.h"

@interface MarkVC ()

@property (weak, nonatomic) IBOutlet UIView *evContentView;
@property (weak, nonatomic) IBOutlet UILabel *evlblMark;         //总积分
@property (weak, nonatomic) IBOutlet UILabel *evlblOrderIntegral;//订单积分
@property (weak, nonatomic) IBOutlet UILabel *evlblPunchCard;    //打卡积分
@property (weak, nonatomic) IBOutlet UIButton *evbtnIntegralShopStore;

@end

@implementation MarkVC

#pragma mark -initMethod
- (void)initXibProperty{
    [_evbtnIntegralShopStore setCornerWidthRadius:5];
    [_evContentView setCornerWidthRadius:5];
}
- (void)initBaseDataInfo{
    _evlblOrderIntegral.text = @" ";
    _evlblPunchCard.text     = @" ";
    
    NSString *mark = [UserServiceDTO shareInstance].currentUser.mark==nil?@"0分":[NSString stringWithFormat:@"%@分",[UserServiceDTO shareInstance].currentUser.mark];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:mark];
    [attrString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(mark.length-1, 1)];
    _evlblMark.attributedText = attrString;
    
    [self _efRequestForOrderAndPunchCardIntegral];
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
    
    [self efSetNavBarTitle:@"我的积分" textColor:nil];    
    [self initXibProperty];
    [self initBaseDataInfo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理

#pragma mark -Action Respone
- (IBAction)_efOnClickIntegralShopStrore:(id)sender forEvent:(UIEvent *)event {
    NSLog(@"积分兑换商品");
    IntegralShopStroeVC *integralShopStroeVC = [[IntegralShopStroeVC alloc]init];
    [self.navigationController pushViewController:integralShopStroeVC animated:YES];
    
}

- (IBAction)_efOnClickInstructions:(id)sender forEvent:(UIEvent *)event {
    NSLog(@"积分使用说明");
    HomeWebVC *homeWebVC = [[HomeWebVC alloc]init];
    homeWebVC.openUrl    = [NSString stringWithFormat:@"%@%@",BaseUrlWeixin,kAPI_Wei_CreditsDescription];
    homeWebVC.navTitle   = @"积分说明";
    [self.navigationController pushViewController:homeWebVC animated:YES];
}
/**订单积分*/
- (IBAction)_efOnClickOrderRecord:(id)sender forEvent:(UIEvent *)event {
    NSLog(@"订单积分积分");
    OrderIntegralVC *orderIntegralVC = [OrderIntegralVC new];
    [self.navigationController pushViewController:orderIntegralVC animated:YES];
}
/**打卡积分*/
- (IBAction)_efOnClickPunchRecord:(id)sender forEvent:(UIEvent *)event {
    NSLog(@"打卡积分");
    PunchCardRecordVC *punchCardRecordVC = [PunchCardRecordVC new];
    [self.navigationController pushViewController:punchCardRecordVC animated:YES];
}
#pragma mark -Request

- (void)_efRequestForOrderAndPunchCardIntegral{
    
    WeakSelf(weakSelf)
    [AssetsService searchOrderAndPunchCardIntegralComplite:^(BOOL success, OrderCreaditIntegralDTO *integralDTO) {
        if (success) {
            [weakSelf _efReloadOrderAndPunchCard:integralDTO];
        }
    }];
}
- (void)_efReloadOrderAndPunchCard:(OrderCreaditIntegralDTO*)integralDTO{
    _evlblOrderIntegral.text = integralDTO.order_integral?[NSString stringWithFormat:@"+%@",integralDTO.order_integral]:@"+0";
    _evlblPunchCard.text     = integralDTO.time_integral?[NSString stringWithFormat:@"+%@",integralDTO.time_integral]:@"+0";
}

@end
