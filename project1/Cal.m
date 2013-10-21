//
//  Cal.m
//  MyCal
//
//  Created by hqr on 13-10-12.
//  Copyright (c) 2013年 hqr. All rights reserved.
//

#import "Cal.h"

@implementation Cal

char *cWeek[8]={"日","一","二","三","四","五","六"};
char *cMonth[13]={"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};

+(void) getOne:(int) year Month:(int) month
{
    
    NSUInteger dayOfWeek = [Cal getDayOf:month OneWeek:year];
    
    int daysOfMonth=[Cal getMonth:month Days:year];

    printf("     %s %d\n",cMonth[month-1],year);
    
    
    for (int i=0; i<7; i++) {//输出"日","一","二","三","四","五","六"
        printf("%s ",cWeek[i]);
    }
    printf("\n");
    
    for (int i=0; i<dayOfWeek-1; i++) {//输出每月前空格
        printf("   ");
    }
    
    for (int i=1; i<=daysOfMonth; i++) {
        if (i<10) {//1-9前面补空格
            printf(" %d ",i);
        } else {
            printf("%d ",i);
        }
        
        if ((i+dayOfWeek-1)%7==0) {//每7天换行
            printf("\n");
        }
    }
    printf("\n");
    
    
}

+ (int) getMonth:(int) month Days:(int) year//获取一个月的天数
{
    int daysOfMonth;
    
    if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12) {
        daysOfMonth=31;
    } else if(month==2){
        if ((year%4==0&&year%100!=0)||(year%400==0)) {
            daysOfMonth=29;
        }else{
            daysOfMonth=28;
        }
    }else{
        daysOfMonth=30;
    }
    
    return daysOfMonth;
}

+ (NSUInteger) getDayOf:(int) month OneWeek:(int) year//获取每月第一天是一周中的第几天
{
 
    NSDateComponents *comp =[[NSDateComponents alloc] init];
    [comp setYear:year];
    [comp setMonth:month];
    [comp setDay:1];
    NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *mydate = [g dateFromComponents:comp];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSUInteger dayOfWeek =[cal ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:mydate];
    
    return dayOfWeek;
}


+(void) getOneYear:(int) year
{
    for (int i=0; i<4; i++) {//4行3个月
        for (int j=-2; j<6; j++) {//周
            for (int k=0; k<3; k++) {//横排
                
                [Cal printWeek:j Month:i*3+k+1 Year:year];
                printf(" ");
                
            }printf("\n");
        }
    }
    
}

+(void) printWeek:(int)week Month:(int)month Year:(int)year
{
    NSUInteger dayOfWeek = [Cal getDayOf:month OneWeek:year];
    
    
    if (week==-2) {
    {
        if(month<11)//输出顶端月份
        {
            printf("        %s          ",cMonth[month-1]);
        }else
        {
            printf("      %s          ",cMonth[month-1]);
        }
        
        
    }
    }else if(week==-1)
    {
        printf("日 一 二 三 四 五 六 ");
    }else if (week==0)
    {
       // printf("%dyue第%d天",month,dayOfWeek);

        for (int i=0; i<dayOfWeek-1; i++) {//输出每月前空格
            printf("   ");
        }
        for (int i=1; i<=8-dayOfWeek; i++) {
            if (i<10) {//1-9前面补空格
                printf(" %d ",i);
            } else {
                printf("%d ",i);
            }
        }
        
    }else{
        int daysOfMonth =[Cal getMonth:month Days:year];
        NSUInteger firstDayOfLine=(week-1)*7+8-dayOfWeek+1;//计算每行其实第几天
        
        for (int i=0; i<7; i++) {
            if (firstDayOfLine+i>daysOfMonth) {
                printf("   ");
            }else{
                if ((i+firstDayOfLine)<10) {//1-9前面补空格
                    printf(" %d ",firstDayOfLine+i);
                } else {
                    printf("%d ",firstDayOfLine+i);
                }
            }
        }
    }
    
    
}






@end
