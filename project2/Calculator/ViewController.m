//
//  ViewController.m
//  Calculator
//
//  Created by hqr on 13-10-17.
//  Copyright (c) 2013年 hqr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    calString=@"";
    ansString=@"";
    M=@"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bnt_MR:(id)sender {
    calString=M;
    [_label_input setText:calString];
}
- (IBAction)bnt_Mjia:(id)sender {
    M=calString;
}

- (IBAction)bnt_Mjian:(id)sender {
}

- (IBAction)bnt_MC:(id)sender {
    M=@"0";
}

- (IBAction)bnt_mod:(id)sender {
    calString=[calString stringByAppendingString:@"%"];
    [_label_input setText:calString];
}

- (IBAction)bnt_right:(id)sender {
    calString=[calString stringByAppendingString:@")"];
    [_label_input setText:calString];
}

- (IBAction)bnt_left:(id)sender {
    calString=[calString stringByAppendingString:@"("];
    [_label_input setText:calString];
}

- (IBAction)bnt_back:(id)sender {
    int len = [calString length];
    if (len>1) {
        calString=[calString substringWithRange:NSMakeRange(0, len-1)];
        [_label_input setText:calString];

    }else{
        calString=@"";
        [_label_input setText:@"0"];

    }
    
}

- (IBAction)bnt_add:(id)sender {
    calString=[calString stringByAppendingString:@"+"];
    [_label_input setText:calString];
}

- (IBAction)bnt_mul:(id)sender {
    calString=[calString stringByAppendingString:@"x"];
    [_label_input setText:calString];
}

- (IBAction)bnt_exc:(id)sender {
    calString=[calString stringByAppendingString:@"÷"];
    [_label_input setText:calString];
}

- (IBAction)bnt_AC:(id)sender {
    [_label_input setText:@"0"];
    calString=@"";
    [_label_ans setText:@"0"];
    ansString=@"";
}

- (IBAction)bnt_min:(id)sender {
    calString=[calString stringByAppendingString:@"-"];
    [_label_input setText:calString];
}

- (IBAction)bnt_9:(id)sender {
    calString=[calString stringByAppendingString:@"9"];
    [_label_input setText:calString];
}

- (IBAction)bnt_8:(id)sender {
    calString=[calString stringByAppendingString:@"8"];
    [_label_input setText:calString];
}

- (IBAction)bnt_7:(id)sender {
    calString=[calString stringByAppendingString:@"7"];
    [_label_input setText:calString];
}

- (IBAction)bnt_neg:(id)sender {
}

- (IBAction)bnt_6:(id)sender {
    calString=[calString stringByAppendingString:@"6"];
    [_label_input setText:calString];
}

- (IBAction)bnt_5:(id)sender {
    calString=[calString stringByAppendingString:@"5"];
    [_label_input setText:calString];
}

- (IBAction)bnt_4:(id)sender {
    calString=[calString stringByAppendingString:@"4"];
    [_label_input setText:calString];
}

- (IBAction)bnt_3:(id)sender {
    calString=[calString stringByAppendingString:@"3"];
    [_label_input setText:calString];
}

- (IBAction)bnt_2:(id)sender {
    calString=[calString stringByAppendingString:@"2"];
    [_label_input setText:calString];
}

- (IBAction)bnt_1:(id)sender {
    calString=[calString stringByAppendingString:@"1"];
    [_label_input setText:calString];
}

- (IBAction)bnt_0:(id)sender {
    calString=[calString stringByAppendingString:@"0"];
    [_label_input setText:calString];
}

- (IBAction)bnt_dot:(id)sender {
    calString=[calString stringByAppendingString:@"."];
    [_label_input setText:calString];
}

- (IBAction)bnt_equal:(id)sender {
    ansString=[ViewController getAns:calString];
    [_label_ans setText:ansString];
    calString=@"";
    
}

+ (NSString*)getAns:(NSString*)str
{
    NSString *ans;
     double c;
    NSString *add = @"+";
    NSString *min = @"-";
    NSString *mul = @"x";
    NSString *exc = @"÷";
    NSString *mod = @"%";
    
    NSRange foundadd=[str rangeOfString:add options:NSCaseInsensitiveSearch];
    NSRange foundmin=[str rangeOfString:min options:NSCaseInsensitiveSearch];
    NSRange foundmul=[str rangeOfString:mul options:NSCaseInsensitiveSearch];
    NSRange foundexc=[str rangeOfString:exc options:NSCaseInsensitiveSearch];
    NSRange foundmod=[str rangeOfString:mod options:NSCaseInsensitiveSearch];
    NSLog(@"%d,%d",foundadd.location,foundadd.length);
    
    if(foundadd.length>0) {
        double  a= [[str substringWithRange:NSMakeRange(0,foundadd.location)] doubleValue];
        
        double  b= [[str substringWithRange:NSMakeRange(foundadd.location+1,(str.length-foundadd.location-1))] doubleValue];
        
        c = a+b;
    }else if(foundmin.length>0) {
        double  a= [[str substringWithRange:NSMakeRange(0,foundmin.location)] doubleValue];
        
        double  b= [[str substringWithRange:NSMakeRange(foundmin.location+1,(str.length-foundmin.location-1))] doubleValue];
        
        c = a-b;
        
    }else if(foundmul.length>0) {
        double  a= [[str substringWithRange:NSMakeRange(0,foundmul.location)] doubleValue];
        
        double  b= [[str substringWithRange:NSMakeRange(foundmul.location+1,(str.length-foundmul.location-1))] doubleValue];
        
        c = a*b;
        
    }else if(foundexc.length>0) {
        double  a= [[str substringWithRange:NSMakeRange(0,foundexc.location)] doubleValue];
        
        double  b= [[str substringWithRange:NSMakeRange(foundexc.location+1,(str.length-foundexc.location-1))] doubleValue];
        
        c = a/b;
        
    }else if(foundmod.length>0) {
        int  a= [[str substringWithRange:NSMakeRange(0,foundmod.location)] intValue];
        
        int  b= [[str substringWithRange:NSMakeRange(foundmod.location+1,(str.length-foundmod.location-1))] intValue];
        
        c = a%b;
        
    }else
    {
        c=0;
    }
    
    
    
    ans=[NSString stringWithFormat:@"%lf",c];
    
    return ans;
    
}
@end
