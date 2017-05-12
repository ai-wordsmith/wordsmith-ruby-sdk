[![Code
Climate](https://codeclimate.com/github/AutomatedInsightsInc/wordsmith-ruby-sdk/badges/gpa.svg)](https://codeclimate.com/github/AutomatedInsightsInc/wordsmith-ruby-sdk)
[![Test
Coverage](https://codeclimate.com/github/AutomatedInsightsInc/wordsmith-ruby-sdk/badges/coverage.svg)](https://codeclimate.com/github/AutomatedInsightsInc/wordsmith-ruby-sdk/coverage)
[![Issue
Count](https://codeclimate.com/github/AutomatedInsightsInc/wordsmith-ruby-sdk/badges/issue_count.svg)](https://codeclimate.com/github/AutomatedInsightsInc/wordsmith-ruby-sdk)

# Wordsmith SDK for Ruby
## Intro to Wordsmith

[Wordsmith](http://wordsmith.automatedinsights.com) makes it easy to generate thousands of stories, reports, and articles
in the time it takes to write just one. Wordsmith is a natural language
generation tool that enables users to turn data into text using dynamic
templates. The platform is easy to learn, and powerful enough to make each piece
of content totally unique.

The Wordsmith API allows developers to generate new content using the Templates
created in the Wordsmith web app by users at your company. Developers can use
the API to send new data which will trigger the generation of new text content.
You have complete control over when you generate and use the content.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wordsmith-ruby-sdk'
```

And then execute:

    $ bundle install


## Configuration
Configure in initializer or as desired

```ruby
#config/initializers/wordsmith.rb
Wordsmith.configure do |config|
  config.token = MY_API_TOKEN
  config.version = '1' #optional, this is the default value
end
```

## Usage
```ruby
projects = Wordsmith::Project.all                 #an array of projects your token can access
project = Wordsmith::Project.find('project-slug') #fetch a project by slug

project.schema     #the data schema for the project
project.templates  #a collection of templates for this project

template = project.templates.find('template-slug')                             #fetch a template by slug
template.generate({a_data_point: 1, another_one: 'Tuesday'}, proofread: false) #generate content
 > {content: 'Your content is here!'}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/automatedinsightsinc/wordsmith-ruby-sdk.

