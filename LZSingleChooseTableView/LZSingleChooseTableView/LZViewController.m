//
//  LZViewController.m
//  LZSingleChooseTableView
//
//  Created by 寕小陌 on 2017/12/19.
//  Copyright © 2017年 寕小陌. All rights reserved.
//

#import "LZViewController.h"

static NSString *identifiter = @"我是一个复用标识";

@interface LZViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSIndexPath *_chooseIndex; // 记录被选中行
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"单选";
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiter forIndexPath:indexPath];
    if (indexPath == _chooseIndex) {
        /* UITableViewCell上的子控件是懒加载机制，只有当cell.accessoryType = UITableViewCellAccessoryCheckmark时，用于标记被选中的button才会创建*/
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        UIButton *checkMark = cell.subviews[2];
        [checkMark setImage:[UIImage imageNamed:@"danxuan_selected"] forState:UIControlStateNormal];
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"TableView单选---%zd", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    _chooseIndex = indexPath; // 记录被选中cell的indexPath，防止复用出现问题
    
    UIButton *checkMark = cell.subviews[2];
    [checkMark setImage:[UIImage imageNamed:@"danxuan_selected"] forState:UIControlStateNormal];
    NSLog(@"选中时：%@", cell.subviews);
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    NSLog(@"未选中时：%@", cell.subviews);
}

- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifiter];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
