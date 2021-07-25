//
//  UIControl+UIControllOnOffAlpha.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 24.07.2021.
//

#import "UIControl+OnOffAlpha.h"

@implementation UIControl (OnOffAlpha)
-(void) off {
    self.enabled = false;
    self.alpha = 0.3;
}
-(void) on {
    self.enabled = true;
    self.alpha = 1.0;
}
@end
