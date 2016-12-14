//
//  ViewController.m
//  MakerCycleViewDemo
//
//  Created by maker on 2016/12/7.
//  Copyright © 2016年 maker. All rights reserved.
//

#import "ViewController.h"
#import "MakerCycleView.h"

@interface ViewController ()
@property(nonatomic,strong)MakerCycleView *cycleView; //轮播图
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MakerCycleView *cycleView = [MakerCycleView getMakerCycleView];
    self.cycleView = cycleView;
    [self.view addSubview:cycleView];
    cycleView.frame = CGRectMake(0, 20, self.view.bounds.size.width, 200);
    
    //设置数据
    NSArray* images = @[@"http://img.hb.aicdn.com/bb048eea72fa6b1d304befec7bdf37dfffde3384dc97-RzQTGC_fw658",@"http://img.hb.aicdn.com/4b13a5f9292d2ba17fee7711f0c73eb87bf925e3ad3d3-frBIlI_fw658",@"http://img.hb.aicdn.com/bc53b7a59bde555a448552b907e7d6c3995cadd2a0b3d-v7dtwS_fw658"];
    cycleView.imageUrls = images;
    
}


@end
