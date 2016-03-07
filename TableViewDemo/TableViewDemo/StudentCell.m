//
//  StudentCell.m
//  TableViewDemo
//
//  Created by ChenShuKun on 16/3/7.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "StudentCell.h"
#import "Student.h"

@implementation StudentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 300, 21)];
    name.tag = 100;
    [self addSubview:name];
  
    UILabel *age = [[UILabel alloc]initWithFrame:CGRectMake(10, 21, 300, 21)];
    age.tag = 101;
    [self addSubview:age];
    
    UILabel *address = [[UILabel alloc]initWithFrame:CGRectMake(10,42,CGRectGetWidth(self.frame), 21)];
    address.tag = 102;
    address.numberOfLines = 0;
    [self addSubview:address];
    
}
-(void)setStudentModel:(Student *)studentModel {
    _studentModel = studentModel;

    UILabel *name = (UILabel *)[self viewWithTag:100];
    UILabel *age = (UILabel *)[self viewWithTag:101];
    UILabel *address = (UILabel *)[self viewWithTag:102];
    
    name.text = studentModel.name;
    age.text = [NSString stringWithFormat:@"age = %ld",(long)studentModel.age];
    address.text = studentModel.address;
    [address sizeToFit];
    
    CGFloat height = name.frame.origin.x + name.frame.size.height;
    NSLog(@"heigh = %f",height);
    

    studentModel.cellHeight = height + 21*2 + 10;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
