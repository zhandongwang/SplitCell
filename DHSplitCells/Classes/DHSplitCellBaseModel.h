//  Created by 凤梨 on 17/3/1.
//  Copyright © 2017年 2dfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHSplitCellBaseModel : NSObject

@property (nonatomic) CGFloat height;
@property (nonatomic) NSInteger cellType;//一定记得赋值
@property (nonatomic) BOOL cancelCacheHeight; // 取消缓存高度
@end
