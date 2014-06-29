Pod::Spec.new do |s|
  s.name         = "KTScannerView"
  s.version      = "1.0"
  s.summary      = "A simple view to scan barcodes (QR Code etc) via camera stream that utilize iOS 7's AVFoundation API."

  s.description  = <<-DESC
                KTScannerView uses iOS7's AVFoundation API to scan barcodes with a camera preview.

                   * Scan barcodes
                   * Familiar API. KTScannerView extends UIControl and throw events.
                   * Provides shortcuts to turn on the torch or check if camera is available.
                   * Can be used programmatically as well as in nib files.y
                   DESC

  s.homepage     = "https://github.com/laplacesdemon/KTScannerView"
  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author             = { "Suleyman Melikoglu" => "suleyman@melikoglu.info" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/laplacesdemon/KTScannerView.git", :tag => "1.0" }
  s.source_files  = 'KTScannerView/*.{h,m}'
  s.framework  = "AVFoundation"
  s.requires_arc = true
end
