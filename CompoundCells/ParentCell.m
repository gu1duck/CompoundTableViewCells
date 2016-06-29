//
//  ParentCell.m
//  CompoundCells
//
//  Created by Jeremy Petter on 2016-06-29.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

#import "ParentCell.h"
#import "ChildCell.h"

NSString * const ParentCellReuseIdentifier = @"ParentCellReuseIdentifier";

@interface ParentCell ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) ChildCell *childCell;

@end

@implementation ParentCell

- (void)awakeFromNib
{
    [self.containerView addSubview:self.childCell];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [_containerView addSubview:_childCell];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self layoutChildCell];
}

- (void)layoutChildCell
{
    CGRect containerRect = self.containerView.bounds;
    containerRect.origin = CGPointMake(0, 0);
    self.childCell.frame = containerRect;
}

- (ChildCell *)childCell
{
    if (!_childCell)
    {
        _childCell = ^{
            ChildCell *cell = [[ChildCell alloc] initWithFrame:CGRectZero];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Label for child cell";
            return cell;
        }();
    }
    return _childCell;
}

@end
