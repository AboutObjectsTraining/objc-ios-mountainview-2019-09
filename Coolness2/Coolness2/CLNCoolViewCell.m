// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

UIEdgeInsets CLNTextInsets = { .top = 7, .left = 12, .bottom = 8, .right = 12 };

@interface CLNCoolViewCell ()
@property (nonatomic, getter=isHighlighted) BOOL highlighted;
@property (class, nonatomic, readonly) NSDictionary *textAttributes;
@end

@implementation CLNCoolViewCell

+ (NSDictionary *)textAttributes {
    return @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
              NSForegroundColorAttributeName: UIColor.whiteColor };
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configureLayer];
        [self configureGestureRecognizer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureLayer];
        [self configureGestureRecognizer];
    }
    return self;
}

- (void)configureGestureRecognizer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    tap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tap];
}

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1.0
                               size:CGSizeMake(50.0, 100.0)];
}

- (void)translateAnimationWithSize:(CGSize)size {
    self.frame = CGRectOffset(self.frame, size.width, size.height);
}

- (void)rotateAnimation {
    CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI_2);
    self.transform = rotation;
    self.alpha = 0.0;
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration
                             size:(CGSize)size {
    typeof(self) __weak weakSelf = self;
    self.alpha = 1.0;
    [UIView animateWithDuration:duration
                     animations:^{
                         typeof(weakSelf) strongSelf = weakSelf;
                         [strongSelf translateAnimationWithSize:size];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:duration
                                          animations:^{
                                              typeof(weakSelf) strongSelf = weakSelf;
                                              [strongSelf rotateAnimation];
                                          }
                                          completion:^(BOOL finished) {
                                              [UIView animateWithDuration:duration
                                                               animations:^{
                                                                   typeof(weakSelf) strongSelf = weakSelf;
                                                                   strongSelf.alpha = 1.0;
                                                                   strongSelf.transform = CGAffineTransformIdentity;
                                                               }
                                                               completion:^(BOOL finished) {
                                                                   [UIView animateWithDuration:duration
                                                                                    animations:^{
                                                                                        typeof(weakSelf) strongSelf = weakSelf;
                                                                                        [strongSelf translateAnimationWithSize:CGSizeMake(-size.width, -size.height)];
                                                                                    }];
                                                               }];
                                          }];
                     }];
}

- (void)configureLayer {
    self.layer.borderWidth = 3.0;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = 8.0;
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = UIColor.blackColor.CGColor;
    self.layer.shadowRadius = 4.0;
    self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    self.layer.shadowOpacity = 1.0;
}

- (void)setHighlighted:(BOOL)aBool {
    _highlighted = aBool;
    self.alpha = aBool ? 0.5 : 1.0;
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = YES;
    [self.superview bringSubviewToFront:self];
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder)
                                             to:nil
                                           from:nil
                                       forEvent:nil];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:self.superview];
    CGPoint prevLocation = [touch previousLocationInView:self.superview];
    
    CGFloat dx = currLocation.x - prevLocation.x;
    CGFloat dy = currLocation.y - prevLocation.y;
    
    CGRect proposedFrame = CGRectOffset(self.frame, dx, dy);
    
    if (CGRectContainsRect(self.superview.bounds, proposedFrame))
        self.frame = proposedFrame;
}

- (void)endTouch {
    self.highlighted = NO;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endTouch];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endTouch];
}



@end
