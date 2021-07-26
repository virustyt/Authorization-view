//
//  CypherView.h
//  Authorization window
//
//  Created by Vladimir Oleinikov on 25.07.2021.
//

#import "CypherButton.h"
@import Foundation;
@import UIKit;

typedef NS_ENUM(NSInteger, State) {
    Failure,
    Sucsess,
    Waiting
} ;

#ifndef CypherView_h
#define CypherView_h

@interface CypherStackView : UIView
@property (nonatomic,readwrite) void (^validationHandler) (NSMutableArray*) ;
-(void)updateState;
@end
 
#endif /* CypherView_h */
