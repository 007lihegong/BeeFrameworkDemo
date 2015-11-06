//
//   ______    ______    ______    
//  /\  __ \  /\  ___\  /\  ___\   
//  \ \  __<  \ \  __\_ \ \  __\_ 
//   \ \_____\ \ \_____\ \ \_____\ 
//    \/_____/  \/_____/  \/_____/ 
//
//  Powered by BeeFramework
//
//
//  AppBoard_iPhone.m
//  BeeDemo
//
//  Created by qianfeng on 15/11/6.
//  Copyright (c) 2015年 李和功. All rights reserved.
//

#import "AppBoard_iPhone.h"

#pragma mark -

@implementation AppBoard_iPhone
{
    BeeUIButton *_mask;
}
DEF_SINGLETON( AppBoard_iPhone )

- (void)load
{
    self.view.backgroundColor = [UIColor brownColor];
}

- (void)unload
{
}

#pragma mark Signal

ON_CREATE_VIEWS( signal )
{
    self.navigationBarShown = YES;
    self.navigationBarTitle =@"你好Bee";
    _mask = [BeeUIButton new];
    
    _mask.frame=CGRectMake(150, 230, 50, 30);
    
    _mask.backgroundColor=[UIColor greenColor];
    
    [_mask setTitle:@"隐藏"];
    _mask.titleColor = [UIColor blackColor];
    _mask.layer.cornerRadius=5;
    _mask.selected = YES;
    _mask.signal = @"mask";
    
    [self.view addSubview:_mask];
}

ON_SIGNAL2( mask, signal )
{
    _mask.selected=!_mask.selected;
    
    if (_mask.selected) {
        [_mask setTitle:@"隐藏"];
        $(@"#labelId").FADE_IN;
    }else {
        [_mask setTitle:@"显示"];
        $(@"#labelId").FADE_OUT();
    }
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
}

ON_WILL_APPEAR( signal )
{
}

ON_DID_APPEAR( signal )
{
}

ON_WILL_DISAPPEAR( signal )
{
}

ON_DID_DISAPPEAR( signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, LEFT_TOUCHED, signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}

@end
