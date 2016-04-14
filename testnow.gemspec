
Gem::Specification.new do |s|
	s.name				=	'testnow'
	s.version			=	File.read(File.expand_path("../lib/testnow/version", __FILE__))
	s.date				=	'2016-04-14'
	s.summary			=	'TestNow helper'
	s.description		=	'A gem to configure your Ruby Selenium suite for TestNow'
	s.authors			=	["Kaushal Rupani"]
	s.email				=	'kushrupani@live.com'
	s.files				=	Dir["lib/*.rb"] + Dir["lib/*/*.rb"] + Dir["data/*.xpi"] + %w(README.md LICENCE)
  s.test_files  = `git ls-files -- {spec,features}/*`.split("\n")
  s.executable  = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.homepage		=	"https://github.com/krupani/testnow"
	s.license			= 	'MIT'
	s.add_dependency('selenium-webdriver')
end