Pod::Spec.new do |s|
    s.name             = 'DDMaterial'
    s.version          = '0.1.1'
    s.swift_version    = '4.2'
    s.summary          = 'A UI/UX framework for creating beautiful applications.'
    s.homepage         = 'https://github.com/DDKit/DDMaterial'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'duanchanghe@gmail.com' => 'ddkit' }
    s.source           = { :git => 'https://github.com/DDKit/DDMaterial.git', :tag => s.version.to_s }
    s.ios.source_files = 'Sources/**/*.swift'
    s.requires_arc     = true
    s.resource_bundles = {
        'com.cosmicmind.material.icons' => ['Sources/**/*.xcassets'],
        'com.cosmicmind.material.fonts' => ['Sources/**/*.ttf']
    }
end

