//  Created by 凤梨 on 17/3/1.
//  Copyright © 2017年 2dfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHSplitCellBaseModel.h"

@protocol DHSplitCellProtocol <NSObject>

@required

- (void)updateCell:(DHSplitCellBaseModel *)cellModel;


@optional

- (void)configureCellDelegateWithDelegateObject:(id)delegateObject;

- (CGFloat)getCellHeightByFrameLayout;

- (void)respondsToCellSelect;

@end
