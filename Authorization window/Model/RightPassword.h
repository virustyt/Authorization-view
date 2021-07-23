//
//  RightPasssword.h
//  Authorization window
//
//  Created by Vladimir Oleinikov on 22.07.2021.
//

@import UIKit;
@import Foundation;

typedef enum {
    RightPassswordCypherButtonStateFirst = 1,
    RightPassswordCypherButtonStateSecond,
    RightPassswordCypherButtonStateThird
} RightPassswordCypherButtonState;

@interface RightPassword: NSObject

@property (nonatomic,copy) NSString *login;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,copy) NSArray *cypherButtons;

@end
