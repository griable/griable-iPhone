 //
//  GV_DownloadModalView.m
//  griable
//
//  Created by Gabriel Slama on 22/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GV_DownloadModal.h"
#import <QuartzCore/QuartzCore.h>

@implementation GV_DownloadModal

@synthesize controller;
@synthesize containerView;
@synthesize statusImageView;

- (void)awakeFromNib {
  [controller addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)drawRect:(CGRect)rect {
  [[containerView layer] setCornerRadius:10.0f];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (object == controller && keyPath == @"status") {
    NSString *status = [change valueForKey:@"new"];
    
    [[[self statusImageView] layer] removeAllAnimations];
    
    NSString *imageName = [NSString stringWithFormat:@"download-modal-%@.png", status];
    [statusImageView setImage:[UIImage imageNamed:imageName]];
    
    if (status == @"downloading") {
      [self rotateStatusView];
    }
    
    // hide view when download completes or fails
    // handle download failure
    else if ([change valueForKey:@"new"] == @"failure") {
      [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
    }
    // handle download completion
    else if ([change valueForKey:@"new"] == @"finished") {
      [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
    }
  }
}

- (void)rotateStatusView {
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
  [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
  [animation setDuration:0.6f];
  [animation setFromValue:[NSNumber numberWithFloat:0.0f]];
  [animation setToValue:[NSNumber numberWithFloat:((360*M_PI)/180)]];
  [animation setRepeatCount:1e100f];
  [[statusImageView layer] addAnimation:animation forKey:@"transform.rotation"];
}

- (void)dismiss {
  [self removeFromSuperview];
}

- (void)dealloc {
  [controller removeObserver:self forKeyPath:@"status"];
  [super dealloc];
}

@end