//
//  ViewController.m
//  CoreAnimation
//
//  Created by HZhenF on 17/4/3.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import "ViewController.h"

#define angle(value) (value / 180.0 * M_PI)

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<CAAnimationDelegate>

@property(nonatomic,strong) CALayer *layer;

@property(nonatomic,strong) UIButton *btn;

@property(nonatomic,strong) UIImageView *imageView;

@property(nonatomic,strong) UIImageView *imageView1;

@property(nonatomic,strong) UIButton *btn_left;

@property(nonatomic,strong) UIButton *btn_right;

@property(nonatomic,assign) int index;

@end

@implementation ViewController

-(UIButton *)btn_right
{
    if (!_btn_right) {
        _btn_right = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _btn_right.tag = 2;
        _btn_right.center = CGPointMake(CGRectGetMaxX(self.imageView1.frame) + 50, self.imageView1.center.y);
        [_btn_right setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn_right.backgroundColor = [UIColor yellowColor];
        [_btn_right addTarget:self action:@selector(onClickBtn_right) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn_right];
    }
    return _btn_right;
}

-(UIButton *)btn_left
{
    if (!_btn_left) {
        _btn_left = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _btn_left.tag = 1;
        _btn_left.center = CGPointMake(CGRectGetMinX(self.imageView1.frame) - 50, self.imageView1.center.y);
        [_btn_left setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn_left.backgroundColor = [UIColor yellowColor];
        [_btn_left addTarget:self action:@selector(onClickBtn_left) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn_left];
    }
    return _btn_left;
}

-(UIImageView *)imageView1
{
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - 200)*0.5, (ScreenHeight - 200)*0.5, 200,200)];
        [self.view addSubview:_imageView1];
    }
    return _imageView1;
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(250, 100, 100, 100)];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

-(UIButton *)btn
{
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 100,ScreenHeight - 100, 100, 100)];
        [_btn addTarget:self action:@selector(testForKeyframe) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
    }
    return _btn;
}

-(CALayer *)layer
{
    if (!_layer) {
        _layer = [CALayer layer];
        _layer.anchorPoint = CGPointZero;
        [self.view.layer addSublayer:_layer];
    }
    return _layer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.position = CGPointMake(100, 100);
    self.layer.backgroundColor = [UIColor orangeColor].CGColor;

    [self.btn setTitle:@"点击" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.btn.backgroundColor = [UIColor cyanColor];
    self.index = 1;
    
    self.imageView.image = [UIImage imageNamed:@"me"];
    
    self.imageView1.image = [UIImage imageNamed:@"1.jpg"];
    
    
    [self.btn_left setTitle:@"左" forState:UIControlStateNormal];
    [self.btn_right setTitle:@"右" forState:UIControlStateNormal];
    
}

-(void)testForKeyframe
{
    /*
     这里有点问题没解决，程序中，我直接把CALayer加入到了self.view.layer中
     现在想在这里通过key值移除对应的动画，结果发现移除不了
     但是如果我用的是UIImageView或者其他的控件就可以移除
     */

//    for (CALayer *layer in self.view.layer.sublayers) {
//        NSLog(@"before:   layer:%@",layer.animationKeys);
//    }
    
//    [self.view.layer removeAnimationForKey:@"keyframe"];
//    [self.view.layer.sublayers removeObserver:self.view.layer.sublayers fromObjectsAtIndexes:1  forKeyPath:@"keyframe"];
//    [self.view.layer removeAllAnimations];
    
    [self.imageView.layer removeAnimationForKey:@"keyframe"];
    
    
//    for (CALayer *layer in self.view.layer.sublayers) {
//        NSLog(@"after:   layer:%@",layer.animationKeys);
//    }
}

-(void)onClickBtn_left
{
    self.index --;
    if (self.index < 1) {
        self.index = 7;
    }
    self.imageView1.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",self.index]];
    [self CATransitionAlbumEffect:self.btn_left.tag];

}

-(void)onClickBtn_right
{
    self.index ++;
    if (self.index > 7) {
        self.index = 1;
    }
    self.imageView1.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",self.index]];
    [self CATransitionAlbumEffect:self.btn_right.tag];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //基础核心动画
    
//    [self useCABasicAnimation];
    
//    [self CABasicAnimationSetupBounds];
    
//    [self CABasicAnimationSetupTransform];
    
//    [self CABasicAnimationSetupOpacity];
    
    /***分隔线***/
    
    //关键帧核心动画
//    [self CAKeyframeAnimationSetupPosition1];
    
//    [self CAKeyframeAnimationSetupPosition2];
    
//    [self CAKeyframeAnimationShakeEffect];
    
    /***分隔线***/
    
    //转场核心动画
//     CATransitionAlbumEffect
    
    
    /***分隔线***/
    //组动画
    [self CAAnimationGroupShow];
    
}


/**CAAnimationGroup演示*/
-(void)CAAnimationGroupShow
{
    //平移动画
    CABasicAnimation *basci = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    basci.toValue = @(100);
    
    //缩放动画
    CABasicAnimation *basic1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basic1.toValue = @(0);
    
    //旋转动画
    CABasicAnimation *basic2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    basic2.toValue = @(M_PI);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.duration = 2.0;
    group.animations = @[basci,basic1,basic2];
    
    [self.imageView.layer addAnimation:group forKey:nil];

}

/**CATransition实现相册效果*/
-(void)CATransitionAlbumEffect:(NSInteger)target
{
    CATransition *transition = [CATransition animation];
    //指定要执行什么动画
    transition.type = @"cube";
    transition.subtype = kCATransition;

    if (target == 1)
    {
         transition.subtype = kCATransitionFromLeft;
    }
    else if (target == 2)
    {
         transition.subtype = kCATransitionFromRight;
    }
    transition.duration = 0.5;
    [self.imageView1.layer addAnimation:transition forKey:nil];
}

/**CAKeyframeAnimation的rotation演示(抖动效果)*/
-(void)CAKeyframeAnimationShakeEffect
{
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    keyframe.removedOnCompletion = NO;
    keyframe.fillMode = kCAFillModeForwards;
    keyframe.duration = 0.1;
    keyframe.values = @[@(-angle(4)),@(angle(4)),@(-angle(4))];
    keyframe.repeatCount = MAXFLOAT;
    //而且直接添加到self.view.layer的keyframe 和直接添加到self.imageView.layer的keyframe效果不一样
    //前者以左上角旋转，后者以中心点旋转
    [self.imageView.layer addAnimation:keyframe forKey:nil];
}


/**CAKeyframeAnimation的postion演示2*/
-(void)CAKeyframeAnimationSetupPosition2
{
    //圆运动轨迹
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //绘制行走路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 100, 200, 200));
    keyframe.path = path;
    //创建路径后记得要释放路径
    CGPathRelease(path);
    keyframe.fillMode = kCAFillModeForwards;
    keyframe.removedOnCompletion = NO;
    keyframe.duration = 2.0;
    [self.imageView.layer addAnimation:keyframe forKey:@"keyframe"];
}


/**CAKeyframeAnimation的postion演示1*/
-(void)CAKeyframeAnimationSetupPosition1
{
    //矩形运动轨迹
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframe.delegate = self;
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(300, 100)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    keyframe.fillMode = kCAFillModeForwards;
    keyframe.removedOnCompletion = NO;
    //动画效果
    keyframe.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    keyframe.duration = 2.0;
    keyframe.values = @[v1,v2,v3,v4,v5];
    [self.layer addAnimation:keyframe forKey:nil];
}

-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animationDidStart");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animationDidStop");
}

/**CABasicAnimation的opacity演示*/
-(void)CABasicAnimationSetupOpacity
{
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basic.removedOnCompletion = NO;
    basic.fillMode = kCAFillModeForwards;
    basic.duration = 2.0;
    basic.fromValue = @(0);
    basic.toValue = @(1);
    [self.layer addAnimation:basic forKey:nil];
}

/**CABasicAnimation的transform演示*/
-(void)CABasicAnimationSetupTransform
{
//    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform"];
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    basic.removedOnCompletion = NO;
    basic.fillMode = kCAFillModeForwards;
    basic.duration = 2.0;
//    basic.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 1, 1, 0)];
    basic.toValue = @(2);
    
    [self.layer addAnimation:basic forKey:nil];
}

/**CABasicAnimation的bounds演示*/
-(void)CABasicAnimationSetupBounds
{
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"bounds"];
    basic.removedOnCompletion = NO;
    basic.fillMode = kCAFillModeForwards;
    basic.duration = 2.0;
//    basic.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    //byValue是在原来的基础上增加多少
    basic.byValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    [self.layer addAnimation:basic forKey:nil];
}


/**CABasicAnimation的position演示*/
-(void)CABasicAnimationSetupPosition
{
    //1.创建基础核心动画
//    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
    CABasicAnimation *basic = [CABasicAnimation animation];
    //设置要执行什么样的动画
    basic.keyPath = @"position";
    //动画起始位置,若不设置就默认当前为止开始
    basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    //动画结束为止
    basic.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    //动画执行时间
    basic.duration = 3.0;
    
    /*
     以下两句是强行改变动画为止和强行保留动画结束状态
     默认是结束后移除动画，并且回到原始为止
     */
    
    //设置动画执行完毕后不删除动画
    basic.removedOnCompletion = NO;
    //设置动画结束后保留最后的状态
    basic.fillMode = kCAFillModeForwards;
    
    //2.添加核心动画到layer
    [self.layer addAnimation:basic forKey:nil];
}

@end
