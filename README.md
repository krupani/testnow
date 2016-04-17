# testnow

An instant WebDriver-Ruby-Cucumber or WebDriver-Ruby-RSpec framework which has ability to do cross browser testing on any of the popular browsers, Firefox, Chrome, Opera, Internet Explorer, Safari, Android Browser. It uses the selenium-webdriver to driver the browsers already installed on your box. This gem also makes your existing automation code compatible to the TestNow platform by adding 1 command in your existing setup method.

## Installation 
You must have Ruby installed before you can install this gem.

``` 
gem install testnow 
```

or you can include it in your Gemfile and run bundle install

``` 
gem 'testnow' 
```  
  
  
## Usage   
   
### 1. Instant Cross Browser Configuration -- TestNow Platform Compatibility     
When creating a Selenium-WebDriver automation suite, if one requires cross browser testing, the biggest headache is configuring all browsers mainly because configurations for every browser is done differently. It is . This is where TestNow gem jumps in as an Asprin.   

Unlike some very famous Ruby-WebDriver tools which wraps up the WebDriver object and provides its own set of commands, TestNow gem returns you the ```driver``` object as is but initialized with any browser of your choice.

In your existing automation suite, just put the following command in the setup method. (Setup method is where WebDriver is initialized with a certain browser and a driver object is created.)

```
@driver = TestNow.init
```

TestNow gem uses the environment variable __BROWSER__ to detect which browser to initialize. If no value is set for this variable then firefox will be initialized by default.

   
### 2. Instant WebDriver-Ruby-Cucumber framework   

```
testnow cucumber_now
```  
This will run a series of commands and create a WebDriver-Ruby-Cucumber framework for you in a directory called __cucumber_now__. It will towards the end also ask you for gem dependency installation and it is highly recommended to say Yes. It will also create a sample scenario with a feature file and also a hooks and env file with all configurations. This scenario can be executed by simple command to see a demo of the execution.

``` 
cd cucumber_now                      # Navigate into the created directory   

Command 1 : cucumber features        # Executes using cucumber gem executable
or
Command 2 : rake cucumber_now        # Executes using cucumber rake task
```   
  
Use any of the command to execute the sample scenario. A beautiful, screenshot embedded report will be created by this execution to in the reports directory. It will be in html format, please double click or open in a browser to view it.   


### 3. Instant WebDriver-Ruby-RSpec framework   

```
testnow rspec_now
```    
   
This will run a series of commands and create a WebDriver-Ruby-RSpec framework for you in a directory called __rspec_now__. It will towards the end also ask you for gem dependency installation and it is highly recommended to say Yes. It will also create a sample scenario with a spec and spec_helper file with all configuration. This scenario can be executed by simple command to see a live demo of the execution.

``` 
cd cucumber_now       # Navigate into the created directory   

rake rspec_now        # Executes using cucumber rake task
```   
  
Use any of the command to execute the sample spec. A beautiful report will be created by this execution to in the reports directory. It will be in html format, please double click or open in a browser to view it. 

