//
//  DataManager.h
//  XFMemoObjC
//
//  Created by xsf1re on 2020/12/26.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Memo+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

+ (instancetype)sharedInstance;

@property (readonly, strong) NSManagedObjectContext* mainContext;
@property (strong, nonatomic) NSMutableArray* memoList;

- (void)fetchMemo;
- (void)addNewMemo:(NSString*)memo;
- (void)deleteMemo:(Memo*)memo;

@end

NS_ASSUME_NONNULL_END
