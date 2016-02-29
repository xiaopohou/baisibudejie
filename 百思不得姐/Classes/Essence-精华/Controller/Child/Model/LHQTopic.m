//
//  LHQTopic.m
//  百思不得姐
//
//  Created by HqLee on 16/2/26.
//  Copyright © 2016年 HqLee. All rights reserved.
//

#import "LHQTopic.h"
#import <MJExtension.h>

@implementation LHQTopic

{
    CGFloat _cellHeight;
    CGRect _pictureF;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"Id" : @"id",
             @"smallImageUrl":@"image0",
             @"middleImageUrl":@"image2",
             @"bigImageUrl":@"image1"};
}

- (CGFloat)cellHeight{
    
    if (_cellHeight == 0) {//只计算一次
        
        CGFloat headerViewY = LHQTopicCellHeaderViewH;
        CGFloat margin = LHQTopicCellMargin;//距离头像10像素
        
        CGFloat maxWidth = kScreenWidth - 4 * LHQTopicCellMargin;//原来是这里的问题，导致计算高度一直出问题，因为cell的宽度被压缩了!
        
        CGFloat textLabelH = [self.text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
        
        CGFloat bottomH = LHQTopicCellBottomViewH;//底部工具条的高度
        
        
        _cellHeight = headerViewY + textLabelH + margin;
        
        //图片高度
        if (self.type == LHQTopicTypePicture) {
            
            CGFloat pictureW = maxWidth;
            CGFloat pictureH = pictureW * self.height / self.width;
            
            if (pictureH >= LHQTopicPictureMaxH) {
                pictureH = LHQTopicPictureDealH;
                self.bigPicture = YES;
            }
            
            CGFloat pictureX = LHQTopicCellMargin;
            CGFloat pictureY = headerViewY + textLabelH + margin + margin;
            _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            _cellHeight += pictureH + margin;
        }
        
        _cellHeight += 2 * margin + bottomH;
    }
    return _cellHeight;
}

@end
