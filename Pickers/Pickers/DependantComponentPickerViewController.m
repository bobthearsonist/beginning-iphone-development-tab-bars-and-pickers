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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
