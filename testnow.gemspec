
Gem::Specification.new do |s|
	s.name					=	'testnow'
	s.version				=	File.read(File.expand_path("../lib/testnow/version", __FILE__))
	s.platform   		= Gem::Platform::RUBY
	s.summary				=	'TestNow gem : Automate in a Cross Browser style'
	s.description		=	'A gem to configure your WebDriver-Ruby automation framework. Write your tests, leave the browser config to testnow...'
	s.authors				=	['Kaushal Rupani']
	s.email					=	'kushrupani@live.com'
	s.files					=	Dir.glob("{lib,data}/**/*") + %w(README.md LICENCE)
	s.test_files  	= `git ls-files -- {spec,features}/*`.split("\n") + %w(Rakefile)
	s.executables 	= 'testnow'
	s.homepage			=	'https://github.com/krupani/testnow'
	s.license				= 'MIT'
	s.required_ruby_version = '~> 2'
	s.add_runtime_dependency('bundler', '~>1')
	s.add_development_dependency('selenium-webdriver', '~>3')
	s.add_development_dependency('watir', '~>6')
	s.post_install_message 	= "\n\n=>=>=>=>=> Thank you for installing TestNow gem. <=<=<=<=<= \n\n"
end