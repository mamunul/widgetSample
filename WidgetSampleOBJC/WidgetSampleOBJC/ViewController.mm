//
//  ViewController.m
//  WidgetSampleOBJC
//
//  Created by New User on 7/3/21.
//

#import "ViewController.h"
#import "WidgetSampleOBJC-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)openWidgetEditorView:(id)sender {
    SwiftImporter *vc = [SwiftImporter new];

    UIViewController *controller = [vc loadSwiftUI];
    [self presentViewController:controller animated:YES completion:^{
        NSLog(@"presented");
    }];
}

@end
