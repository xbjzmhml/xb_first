//
//  UILabel+ExpandFont.m
//  EnterpriseParkII
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 集联. All rights reserved.
//

#import "UILabel+ExpandFont.h"

@implementation UILabel (ExpandFont)
-(BOOL)moreColorFont:(NSArray *)array{
    if(array.count%3!=0){
        return NO;
    }
    for (int i=0; i<array.count; i++) {
        if (i%3==0) {
            if (![array[i] isKindOfClass:[NSString class]]) {
                return NO;
            }else{
                
            }
        } else if (i%3==1) {
            if (![array[i] isKindOfClass:[UIColor class]]) {
                return NO;
            }else{
                
            }
        }else{
            if (![array[i] isKindOfClass:[NSNumber class]]) {
                return NO;
            }else{
                
            }
        }
    }
    
    NSMutableAttributedString *mutAttribute;
    for (int i=0; i<array.count/3; i++) {
        if (i==0) {
            UIColor *color=array[1];
            CGFloat size=[array[2] doubleValue];
            NSString *str=array[0];
             NSDictionary *attributes = @{NSForegroundColorAttributeName:color,NSFontAttributeName:[UIFont systemFontOfSize:size]};
            
          mutAttribute = [[NSMutableAttributedString alloc]initWithString:str attributes:attributes];
        }else{
            UIColor *color=array[i*3+1];
            CGFloat size=[array[i*3+2] doubleValue];
            NSString *str=array[i*3];
            NSDictionary *attributes = @{NSForegroundColorAttributeName:color,NSFontAttributeName:[UIFont systemFontOfSize:size]};
            
            [mutAttribute appendAttributedString:[[NSAttributedString alloc]initWithString:str attributes:attributes]];
        }
    }
    self.attributedText = mutAttribute;
    return YES;
}

- (UILabel *(^)(NSString *str,UIColor *color,CGFloat size))setupmoreColorFont{
    return ^(NSString *str,UIColor *color,CGFloat size) {
        NSDictionary *attributes = @{NSForegroundColorAttributeName:color,NSFontAttributeName:[UIFont systemFontOfSize:size]};
        if (self.attributedText.string.length<1) {
             self.attributedText = [[NSMutableAttributedString alloc]initWithString:str attributes:attributes];
        }else{
            NSMutableAttributedString *mutAttribute=[[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
            [mutAttribute appendAttributedString:[[NSAttributedString alloc]initWithString:str attributes:attributes]];
             self.attributedText=mutAttribute;
            
        
        }

       
        return self;
    };
}
-(void)speColorText:(NSString *)str AndCocor:(UIColor *)color AndFont:(UIFont *)Font{
    if (!str) {
        return;
    }
    if (str.length<1) {
        return;
    }
    NSArray  *array = [self.text componentsSeparatedByString:str];
    NSLog(@"%@",array);
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName:color,NSFontAttributeName:Font};
    NSAttributedString *midStr=[[NSAttributedString alloc]initWithString:str attributes:attributes];
    
    NSMutableAttributedString *mutAttribute=[[NSMutableAttributedString alloc]initWithString:array[0]];
    if (array.count==1) {
        ;
    }else{
        for (int i=1; i<array.count; i++) {
            [mutAttribute appendAttributedString:midStr];
            [mutAttribute appendAttributedString:[[NSAttributedString alloc]initWithString:array[i]]];
        }
    }
    
    self.attributedText=mutAttribute;
    
}
@end
