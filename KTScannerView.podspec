Pod::Spec.new do |s|
    s.name         = "KTScannerView"
    s.version      = "0.1"
    s.summary      = "A simple view to scan barcodes (QR Code etc)"

    s.description  = <<-DESC
    A simple view to scan barcodes (QR Code etc) via camera stream that utilize iOS 7's AVFoundation API.
    DESC

    s.homepage     = "https://github.com/laplacesdemon/KTScannerView"
    s.license      = { :type => 'Apache', :file => 'LICENSE' }
    s.authors      = { "Suleyman Melikoglu" => "suleyman@melikoglu.info"}
    s.platform     = :ios, '7.0'
    s.source       = { :git => "https://github.com/laplacesdemon/KTScannerView" }
    s.source_files  = 'KTScannerView/*.{h,m}'
    s.requires_arc = true
end
