//
//  ViewController.h
//  Calculator
//
//  Created by hqr on 13-10-17.
//  Copyright (c) 2013年 hqr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    NSString *calString;
    NSString *ansString;
    NSString *M;
}

@property (weak, nonatomic) IBOutlet UILabel *label_input;
@property (weak, nonatomic) IBOutlet UILabel *label_ans;


- (IBAction)bnt_MR:(id)sender;
- (IBAction)bnt_Mjia:(id)sender;
- (IBAction)bnt_Mjian:(id)sender;
- (IBAction)bnt_MC:(id)sender;


- (IBAction)bnt_mod:(id)sender;
- (IBAction)bnt_right:(id)sender;
- (IBAction)bnt_left:(id)sender;
- (IBAction)bnt_back:(id)sender;

- (IBAction)bnt_add:(id)sender;
- (IBAction)bnt_mul:(id)sender;
- (IBAction)bnt_exc:(id)sender;
- (IBAction)bnt_AC:(id)sender;

- (IBAction)bnt_min:(id)sender;
- (IBAction)bnt_9:(id)sender;
- (IBAction)bnt_8:(id)sender;
- (IBAction)bnt_7:(id)sender;

- (IBAction)bnt_neg:(id)sender;
- (IBAction)bnt_6:(id)sender;
- (IBAction)bnt_5:(id)sender;
- (IBAction)bnt_4:(id)sender;
- (IBAction)bnt_3:(id)sender;
- (IBAction)bnt_2:(id)sender;
- (IBAction)bnt_1:(id)sender;
- (IBAction)bnt_0:(id)sender;

- (IBAction)bnt_dot:(id)sender;
- (IBAction)bnt_equal:(id)sender;


@end
