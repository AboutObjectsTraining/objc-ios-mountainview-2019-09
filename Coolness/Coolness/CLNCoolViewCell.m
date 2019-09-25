// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

UIEdgeInsets CLNTextInsets = { .top = 7, .left = 12, .bottom = 8, .right = 12 };

@interface CLNCoolViewCell ()
@property (class, nonatomic, readonly) NSDictionary *textAttributes;
@end

@implementation CLNCoolViewCell

+ (NSDictionary *)textAttributes {
    return @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
              NSForegroundColorAttributeName: UIColor.whiteColor };
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    CGPoint origin = CGPointMake(CLNTextInsets.left, CLNTextInsets.top);
    [self.text drawAtPoint:origin withAttributes:self.class.textAttributes];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat dx = currLocation.x - prevLocation.x;
    CGFloat dy = currLocation.y - prevLocation.y;
    
    touch.view.frame = CGRectOffset(touch.view.frame, dx, dy);
}

@end
