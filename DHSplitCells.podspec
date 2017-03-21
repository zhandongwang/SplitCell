Pod::Spec.new do |s|
  s.name             = 'DHSplitCells'
  s.version          = '0.1.2'
  s.summary          = 'DHSplitCells is cell split module of CloudCash App.'

  s.description      = <<-DESC
                        DHSplitCells is cell split module of CloudCash App on iOS.
                       DESC

  s.homepage         = 'http://git.2dfire-inc.com/ccd-iOS/DHSplitCells'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fengli' => 'fengli@2dfire.com' }
  s.source           = { :git => 'git@git.2dfire-inc.com:ccd-iOS/DHSplitCells.git', :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.source_files = 'DHSplitCells/Classes/**/*'
  s.requires_arc = true

  # s.frameworks = 'UIKit', 'MapKit'

end
