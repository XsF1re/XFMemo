//
//  ComposeViewController.m
//  XFMemoObjC
//
//  Created by xsf1re on 2020/12/26.
//

#import "ComposeViewController.h"
#import "Memo.h"
#import "DataManager.h"

@interface ComposeViewController ()

- (IBAction)close:(id)sender;
- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *memoTextView;

@property (strong, nonatomic) id willShowToken;
@property (strong, nonatomic) id willHideToken;

@end

@implementation ComposeViewController

- (void) dealloc {
    
    if (self.willShowToken) {
        [[NSNotificationCenter defaultCenter] removeObserver:self.willShowToken];
    }
    
    if (self.willHideToken) {
        [[NSNotificationCenter defaultCenter] removeObserver:self.willHideToken];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.memoTextView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.memoTextView resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.editTarget != nil) {
        self.navigationItem.title = @"메모 편집";
        self.memoTextView.text = self.editTarget.content;
    } else {
        self.navigationItem.title = @"새 메모";
        self.memoTextView.text = @"";
    }
    
    self.willShowToken = [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
       
        CGFloat height = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        
        UIEdgeInsets inset = self.memoTextView.contentInset;
        inset.bottom = height;
        self.memoTextView.contentInset = inset;
        
        inset = self.memoTextView.scrollIndicatorInsets;
        inset.bottom = height;
        self.memoTextView.scrollIndicatorInsets = inset;
    }];
    
    self.willHideToken = [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        UIEdgeInsets inset = self.memoTextView.contentInset;
        inset.bottom = 0;
        self.memoTextView.contentInset = inset;
        
        inset = self.memoTextView.scrollIndicatorInsets;
        inset.bottom = 0;
        self.memoTextView.scrollIndicatorInsets = inset;
        
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    NSString* memo = self.memoTextView.text;
    
    if (self.editTarget != nil) {
        self.editTarget.content = memo;
        [[DataManager sharedInstance] saveContext];
    } else {
        [[DataManager sharedInstance] addNewMemo:memo];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
