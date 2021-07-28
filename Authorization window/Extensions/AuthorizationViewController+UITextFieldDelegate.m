//
//  AuthorizationViewController+UITextFieldDelegate.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 26.07.2021.
//

#import "AuthorizationViewController+UITextFieldDelegate.h"
#import "RSTextField.h"


@implementation AuthorizationViewController (UITextFieldDelegate)

-(void) textFieldDidChangeSelection:(UITextField *)textField {
    if ([textField isKindOfClass:RSTextField.class] && ((RSTextField*) textField).selectedState == Failure){
            [((RSTextField*) textField) updateState:Waiting];
    }
}

-(void) textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isKindOfClass:RSTextField.class]){
        [((RSTextField*) textField) updateState:Waiting];
        
    }
}

-(BOOL) textFieldShouldReturn: (UITextField*) textField {
    [self resignFirstResponder];
    return true;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:true];
}

@end
