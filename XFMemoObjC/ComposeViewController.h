//
//  ComposeViewController.h
//  XFMemoObjC
//
//  Created by xsf1re on 2020/12/26.
//

#import <UIKit/UIKit.h>
#import "Memo+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController

@property (strong, nonatomic) Memo* editTarget;

@end

NS_ASSUME_NONNULL_END
