//
//  RSTextField.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 24.07.2021.
//

#import <Foundation/Foundation.h>
#import "RSTextField.h"
#import "UIColor+AdditionalColors.h"

static const CGFloat borderWidth = 1.5;
static const CGFloat cornerRadius = 5.0;

@implementation RSTextField

-(void) updateState:(State) state {
    switch (state) {
        case Sucsess:
            self.layer.borderColor = UIColor.turquoiseGreen.CGColor;
            break;
        case Failure:
            self.layer.borderColor = UIColor.venetianRed.CGColor;
            break;
        case Waiting:
            self.layer.borderColor = UIColor.blackCoral.CGColor;
            self.text = nil;
            break;
    }
    self.selectedState = state;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        self.borderStyle = UITextBorderStyleRoundedRect;
        
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = UIColor.blackCoral.CGColor;
        self.layer.cornerRadius = cornerRadius;
    }
    
    
    return self;
}

@end
