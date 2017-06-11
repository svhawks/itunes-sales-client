# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sales_client/version'

Gem::Specification.new do |spec|
  spec.name          = "sales_client"
  spec.version       = SalesClient::VERSION
  spec.authors       = ["Sadik Ay"]
  spec.email         = ["sadikay91@gmail.com"]

  spec.summary       = %q{Get app sales and analytics from itunes connect}
  spec.description   = %q{A fastlane extension to get your app transactions }
  spec.homepage      = "https://github.com/sadikay/sales_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
