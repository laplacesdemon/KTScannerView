//
//  KTScannerView.m
//
//  Created by Suleyman Melikoglu on 28/06/14.
//  Copyright (c) 2014 Katu. All rights reserved.
//

#import "KTScannerView.h"


@interface KTScannerView ()

@property (strong, nonatomic) AVCaptureSession* session;

- (void)setUp;
- (void)focus:(CGPoint)aPoint;

@end

@implementation KTScannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.isTouchToFocusEnabled) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        [self focus:point];
    }
}

#pragma mark - private methods

- (void)setUp
{
    self.autoStart = YES;
    self.touchToFocus = YES;
    
    self.session = [[AVCaptureSession alloc] init];
    AVCaptureDevice *videoCaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoCaptureDevice error:&error];
    if(videoInput)
        [self.session addInput:videoInput];
    else
        NSLog(@"Error: %@", error);
    
    AVCaptureMetadataOutput *metadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [self.session addOutput:metadataOutput];
    [metadataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [metadataOutput setMetadataObjectTypes:[metadataOutput availableMetadataObjectTypes]];
    //[metadataOutput setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    previewLayer.frame = self.layer.bounds;
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.layer addSublayer:previewLayer];
    
    if (self.isAutoStartEnabled)
        [self.session startRunning];
}

- (void)focus:(CGPoint)aPoint
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([device isFocusPointOfInterestSupported] &&
       [device isFocusModeSupported:AVCaptureFocusModeAutoFocus]) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        double screenWidth = screenRect.size.width;
        double screenHeight = screenRect.size.height;
        double focus_x = aPoint.x/screenWidth;
        double focus_y = aPoint.y/screenHeight;
        if([device lockForConfiguration:nil]) {
            [self sendActionsForControlEvents:UIControlEventTouchDown];
            [device setFocusPointOfInterest:CGPointMake(focus_x,focus_y)];
            [device setFocusMode:AVCaptureFocusModeAutoFocus];
            if ([device isExposureModeSupported:AVCaptureExposureModeAutoExpose]){
                [device setExposureMode:AVCaptureExposureModeAutoExpose];
            }
            [device unlockForConfiguration];
        }
    }
}

#pragma mark - public methods

- (void)startScanning
{
    [self.session startRunning];
}

- (void)stopScanning
{
    [self.session stopRunning];
}

- (void)torch:(BOOL)activateTorch
{
  	AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    if ([device hasTorch] ) {
        if ( activateTorch ) {
            [device setTorchMode:AVCaptureTorchModeOn];
        } else {
            [device setTorchMode:AVCaptureTorchModeOff];
        }
    }
    [device unlockForConfiguration];
}

+ (BOOL)isCameraAvailable
{
    NSArray *videoDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    return [videoDevices count] > 0;
}

#pragma mark - capture delegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    for(AVMetadataObject *metadataObject in metadataObjects)
    {
        AVMetadataMachineReadableCodeObject *readableObject = (AVMetadataMachineReadableCodeObject *)metadataObject;
        if([metadataObject.type isEqualToString:AVMetadataObjectTypeQRCode])
        {
            self.scannedValue = [readableObject stringValue];
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }
}

@end
