//  Created by 凤梨 on 17/3/1.
//  Copyright © 2017年 2dfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHSplitCellProtocol.h"

@class DHSplitCellBaseModel;


/**
 绑定cellType与cell，业务方需继承此类
 */
@interface DHSplitCellDispatch : NSObject

- (NSDictionary *)configureCellTypeDictionary;


/**
 业务方bundle
 */
- (NSString *)configureBundleName;


/**
 传入业务方tableView，完成cell注册
 */
- (void)registerTableViewCellsWithTableView:(UITableView *)tableView;


/**
 业务方在UITableView的代理方法cellForRowAtIndexPath中调用
 */
- (UITableViewCell<DHSplitCellProtocol> *)cellWithTableView:(UITableView *)tableView
                                                  cellModel:(DHSplitCellBaseModel *)cellModel
                                          andDelegateObject:(id)delegateObject;

/**
 使用自动布局计算高度
 */
- (CGFloat)getCellHeightWithTableView:(UITableView *)tableView
                         andCellModel:(DHSplitCellBaseModel *)cellModel;

@end
