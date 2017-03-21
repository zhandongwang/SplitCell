//  Created by 凤梨 on 17/3/1.
//  Copyright © 2017年 2dfire. All rights reserved.
//
#import "DHSplitCellDispatch.h"
#import "DHSplitCellBaseModel.h"
#import "DHSplitCellProtocol.h"

@interface DHSplitCellDispatch ()

@property (nonatomic, strong) NSArray *cellNamesArray;
@property (nonatomic, strong) NSDictionary *cellTypeDictionary;
@property (nonatomic, copy) NSString *bundleName;

@end

@implementation DHSplitCellDispatch

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellTypeDictionary = [self configureCellTypeDictionary];
        self.cellNamesArray = self.cellTypeDictionary.allValues;
        self.bundleName = [self configureBundleName];
    }
    return self;
}

- (NSDictionary *)configureCellTypeDictionary
{
    return @{};
}

- (NSString *)configureBundleName
{
    return @"";
}

- (void)registerTableViewCellsWithTableView:(UITableView *)tableView
{
    for (NSString *cellName in self.cellNamesArray) {
        NSBundle *bundle;
        if (self.bundleName.length > 0) {
            bundle = [[CCDBundleHelper sharedInstance] podBundle:self.bundleName];
        } else {
            bundle = [NSBundle mainBundle];
        }
        
        NSString *path = [bundle pathForResource:cellName ofType:@"nib"];
        if (path) {
            UINib *nib = [UINib nibWithNibName:cellName bundle:bundle];
            [tableView registerNib:nib forCellReuseIdentifier:cellName];
        } else {
            [tableView registerClass:NSClassFromString(cellName) forCellReuseIdentifier:cellName];
        }
    }
}

- (UITableViewCell<DHSplitCellProtocol> *)cellWithTableView:(UITableView *)tableView
                                                  cellModel:(DHSplitCellBaseModel *)cellModel
                                          andDelegateObject:(id)delegateObject
{
    UITableViewCell<DHSplitCellProtocol> *cell = nil;
    NSString *cellName = self.cellTypeDictionary[@(cellModel.cellType)];
    if (cellName.length) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if ([cell respondsToSelector:@selector(configureCellDelegateWithDelegateObject:)]) {
            [cell configureCellDelegateWithDelegateObject:delegateObject];
        }
    }
    
    return cell;
}

- (CGFloat)getCellHeightWithTableView:(UITableView *)tableView
                         andCellModel:(DHSplitCellBaseModel *)cellModel
{
    if (cellModel.height <= 0 || cellModel.cancelCacheHeight) {
        NSString *cellName = self.cellTypeDictionary[@(cellModel.cellType)];
        UITableViewCell<DHSplitCellProtocol> *tmplateCell = [tableView dequeueReusableCellWithIdentifier:cellName];
        
        CGFloat cellWidth = CGRectGetWidth(tableView.bounds);
        CGFloat cellHeight = CGRectGetHeight(tmplateCell.bounds);
        tmplateCell.bounds = CGRectMake(0, 0, cellWidth, cellHeight);
        [tmplateCell prepareForReuse];
        [tmplateCell updateCell:cellModel];
        
        if ([tmplateCell respondsToSelector:@selector(getCellHeightByFrameLayout)]) {
            cellModel.height = [tmplateCell getCellHeightByFrameLayout];
        } else {
            CGSize fittingSize = [tmplateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
            cellModel.height = fittingSize.height;
        }
        
        if (tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
            cellModel.height += 1.0 / [UIScreen mainScreen].scale;
        }
    }
    
    return cellModel.height;
}

@end
