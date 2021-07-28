//
//  RSTextField.h
//  Authorization window
//
//  Created by Vladimir Oleinikov on 24.07.2021.
//

#ifndef RSTextField_h
#define RSTextField_h

#import "GlobalFunctions.h"
@import Foundation;
@import UIKit;
 
@interface RSTextField: UITextField
@property (assign,nonatomic) State selectedState;
-(void) updateState:(State) state;
@end

#endif /* RSTextField_h */
