//
//  CypherButton.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 25.07.2021.
//

#import "CypherButton.h"
#import "UIColor+AdditionalColors.h"

static const CGFloat backgroundOpacity = 0.2;

@interface CypherButton ()
@property (assign,nonatomic,readwrite) CypherButtonCases cypherCase;
@end

@implementation CypherButton

-(CGSize)intrinsicContentSize {
    return  CGSizeMake(50.0, 50.0);
}

-(void)setHighlighted:(BOOL)highlighted {
    if (self.isHighlighted) {
        self.layer.backgroundColor = [UIColor.littleBoyBlue colorWithAlphaComponent:backgroundOpacity].CGColor;
    } else {
        self.layer.backgroundColor = UIColor.clearColor.CGColor;
    }
}

-(id)initWithCoder:(NSCoder *)coder {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"init(coder:) has not been implemented" userInfo:nil];
}

-(id)initFor:(CypherButtonCases) buttonCase {
    self = [super initWithFrame:CGRectZero];
    
    if(self) {
        self.cypherCase = buttonCase;
        
        NSString *title = [[NSString alloc] initWithFormat:@"%ld",(long)self.cypherCase];
        
        [self setTitle: title forState:UIControlStateNormal];
        self.titleLabel.font = [ UIFont systemFontOfSize:30 weight:UIFontWeightMedium];
        [self setTitleColor:UIColor.littleBoyBlue forState:UIControlStateNormal];
        
        self.layer.cornerRadius = 25.0;
        self.layer.borderWidth = 1.5;
        self.layer.borderColor = UIColor.littleBoyBlue.CGColor;
        
        [self setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        
    }
    return self;
}
                                

@end
