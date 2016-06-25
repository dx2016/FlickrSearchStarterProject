//
//  Created by Colin Eberhardt on 13/04/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RWTFlickrSearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *searchHistoryTable;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@property (weak, nonatomic) RWTFlickrSearchViewModel *viewModel;

@end

@implementation RWTFlickrSearchViewController

- (instancetype)initWithViewModel:(RWTFlickrSearchViewModel *)viewModel {
    self = [super init];
    if (self ) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.edgesForExtendedLayout = UIRectEdgeNone;
  
  self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
  
    [self bindViewModel];
}

- (void)bindViewModel{
    self.title = self.viewModel.title;
//    self.searchTextField.text = self.viewModel.searchText;
    RAC(self.viewModel, searchText) = self.searchTextField.rac_textSignal;

    self.searchButton.rac_command = self.viewModel.excuteSearch;
    
    // 将 通过绑定UIApplication的networkActivityIndicatorVisible属性 以执行信号
    // 确保每次执行命令，小菊花在状态栏上显示
    RAC([UIApplication sharedApplication],networkActivityIndicatorVisible) =  self.viewModel.excuteSearch.executing;
    
    
    // 当执行命令时，加载指示器应该隐藏 这和你刚刚绑定的属性相反
    // 幸运的是 ReactiveCocoa没有在这里覆盖操作，那么可以反转信号。
    RAC(self.loadingIndicator,hidden) = [self.viewModel.excuteSearch.executing not];
    
    
    // 隐藏键盘的信号
    // executionSignals 属性发出的信号，生成每次执行的命令。 这个属性是一个信号的信号。 当创建一个新的命令执行信号发出，将键盘隐藏
    [self.viewModel.excuteSearch.executionSignals subscribeNext:^(id x) {
        [self.searchTextField resignFirstResponder];
    }];
    
    
}


@end
