Gem::Specification.new do |s|
	s.name				=	'testnow'
	s.version			=	'0.0.2'
	s.date				=	'2016-03-25'
	s.summary			=	'TestNow helper'
	s.description		=	'A simple gem for TestNow'
	s.authors			=	["Kaushal Rupani"]
	s.email				=	'kushrupani@live.com'
	s.files				=	["lib/testnow.rb", "lib/testnow/chrome.rb","lib/testnow/opera.rb"]
	s.homepage			=	"https://github.com/krupani/testnow"
	s.license			= 	'MIT'
	s.add_dependency('selenium-webdriver')
end