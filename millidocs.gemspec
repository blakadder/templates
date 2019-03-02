# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "millidocs"
  spec.version       = "0.2.5"
  spec.authors       = ["Alexander Heimbuch"]
  spec.email         = ["github@heimbu.ch"]

  spec.summary       = %q{Minimal Jekyll documentation theme based on Milligram and Prism}
  spec.homepage      = "https://github.com/alexander-heimbuch/millidocs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.4"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
