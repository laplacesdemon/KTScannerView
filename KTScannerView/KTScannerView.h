//
//  KTScannerView.h
//  BPlus
//
//  Created by Suleyman Melikoglu on 28/06/14.
//  Copyright (c) 2014 Katu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


/**
 *  A view that will display the camera stream to detect barcodes (qr codes)
 *  
 *  Events that this view throws are following:
 *      UIControlEventValueChanged: After scanned value is changed
 *      UIControlEventTouchDown: After user tap to focus
 */
@interface KTScannerView : UIControl <AVCaptureMetadataOutputObjectsDelegate>

/**
 *  If YES, the camera will try to focus on the tapped point
 *  This feature will be only effective if the device supports point of interest focusing.
 *  Defaults to YES
 */
@property (nonatomic, getter = isTouchToFocusEnabled) BOOL touchToFocus;

/**
 *  Indicates if it should start scanning codes. Defaults to YES
 */
@property (nonatomic, getter = isAutoStartEnabled) BOOL autoStart;

/**
 *  The result of the scanner. This value can be observed or you can use value changed event.
 */
@property (nonatomic, strong) NSString *scannedValue;

/**
 *  Helper method that returns YES if it is available
 *
 *  @discussion
 *  This property can be used to test if the camera is available, so one can display
 *  appopriate message to user
 *
 *  @return YES if camera is available
 */
+ (BOOL)isCameraAvailable;

/**
 *  Manually start scanning
 */
- (void)startScanning;

/**
 *  Manually stop scanning
 */
- (void)stopScanning;

/**
 *  Use to turn on/off the torch (light)
 *
 *  @param activateTorch YES to turn the torch on
 */
- (void)torch:(BOOL)activateTorch;

@end
