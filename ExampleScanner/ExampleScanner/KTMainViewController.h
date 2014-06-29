//
//  KTMainViewController.h
//  ExampleScanner
//
//  Created by Suleyman Melikoglu on 29/06/14.
//  Copyright (c) 2014 Katu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTScannerView;

@interface KTMainViewController : UIViewController

@property (nonatomic, weak) IBOutlet KTScannerView *scannerView;
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;

- (IBAction)onTorchSwitch:(id)sender;
- (IBAction)onScannerDidScan:(id)sender;
- (IBAction)onScannerDidTapToFocus:(id)sender;

@end
