#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if ((monthNumber > 12) || (monthNumber < 1)) {
        return 0;
    }
    
    NSDateComponents* comps = [[NSDateComponents alloc]init];
    [comps setMonth:monthNumber];

    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDate* date1 = [calendar dateFromComponents:comps];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MMMM";
    
    return [formatter stringFromDate:date1];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    NSDate* date1 = [formatter dateFromString:date];
    formatter.dateFormat = @"dd";
    
    NSString* day = [formatter stringFromDate:date1];
    
    return [day integerValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_BY"];
    formatter.dateFormat = @"eee";
    
    NSString* dayOfWeek = [formatter stringFromDate:date];
    
    return dayOfWeek;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDate* dateNow = [NSDate date];
    NSCalendar* calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSInteger weekFromDate = [calendar component:NSCalendarUnitWeekOfYear fromDate:date];
    NSInteger currentWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:dateNow];
    
    if (weekFromDate != currentWeek) {
        return NO;
        
    } else {
        return YES;
    }
}

@end
