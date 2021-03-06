//
//  UIColor+AdditionalColors.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 25.07.2021.
//

#import "UIColor+AdditionalColors.h"

@implementation UIColor (AdditionalColors)

+(UIColor *) white {
    return [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];;
};

+(UIColor *) blackCoral {
    return [UIColor colorWithRed:76.0/255.0 green:92.0/255.0 blue:104.0/255.0 alpha:1.0];
};

+(UIColor *) turquoiseGreen {
    return [UIColor colorWithRed:145.0/255.0 green:199.0/255.0 blue:177.0/255.0 alpha:1.0];
};

+(UIColor *) venetianRed {
    return [UIColor colorWithRed:194.0/255.0 green:1.0/255.0 blue:20.0/255.0 alpha:1.0];
};

+(UIColor *) black {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
};

+(UIColor *) littleBoyBlue {
    return [UIColor colorWithRed:128/255.0 green:164.0/255 blue:237.0/255 alpha:1.0];
};

@end
