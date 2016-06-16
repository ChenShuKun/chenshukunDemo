//
//  ViewController.m
//  UICollectionView
//
//  Created by ChenShuKun on 16/6/16.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

#define  cellWidth  90
#define  ScreenWidth [UIScreen mainScreen].bounds.size.width
//[UIScreen mainScreen].bounds.size.width / 3
@interface ViewController ()<UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

@property (nonatomic,strong) NSMutableArray *section0Array;
@end

// 注意const的位置
static NSString *const cellId = @"cellId";
static NSString *const headerId = @"headerId";
static NSString *const footerId = @"footerId";

@implementation ViewController {
    
    UICollectionViewFlowLayout*  _customLayout;
    UICollectionView *_collectionView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCollectionView];
    
    _section0Array = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",]];
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"添加"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(addItemBtnClick:)];
    
    self.navigationItem.rightBarButtonItem = btnItem;
}


// 添加（插入item）
- (void)addItemBtnClick:(UIBarButtonItem *)btnItem {
    
    [_collectionView performBatchUpdates:^{
        // 构造一个indexPath
        NSIndexPath *indePath = [NSIndexPath indexPathForItem:_section0Array.count inSection:0];
        [_collectionView insertItemsAtIndexPaths:@[indePath]]; // 然后在此indexPath处插入给collectionView插入一个item
        [_section0Array addObject:@"x"]; // 保持collectionView的item和数据源一致
    } completion:nil];
    
    
}


- (void)loadCollectionView {
    
    _customLayout = [[UICollectionViewFlowLayout alloc] init]; // 自定义的布局对象
   
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_customLayout];
    _collectionView.backgroundColor = [UIColor cyanColor];

    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    
    // 注册cell、sectionHeader、sectionFooter
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellId];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
}

# pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _section0Array.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Register nib file for the cell
    UINib *nib = [UINib nibWithNibName:@"CollectionViewCell"
                                    bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:cellId];
    CollectionViewCell *cell = [[CollectionViewCell alloc]init];
    
     cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor purpleColor];
    cell.label.text = @"你好";
    
    return cell;
}

// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        if(headerView == nil)
        {
            headerView = [[UICollectionReusableView alloc] init];
        }
        headerView.backgroundColor = [UIColor grayColor];
        
        return headerView;
    }
    else if([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        
        UICollectionReusableView *footerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerId forIndexPath:indexPath];
        if(footerView == nil)
        {
            footerView = [[UICollectionReusableView alloc] init];
        }
        footerView.backgroundColor = [UIColor lightGrayColor];
        
        return footerView;
    }
    
    return nil;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
{
    
}




#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){cellWidth,cellWidth};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (CGSize){ScreenWidth,44};
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return (CGSize){ScreenWidth,22};
}


#pragma mark ---- UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 点击高亮
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
}


// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = _section0Array[indexPath.row];
    NSLog(@"you selected str = %@",str);
    
}


// 长按某item，弹出copy和paste的菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 使copy和paste有效
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"])
    {
        return YES;
    }
    
    return NO;
}

//
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if([NSStringFromSelector(action) isEqualToString:@"copy:"])
    {
        //        NSLog(@"-------------执行拷贝-------------");
        [_collectionView performBatchUpdates:^{
            [_section0Array removeObjectAtIndex:indexPath.row];
            [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
        } completion:nil];
    }
    else if([NSStringFromSelector(action) isEqualToString:@"paste:"])
    {
        NSLog(@"-------------执行粘贴-------------");
    }
}


#pragma mark ---- UICollecti

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
