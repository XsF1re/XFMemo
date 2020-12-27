//
//  DetailViewController.h
//  XFMemoObjC
//
//  Created by xsf1re on 2020/12/26.
//

#import <UIKit/UIKit.h>
#import "Memo.h"
#import "Memo+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Memo* memo;

@end

NS_ASSUME_NONNULL_END
