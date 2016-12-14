Pod::Spec.new do |s|

    s.name         = "MakerCycleViewOC"
    s.version      = "1.0"
    s.summary      = "An simple cycle view can display in your app banner"
    s.description  = "the use of MakerCycleViewOC is too simple,what you think and how it do"
    s.homepage     = "https://github.com/maker997/MakerCycleViwOC"

    # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.license = { :type => "Apache Lience", :file => "LICENSE" }
    # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.author = { "maker" => "https://github.com/maker997" }
    # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.platform = :ios, "9.0"
    # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.source = { :git => "https://github.com/maker997/MakerCycleViwOC.git", :tag => "1.0" }
    # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.source_files = ["lib/CycleCollectionCell.xib","lib/*.{h,m}","lib/MakerCycleView.xib"]
    # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.requires_arc = true
end
