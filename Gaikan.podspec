Pod::Spec.new do |s|
  s.name                    = "Gaikan"
  s.version                 = "0.1.0"
  s.source                  = { :git => "https://github.com/akane/Gaikan.git",
  		     	                    :tag => s.version.to_s }

  s.summary                 = "View styling for iOS. Inspired by ReactJS and CSS modules."
  s.description             = "Easily create (interchangeable) styles for your views using flexible swift structs. "
  s.homepage                = s.source[:git].to_s
  s.license                 = { :type => "MIT", :file => "LICENSE" }
  s.author                  = 'pjechris', 'akane'

  s.ios.deployment_target   = "8.0"
  s.source_files            = "Gaikan/**/*.{swift}"
  s.requires_arc            = true

  s.dependency		    'KVOController', '~> 1.x'
end
