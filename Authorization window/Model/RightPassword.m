//
//  RightPassword.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 22.07.2021.
//

#import "RightPassword.h"

@implementation RightPassword

- (instancetype)init{
    self = [super init];
    
    if (self) {
        _login = @"Login";
        _password = @"password";
        _cypherButtons = @[@(RightPassswordCypherButtonStateFirst),@(RightPassswordCypherButtonStateThird),@(RightPassswordCypherButtonStateSecond)];        
    }
    return nil;
}

@end
