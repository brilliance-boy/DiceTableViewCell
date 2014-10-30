//
//  DiceTableViewCell.m
//  Dice
//
//  Created by Damien Laughton on 30/10/2014.
//  Copyright (c) 2014 Damien Laughton. All rights reserved.
//

#import "DiceTableViewCell.h"

@interface DiceTableViewCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintVerticalCenter;

@end

@implementation DiceTableViewCell

- (void)dealloc;
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDiceTableViewCellDirectionNotification:) name:DiceTableViewCellDirectionNotification object:nil];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews;
{

}

- (void)handleDiceTableViewCellDirectionNotification:(NSNotification *)notification;
{
    id notificationObject = notification.object;
    
    DiceTableViewCellScrollDirection scrollDirection = [(NSNumber *)notificationObject integerValue];
    
    NSInteger constant = self.constraintVerticalCenter.constant;
    
    switch (scrollDirection) {
        case ScrollDirectionDown:
        {
            constant--;
            if (-20 > constant)
            {
                constant = -20;
            }
        }
        break;
        case ScrollDirectionUp:
        {
            constant++;
            if (20 < constant)
            {
                constant = 20;
            }
        }
        default:
        {
//            Do Nothing
        }
        break;
    }
    
    self.constraintVerticalCenter.constant = constant;
    
}

@end
