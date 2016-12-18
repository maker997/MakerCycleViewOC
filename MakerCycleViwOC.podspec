Pod::Spec.new do |s|

    s.name         = "MakerCycleViewOC"
    s.version      = "1.0"
    s.summary      = "An simple cycle view can display in your app banner"
    s.description  = "the use of MakerCycleViewOC is too simple,what you think and how it do"
    s.homepage     = "https://github.com/maker997/MakerCycleViwOC"
    s.license = "MIT"
    s.author = { "maker" => "806160921@qq.com" }
    s.platform = :ios, "9.0"
    s.source = { :git => "https://github.com/maker997/MakerCycleViwOC.git", :tag => "1.0" }
    s.source_files = ["lib/CycleCollectionCell.xib","lib/**/*.{h,m}","lib/MakerCycleView.xib"]
    s.requires_arc = true
end
