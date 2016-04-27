[![Code Climate](https://codeclimate.com/repos/5720c4b8e7b46b37e1002bfe/badges/3c997ae42848b5faf8ad/gpa.svg)](https://codeclimate.com/repos/5720c4b8e7b46b37e1002bfe/feed)
[![Test Coverage](https://codeclimate.com/repos/5720c4b8e7b46b37e1002bfe/badges/3c997ae42848b5faf8ad/coverage.svg)](https://codeclimate.com/repos/5720c4b8e7b46b37e1002bfe/coverage)
[![Issue Count](https://codeclimate.com/repos/5720c4b8e7b46b37e1002bfe/badges/3c997ae42848b5faf8ad/issue_count.svg)](https://codeclimate.com/repos/5720c4b8e7b46b37e1002bfe/feed)

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
  config.url = 'https://api.automatedinsights.com/v1' #optional, this is the default value
end
```
  
## Usage
```ruby
projects = Wordsmith::Project.all                 #an array of projects your token can access
project = Wordsmith::Project.find('project-slug') #fetch a project by slug

project.schema     #the data schema for the project
project.templates  #a collection of templates for this project

template = project.templates.find('template-slug')           #fetch a template by slug
template.generate({a_data_point: 1, another_one: 'Tuesday'}) #generate content
 > {content: 'Your content is here!'}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/automatedinsightsinc/wordsmith-ruby-sdk.

