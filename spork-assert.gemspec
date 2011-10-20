Gem::Specification.new do |s|
  s.name = 'spork-assert'
  s.description = 'Use spork with the assert testing framework'
  s.summary = s.description
  s.version = '0.0.1'

  s.authors = ["Jordan Bach"]
  s.email = ["jordanbach@gmail.com"]
  s.homepage = 'https://github.com/teaminsight/spork-assert'

  s.executables = ["sporktest"]
  s.files = ['bin/sporktest', 'lib/spork/test_framework/assert.rb']
  s.require_paths = ['lib']
  s.rubyforge_project = 'spork-assert'

  s.add_dependency('spork', '~> 0.9.0.rc')
end
