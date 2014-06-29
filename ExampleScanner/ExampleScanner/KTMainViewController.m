//
//  KTMainViewController.m
//  ExampleScanner
//
//  Created by Suleyman Melikoglu on 29/06/14.
//  Copyright (c) 2014 Katu. All rights reserved.
//

#import "KTMainViewController.h"
#import "KTScannerView.h"


@implementation KTMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Focus to point of interest on touch. Default is YES.
    self.scannerView.touchToFocus = YES;
    
    // If you don't want the scanner to start scanning immediately, set it to NO
    // Default YES
    self.scannerView.autoStart = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (![KTScannerView isCameraAvailable]) {
        UILabel *noCameraLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scannerView.frame), CGRectGetHeight(self.scannerView.frame))];
        noCameraLabel.textColor = [UIColor whiteColor];
        noCameraLabel.textAlignment = NSTextAlignmentCenter;
        noCameraLabel.backgroundColor = [UIColor clearColor];
        noCameraLabel.text = NSLocalizedString(@"No camera!", nil);
        [self.scannerView addSubview:noCameraLabel];
    }
}

- (IBAction)onTorchSwitch:(id)sender
{
    UISwitch *torchSwitch = (UISwitch *)sender;
    [self.scannerView torch:torchSwitch.on];
}

- (IBAction)onScannerDidScan:(id)sender
{
    self.resultLabel.text = self.scannerView.scannedValue;
}

- (IBAction)onScannerDidTapToFocus:(id)sender
{
    NSLog(@"tapped to focus");
}

@end
