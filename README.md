KTScannerView
=============

A simple view to scan barcodes (QR Code etc) via camera stream that utilize iOS 7's AVFoundation API.

The motivation to develop this view is to reuse this piece of code in a familiar API. The view extends `UIControl`
and can be used in a nib file or programmatically.

Installation
------------

Add following to your `Podfile`

    pod 'KTScannerView'
    
Alternatively copy the source to your project.

Example
-------

See the example project for details. For the impatient, use it just another view and get scanned value from its value changed event.

    - (void)viewDidLoad
    {
        KTScannerView *scannerView = [KTScannerView new]; // also set its frame or use auto layout.
        [self.scannerView addTarget:self
                         action:@selector(onScannerDidScan:)
               forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:scannerView];
    }
    
    - (IBAction)onScannerDidScan:(KTScannerView *)sender
    {
        NSLog(@"scanned value is %@", sender.scannedValue);
    }

Events
------

Events that this view throws are following:

 * UIControlEventValueChanged: After scanned value is changed
 * UIControlEventTouchDown: After user tap to focus

Alternatively, you can observe `scannedValue` property to get the changes to the scanned value instead of adding an event handler.


