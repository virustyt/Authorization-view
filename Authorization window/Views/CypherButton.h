//
//  CypherButton.h
//  Authorization window
//
//  Created by Vladimir Oleinikov on 25.07.2021.
//

@import Foundation;
@import UIKit;

typedef NS_ENUM(NSInteger, CypherButtonCases) {
    One = 1,
    Two,
    Three
};

#ifndef CypherButton_h
#define CypherButton_h

@interface CypherButton : UIButton
@property (assign,nonatomic,readonly) CypherButtonCases cypherCase;
-(id)initFor:(CypherButtonCases) buttonCase ;
@end

#endif /* CypherButton_h */
