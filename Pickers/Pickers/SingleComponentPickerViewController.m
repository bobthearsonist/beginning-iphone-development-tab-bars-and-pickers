//
//  SingleComponentPickerViewController.m
//  Pickers
//
//  Created by admin on 9/9/16.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong,nonatomic) NSArray *characterNames;
@end

@implementation SingleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.characterNames = @[@"Luke",@"Leia",@"Han",@"Chewbacca",@"Artoo",@"Threepio",@"Lando"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString* selected = self.characterNames[row];
    NSString* title = [NSString stringWithFormat:@"You selected %@",selected];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:@"Thank you for choosing." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"youre welcome" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - 
#pragma mark Picker Data Source Methods 
- (NSInteger) numberOfComponentsInPickerView:( UIPickerView *) pickerView
{
    return 1;
}
- (NSInteger) pickerView:( UIPickerView *) pickerView numberOfRowsInComponent:( NSInteger) component
{
    return [self.characterNames count];
}
#pragma mark Picker Delegate Methods 
- (NSString *) pickerView:( UIPickerView *) pickerView titleForRow:( NSInteger) row forComponent:( NSInteger) component
{
    return self.characterNames[row];
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
