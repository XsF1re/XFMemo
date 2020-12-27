//
//  Memo+CoreDataProperties.m
//  XFMemoObjC
//
//  Created by xsf1re on 2020/12/26.
//
//

#import "Memo+CoreDataProperties.h"

@implementation Memo (CoreDataProperties)

+ (NSFetchRequest<Memo *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Memo"];
}

@dynamic content;
@dynamic insertDate;

@end
