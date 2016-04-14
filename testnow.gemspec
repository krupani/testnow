Gem::Specification.new do |s|
	s.name				=	'testnow'
	s.version			=	'0.0.3'
	s.date				=	'2016-04-14'
	s.summary			=	'TestNow helper'
	s.description		=	'A gem to configure your Ruby Selenium suite for TestNow'
	s.authors			=	["Kaushal Rupani"]
	s.email				=	'kushrupani@live.com'
	s.files				=	Dir["lib/*.rb"] + Dir["lib/*/*.rb"] + Dir["spec/*.rb"] + Dir["spec/*/*.rb"] + Dir["data/*.xpi"] + %w(README.md LICENCE)
	s.homepage			=	"https://github.com/krupani/testnow"
	s.license			= 	'MIT'
	s.add_dependency('selenium-webdriver')
end