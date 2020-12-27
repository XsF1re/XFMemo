//
//  Memo+CoreDataProperties.h
//  XFMemoObjC
//
//  Created by xsf1re on 2020/12/26.
//
//

#import "Memo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Memo (CoreDataProperties)

+ (NSFetchRequest<Memo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSDate *insertDate;

@end

NS_ASSUME_NONNULL_END
