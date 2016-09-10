//
//  DependantComponentPickerViewController.m
//  Pickers
//
//  Created by admin on 9/9/16.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "DependantComponentPickerViewController.h"

enum Pickers {State=0,Zip=1};

@interface DependantComponentPickerViewController ()
@property (strong,nonatomic) NSDictionary* stateZips;
@property (strong,nonatomic) NSArray* states;
@property (strong,nonatomic) NSArray* zips;
@property (weak, nonatomic) IBOutlet UIPickerView *dependantPicker;
@end

@implementation DependantComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.stateZips = [self loadStatesAndZipsFromFile];
    self.states = [[self.stateZips allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.zips = self.stateZips[self.states[0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSDictionary*) loadStatesAndZipsFromFile{
    NSURL* plistURL = [[NSBundle mainBundle] URLForResource:@"statedictionary" withExtension:@"plist"];
    return [NSDictionary dictionaryWithContentsOfURL:plistURL];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString* state = self.states[[self.dependantPicker selectedRowInComponent:State]];
    NSString* zip = self.zips[[self.dependantPicker selectedRowInComponent:Zip]];
    
    NSString* title = [NSString stringWithFormat:@"You selected zip code %@.",zip];
    NSString* message = [NSString stringWithFormat:@"%@ is in %@",zip,state];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case State:
            return [self.states count];
        case Zip:
            return [self.zips count];
        default:
            return 0;
    }
}

#pragma mark Picker Delegate Methods
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case State:
            return self.states[row];
        case Zip:
            return self.zips[row];
        default:
            return @"Error";
    }
}
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == State)
    {
        self.zips = self.stateZips[self.states[row]];
        [self.dependantPicker reloadComponent:Zip];
        [self.dependantPicker selectRow:0 inComponent:Zip animated:YES];
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
