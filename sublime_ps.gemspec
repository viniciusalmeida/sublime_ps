Gem::Specification.new do |s|
  s.name        = "sublime_ps"
  s.version     = "0.1.0"
  s.description = "SublimeText preferences switch"
  s.summary     = "A simple way to change preferences of SublimeText"
  s.author      = "Vinícius Almeida"
  s.email       = "vinialm88@gmail.com"
  s.homepage    = "https://github.com/viniciusalmeida/sublime_ps"
  s.files       = Dir["{lib/**/*.rb,bin/sublime_ps,*.gemspec}"]
  s.metadata    = {
    "issue_tracker" => "https://github.com/viniciusalmeida/sublime_ps/issues"
  }
  s.executables = ['sublime_ps']
  s.license     = "MIT"
  s.add_runtime_dependency(%q<thor>, ["~> 0.19.1"])
end
