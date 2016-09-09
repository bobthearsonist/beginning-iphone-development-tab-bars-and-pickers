//
//  DatePickerViewController.m
//  Pickers
//
//  Created by admin on 9/9/16.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString* alertMessage = [NSString stringWithFormat:@"The date and time you selected is %@",self.datePicker.date];
    UIAlertController* datePicked = [UIAlertController       alertControllerWithTitle:@"Date and Time Selected" message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* confirmationAction = [UIAlertAction actionWithTitle:@"What a great date!" style:UIAlertActionStyleDefault handler:nil];
    [datePicked addAction:confirmationAction];
    [self presentViewController:datePicked animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
