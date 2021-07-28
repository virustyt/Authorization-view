//
//  CypherView.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 25.07.2021.
//

#import "CypherView.h"
#import "UIColor+AdditionalColors.h"

static NSString * const underscore = @"_";

static const CGFloat stackSpacing  = 20.0;
static const CGFloat stackPadding = 20.0;

static const CGFloat borderWidth = 2.0;
static const CGFloat cornerRadius = 8.0;

static const CGFloat labelFontSize = 18.0;


@interface CypherView ()
@property (nonatomic,strong) NSMutableArray* selectedCases;
@property (nonatomic) UILabel *cypherLabel;
@property (nonatomic) UIStackView *stackView;

@end


@implementation CypherView

-(UILabel*) cypherLabel {
    if (_cypherLabel) {
        return _cypherLabel;
    } else {
        UILabel *lable = [[UILabel alloc] init];
        lable.text = underscore;
        lable.font = [UIFont systemFontOfSize:labelFontSize weight:UIFontWeightSemibold];
        lable.translatesAutoresizingMaskIntoConstraints = false;
        
        self.cypherLabel = lable;
        return lable;
    }
}

-(UIStackView*) stackView {
    if (_stackView) {
        return _stackView;
    } else {
        UIStackView *stack = [[UIStackView alloc] init];
        
        [stack setAxis:UILayoutConstraintAxisHorizontal];
        stack.spacing = stackSpacing;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        
        self.stackView = stack;
        return stack;
    }
}

-(void) updateState: (State) state {
    switch (state) {
    case Failure:
            self.layer.borderColor = UIColor.redColor.CGColor;
            [self.selectedCases removeAllObjects];
            self.cypherLabel.text = underscore;
            break;
        case Sucsess:
            self.layer.borderColor = UIColor.turquoiseGreen.CGColor;
            break;;
        case Waiting:
            self.layer.borderColor = UIColor.clearColor.CGColor;
            [self.selectedCases removeAllObjects];
            self.cypherLabel.text = underscore;
            break;;
    }
}

-(CypherButton*) buildButton:(CypherButtonCases) buttonCase {
    CypherButton *button = [[CypherButton alloc] initFor:buttonCase];
    [button addTarget:self action:@selector(cypherButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void) setUpAppearence {
    [self addSubview:self.cypherLabel];
    [self addSubview:self.stackView];
    
    [self.stackView addArrangedSubview:[self buildButton:One]];
    [self.stackView addArrangedSubview:[self buildButton:Two]];
    [self.stackView addArrangedSubview:[self buildButton:Three]];
    
    
    [NSLayoutConstraint activateConstraints:@[
        [self.cypherLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:15.0],
        [self.cypherLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        
        [self.stackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:23.0],
        [self.stackView.topAnchor constraintEqualToAnchor:self.cypherLabel.bottomAnchor constant:10.0],
        [self.stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-23.0],
        [self.stackView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-15.0]
        ]
    ];
    [self setBorder];
}

-(void) setBorder {
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = UIColor.clearColor.CGColor;
    self.layer.cornerRadius = cornerRadius;
}

-(void) cypherButtonHandler: (CypherButton*) button {
    if (self.selectedCases.count < 3) {
        self.layer.borderColor = UIColor.clearColor.CGColor;
        [self.selectedCases addObject:@(button.cypherCase)];
        [self updadeLabel];
    } else if (self.validationHandler) {
        self.validationHandler(self.selectedCases);
    }
}

-(void) updadeLabel {
    NSMutableString *stringOfcases = [[NSMutableString alloc] init];
    for (id object in self.selectedCases) {
        NSMutableString *stringCase = [NSMutableString stringWithFormat:@"%ld", (long)((NSInteger) object) ];
        [stringCase appendString:@" "];
        [stringOfcases appendString:stringCase];
    }
    [self.cypherLabel setText:stringOfcases];
}

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setUpAppearence];
    }
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)coder {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"init(coder:) has not been implemented" userInfo:nil];
}

@end
