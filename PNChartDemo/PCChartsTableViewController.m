//
//  PCChartsTableViewController.m
//  PNChartDemo
//
//  Created by kevinzhow on 13-12-1.
//  Copyright (c) 2013年 kevinzhow. All rights reserved.
//

#import "PCChartsTableViewController.h"
#import "PNChart/PNChart.h"

@interface PCChartsTableViewController ()

@property (nonatomic) PNRadarChart *radarChart;

@end

@implementation PCChartsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *items = @[[PNRadarChartDataItem dataItemWithValue:2 description:@"In-game Performance 2.0"],
                       [PNRadarChartDataItem dataItemWithValue:4 description:@"Experience\n4.0"],
                       [PNRadarChartDataItem dataItemWithValue:4.8 description:@"Friendly 4.8"],
                       [PNRadarChartDataItem dataItemWithValue:3.0 description:@"Skill\n3.0"],
                       ];

    self.radarChart = [[PNRadarChart alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 140)
                                                    items:items
                                             valueDivider:1.5];
    self.radarChart.maxValue = 5;
    self.radarChart.plotColor = [UIColor colorWithRed:44/255.0 green:2/255.0 blue:150/255.0 alpha:0.54];
    self.radarChart.isLabelTouchable = NO;
    self.radarChart.displayAnimated = NO;
    self.radarChart.fontSize = 12;
    self.radarChart.plotColor = UIColor.clearColor;
    
    // 背景 rgba(50, 42, 255, 1) rgba(105, 46, 242, 1)
    self.radarChart.plotBackColors = [NSMutableArray arrayWithArray:@[(__bridge id)[UIColor colorWithRed:50 / 255.0 green:42 / 255.0 blue:255 / 255.0 alpha:0.54].CGColor, (__bridge id)[UIColor colorWithRed:105 / 255.0 green:46 / 255.0 blue:242 / 255.0 alpha:0.54].CGColor]];
    
    // 边框 rgba(177, 106, 255, 1) rgba(100, 31, 255, 1)
    self.radarChart.plotBorderColors = [NSMutableArray arrayWithArray:@[(__bridge id)[UIColor colorWithRed:100 / 255.0 green:31 / 255.0 blue:255 / 255.0 alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:177 / 255.0 green:106 / 255.0 blue:255 / 255.0 alpha:1].CGColor]];
    
    //   网格线 rgba(79, 78, 96, 1)
    self.radarChart.webColor = [UIColor colorWithRed:79/255.0 green:78/255.0 blue:96/255.0 alpha:0.7];

    // 文字颜色
    self.radarChart.fontColor = UIColor.whiteColor;
    
    [self.radarChart strokeChart];
   
    self.radarChart.backgroundColor = [UIColor colorWithRed:48/255.0 green:47/255.0 blue:61/255.0 alpha:1.0];
    
    
    self.tableView.tableHeaderView = self.radarChart;
}

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    UIViewController * viewController = [segue destinationViewController];

    if ([segue.identifier isEqualToString:@"lineChart"]) {

        //Add line chart

        viewController.title = @"Line Chart";

    } else if ([segue.identifier isEqualToString:@"barChart"])
    {
        //Add bar chart

        viewController.title = @"Bar Chart";
    } else if ([segue.identifier isEqualToString:@"circleChart"])
    {
        //Add circle chart

        viewController.title = @"Circle Chart";

    } else if ([segue.identifier isEqualToString:@"pieChart"])
    {
        //Add pie chart

        viewController.title = @"Pie Chart";
    } else if ([segue.identifier isEqualToString:@"scatterChart"])
    {
        //Add scatter chart
        
        viewController.title = @"Scatter Chart";
    }else if ([segue.identifier isEqualToString:@"radarChart"])
    {
        //Add radar chart
        
        viewController.title = @"Radar Chart";
    }
}

@end
