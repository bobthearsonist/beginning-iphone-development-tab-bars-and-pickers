//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by admin on 9/9/16.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

enum Pickers {Sandwich=0,Bread=1};

@interface DoubleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *sandwichPicker;
@property (strong, nonatomic) NSArray *sandwiches;

@property (weak, nonatomic) IBOutlet UIPickerView *breadPicker;
@property (strong, nonatomic) NSArray* breads;
@end

@implementation DoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sandwiches = @[@"Ham",@"Turkey"];
    self.breads = @[@"Rye",@"Wheat"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString* selectedSandwich = self.sandwiches[[self.sandwichPicker selectedRowInComponent:0]];
    NSString* selectedBread = self.breads[[self.breadPicker selectedRowInComponent:0]];
    
    UIAlertController* halAlert = [UIAlertController alertControllerWithTitle:@"Sorry." message:@"I am afraid I cant do that." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [halAlert addAction:okay];
    
    //TODO find out how to define the handler seperately instead of inline
    UIAlertAction* sudo =[UIAlertAction actionWithTitle:@"sudo sandwich" style:UIAlertActionStyleCancel handler:    ^(UIAlertAction * sudoSandwich){
        UIAlertController* sudoController = [UIAlertController alertControllerWithTitle:@"Here's your sandwich jerk" message:[NSString stringWithFormat:@"A %@ on %@ sandiwch.",selectedSandwich,selectedBread] preferredStyle:UIAlertControllerStyleAlert];
        [sudoController addAction:[UIAlertAction actionWithTitle:@"Thanks" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:sudoController animated:NO completion:nil];
    }];
    [halAlert addAction:sudo];
    
    [self presentViewController:halAlert animated:YES completion:nil];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger) numberOfComponentsInPickerView:( UIPickerView *) pickerView
{
    return 1;
}
- (NSInteger) pickerView:( UIPickerView *) pickerView numberOfRowsInComponent:( NSInteger) component
{
    switch (component) {
        case Sandwich:
        {
            return [self.sandwiches count];
            break;
        }
        case Bread:
        {
            return [self.breads count];
            break;
        }
        default:
            return 0;
    }
}

#pragma mark Picker Delegate Methods
- (NSString *) pickerView:( UIPickerView *) pickerView titleForRow:( NSInteger) row forComponent:( NSInteger) component
{
    switch (component) {
        case Sandwich:
        {
            return self.sandwiches[row];
            break;
        }
        case Bread:
        {
            return self.breads[row];
            break;
        }
        default:
            return 0;
    }
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
