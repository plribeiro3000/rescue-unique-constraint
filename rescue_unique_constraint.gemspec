# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rescue_unique_constraint-p/version'

Gem::Specification.new do |spec|
  spec.name          = 'rescue_unique_constraint-p'
  spec.version       = RescueUniqueConstraint::VERSION
  spec.authors       = ['Tam Dang', 'Yan Pritzker']
  spec.email         = ['tam.dang@reverb.com', 'yan@reverb.com']
  spec.summary       = 'Turns ActiveRecord::RecordNotUnique errors into ActiveRecord errors'
  spec.description   = 'Rescues unique constraint violations and turns them into ActiveRecord errors'
  spec.homepage      = 'https://github.com/plribeiro3000/rescue_unique_contraint'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
