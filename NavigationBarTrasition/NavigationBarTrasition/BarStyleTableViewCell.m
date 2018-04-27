//
//  BarStyleTableViewCell.m
//  NavigationBarTrasition
//
//  Created by vae on 2018/4/27.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "BarStyleTableViewCell.h"

@implementation BarStyleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		self.accessoryType = UITableViewCellAccessoryNone;
		
		_switcher = [UISwitch new];
		self.accessoryView = _switcher;
	}
	return self;
}

-(void)prepareForReuse{
	[super prepareForReuse];
	
	_switcher.on = NO;
	[_switcher removeTarget:nil action:nil forControlEvents:UIControlEventValueChanged];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
