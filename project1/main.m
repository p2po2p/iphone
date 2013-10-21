//
//  main.m
//  MyCal
//
//  Created by hqr on 13-10-12.
//  Copyright (c) 2013年 hqr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cal.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *now;
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
        NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        now=[NSDate date];
        comps = [calendar components:unitFlags fromDate:now];
        
        
        if(argc==1) {//一个参数
            //NSLog(@"1个参数");
            int year=[comps year];
            int month = [comps month];
           
            [Cal getOne:year Month:month];
        } else if(argc==2){
            //NSLog(@"2个参数");
            int year = atoi(argv[1]);
            if (year>9999 || year<1) {
                printf("year %s not in range 1..9999",argv[2]);
            }else
            {
                [Cal getOneYear:year];
            }
        } else if(argc==3){
            //NSLog(@"3个参数");
            if (strcmp(argv[1], "-m")==0) {
                int year = [comps year];
                int month = atoi(argv[2]);
                if (month>12 || month<1) {
                    printf("%s is neither a month number (1..12) nor a name\n",argv[3]);
                }else{
                    [Cal getOne:year Month:month];
                }
            }else{
               
                int month = atoi(argv[1]);
                int year = atoi(argv[2]);
                if (year>9999 || year<1) {
                    printf("year %s not in range 1..9999",argv[2]);
                }
                else if (month>12 || month<1) {
                    printf("%s is neither a month number (1..12) nor a name\n",argv[2]);
                }else{
                    [Cal getOne:year Month:month];
                }
            }
            
        }else{
            printf("请输入正确格式！");
        }
        
    }
    return 0;
}

