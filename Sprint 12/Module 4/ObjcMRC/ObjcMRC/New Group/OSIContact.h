
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSIContact : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *emailAddress;
@property (nonatomic, copy) NSString *phoneNumber;

- (instancetype)initWithName:(NSString *)firstName lastName:(NSString *)lastName emailAddress:(NSString *)emailAddress phoneNumber:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
