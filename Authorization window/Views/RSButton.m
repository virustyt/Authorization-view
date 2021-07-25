//
//  RSButton.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 25.07.2021.
//

#import "RSButton.h"
#import "UIColor+AdditionalColors.h"

static const CGFloat borderWidth  = 2.0;
static const CGFloat cornerRadius = 10.0;
static const CGFloat verticalEdgeInset= 10.0;
static const CGFloat horizontalEdgeInset = 20.0;
static const CGFloat fontSize = 20.0;

static const CGFloat titleOpacity = 0.4;
static const CGFloat backgroundOpacity = 0.2;

static const CGFloat imageLeftInset = -5;


@interface RSButton () 
@property (assign,nonatomic) bool isActive;
@end


@implementation RSButton

-(id)initWithCoder:(NSCoder *)coder {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"init(coder:) has not been implemented" userInfo:nil];
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.isActive = false;
        
        self.titleLabel.font = [ UIFont systemFontOfSize:fontSize weight: UIFontWeightSemibold ];
        [self setTitleColor:UIColor.littleBoyBlue forState:UIControlStateNormal];
        
        self.contentEdgeInsets = UIEdgeInsetsMake(verticalEdgeInset, horizontalEdgeInset,  verticalEdgeInset, horizontalEdgeInset);
        
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = UIColor.littleBoyBlue.CGColor;
        self.layer.borderWidth = borderWidth;
        
        [self setTitleColor:[UIColor.littleBoyBlue colorWithAlphaComponent:titleOpacity] forState:UIControlStateHighlighted];
        
        [self setImage:[UIImage systemImageNamed:@"person"] forState:UIControlStateNormal];
        [self setImage:[UIImage systemImageNamed:@"person.fill"] forState:UIControlStateHighlighted];
        
        [self setImageEdgeInsets:UIEdgeInsetsMake(self.imageEdgeInsets.top, imageLeftInset, self.imageEdgeInsets.bottom, self.imageEdgeInsets.right)];
        
        self.tintColor = UIColor.littleBoyBlue;
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted {
    if (self.isHighlighted) {
        self.layer.backgroundColor = [UIColor.littleBoyBlue colorWithAlphaComponent:backgroundOpacity].CGColor;
    } else {
        self.layer.backgroundColor = UIColor.clearColor.CGColor;
    }
}
@end
