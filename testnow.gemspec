
Gem::Specification.new do |s|
	s.name					=	'testnow'
	s.version				=	File.read(File.expand_path("../lib/testnow/version", __FILE__))
	s.platform   			= 	Gem::Platform::RUBY
	s.summary				=	'TestNow gem : Automate in a BDD + Cross Browser style'
	s.description			=	'A gem to configure your WebDriver-Ruby automation framework.'
	s.authors				=	["Kaushal Rupani"]
	s.email					=	'kushrupani@live.com'
	s.files					=	Dir.glob("{lib,data}/**/*") + %w(README.md LICENCE)
	s.test_files  			= 	`git ls-files -- {spec,features}/*`.split("\n") + %w(Rakefile)
	s.executables 			= 	`git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.homepage				=	"https://github.com/krupani/testnow"
	s.license				= 	'MIT'
	s.add_runtime_dependency('bundler', '>= 1.10.0')
	s.add_development_dependency('selenium-webdriver', '>= 2.52')
	s.add_development_dependency('watir-webdriver', '>=0.9.1')
	s.post_install_message 	= "\n\n=>=>=>=>=> Thank you for installing TestNow gem. <=<=<=<=<= \n\n"
end