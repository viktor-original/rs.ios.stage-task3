#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString * buffer1 = [NSMutableString stringWithString:string1];
    NSMutableString * buffer2 = [NSMutableString stringWithString:string2];
    NSMutableString * finalStr = [NSMutableString new];
    
    do {
        
        if ([buffer1 length] < 1) {
            
            [finalStr appendString: buffer2];
            break;
            
        } else if ([buffer2 length] < 1) {
            
            [finalStr appendString: buffer1];
            break;
            
        }
        if ([[buffer1 substringToIndex: 1] UTF8String][0] <= [[buffer2 substringToIndex: 1] UTF8String][0]) {
            
            [finalStr appendString: [buffer1 substringToIndex: 1]];
            buffer1 = [[buffer1 substringFromIndex: 1] copy];
            
        } else {
            
            [finalStr appendString: [buffer2 substringToIndex: 1]];
            buffer2 = [[buffer2 substringFromIndex: 1] copy];
            
        }
        
    } while ([buffer1 length] > 0 || [buffer2 length] > 0);
    
    finalStr = [finalStr copy];
    
    return finalStr;
}
@end
