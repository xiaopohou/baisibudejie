//
//  LHQAddTagViewController.h
//  百思不得姐
//
//  Created by HqLee on 16/3/11.
//  Copyright © 2016年 HqLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHQAddTagViewController : UIViewController
@property (nonatomic, copy) void (^tagsBlock)(NSArray *tags);
@property (nonatomic, strong) NSArray *tags;
@end
