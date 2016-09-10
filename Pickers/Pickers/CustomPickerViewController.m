//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by admin on 9/9/16.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "CustomPickerViewController.h"

NSString *EmptyLabel =  @" ";

@interface CustomPickerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *customPicker;
@property (strong,nonatomic) NSArray* images;
@end

@implementation CustomPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = @[[UIImage imageNamed:@"seven"],
                    [UIImage imageNamed:@"bar"],
                    [UIImage imageNamed:@"crown"],
                    [UIImage imageNamed:@"cherry"],
                    [UIImage imageNamed:@"lemon"],
                    [UIImage imageNamed:@"apple"]];
    self.winLabel.text = EmptyLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)spin:(UIButton *)sender {
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    
    for (int i = 0; i < 5; i++)
    {
        int newValue = arc4random_uniform(( uint)[ self.images count]);
        
        numInRow = (newValue == lastVal) ? numInRow+1 : 1;
        
        lastVal = newValue;
        [self.customPicker selectRow:newValue inComponent:i animated:YES];
        [self.customPicker reloadComponent:i];
        if (numInRow >= 3)
        {
            win = YES;
        }
    }
    
    self.winLabel.text = (win) ? @" WINNER!": EmptyLabel;
}

#pragma mark -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.images count];
}

#pragma mark Picker Delegate Methods
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    return [[UIImageView alloc] initWithImage:self.images[row]];
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 64;
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
