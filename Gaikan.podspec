Pod::Spec.new do |s|
  s.name                    = "Gaikan"
  s.version                 = "0.7.0"
  s.source                  = { :git => "https://github.com/akane/Gaikan.git",
  		     	                    :tag => s.version.to_s }

  s.summary                 = "Declarative view styling in Swift."
  s.description             = "Powerful styling capabilities using a declarative DSL in Swift. Inspired by ReactJS and CSS modules."
  s.homepage                = s.source[:git].to_s
  s.license                 = { :type => "MIT", :file => "LICENSE" }
  s.author                  = 'pjechris', 'akane'

  s.ios.deployment_target   = "8.0"
  s.source_files            = "Gaikan/**/*.{swift}"
  s.requires_arc            = true

  s.dependency		    'KVOController', '~> 1.x'
end
