//
//  CypherView.h
//  Authorization window
//
//  Created by Vladimir Oleinikov on 25.07.2021.
//

#import "CypherButton.h"
#import "GlobalFunctions.h"
@import Foundation;
@import UIKit;



#ifndef CypherView_h
#define CypherView_h

@interface CypherView : UIView
@property (nonatomic,readwrite) void (^validationHandler) (NSMutableArray*);
-(void)updateState:(State) state;
@end
 
#endif /* CypherView_h */
