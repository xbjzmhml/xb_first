//
//  UILabel+ExpandFont.h
//  EnterpriseParkII
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 集联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ExpandFont)

- (UILabel *(^)(NSString *str,UIColor *color,CGFloat size))setupmoreColorFont;
-(BOOL)moreColorFont:(NSArray *)array;

-(void)speColorText:(NSString *)str AndCocor:(UIColor *)color AndFont:(UIFont *)Font;
@end
