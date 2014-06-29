KTScannerView
=============

A simple view to scan barcodes (QR Code etc) via camera stream that utilize iOS 7's AVFoundation API.

The motivation to develop this view is to reuse this piece of code in a familiar API. The view extends `UIControl`
and can be used in a nib file or programmatically.

Installation
------------

Either copy the source to your project, or use `cocoapods` as explained below. See the example project for details.

How to get scanned values
-------------------------

Either observe `scannedValue` property or add an action to `UIControlEventValueChanged` event. Value changed event
is thrown when the scanned value is available. 

Events that this view throws are following:

 * UIControlEventValueChanged: After scanned value is changed
 * UIControlEventTouchDown: After user tap to focus

Cocoapods
---------

Add following to your `Podfile`

    pod 'KTScannerView', :git => 'https://github.com/laplacesdemon/KTScannerView.git'
