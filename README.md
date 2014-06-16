## pushpop-sendgrid

Sendgrid plugin for [Pushpop](https://github.com/pushpop-project/pushpop).

### Installation

Add `pushpop-sendgrid` to your Gemfile:

``` ruby
gem 'pushpop-sendgrid'
```

or install it as a gem:

``` shell
$ gem install pushpop-sendgrid
```

### Usage

The `sendgrid` plugin gives you a DSL to specify typical email parameters.

Here's an example:

``` ruby
require 'pushpop-sendgrid'

job 'send an email' do

  sendgrid do
    to          'josh+pushpop@keen.io'
    from        'pushpopapp+123@keen.io'
    subject     'Is your inbox lonely?'
    attachment  '/funny_images/sad_inbox.jpeg'
    body        'This email was intentionally left blank.'
    preview     false
  end

end
```
The `to`, `from`, and `subject` methods should be self-explanatory. All expect strings.

The `body` method can take a string, or it can take the same parameters as the `template` method provided by the base step class. This example will use the rendered template contents as the body:

``` ruby
body 'pingpong_report.html.erb', response, step_responses
```

The `attachment` method is optional and takes a path to a file to be attached.

The `preview` setting is optional and defaults to false. If you set it to true the email contents will print out
to the console but the email will not be sent.

The `sendgrid` plugin requires that the following environment variables are set: 

+ `SENDGRID_DOMAIN`
+ `SENDGRID_USERNAME`
+ `SENDGRID_PASSWORD`

##### Non-DSL methods

Need to send multiple emails in one step? Need more control over email sending? The DSL approach won't be sufficient for you.
Instead, use the `send_email` method exposed by the plugin directly. Here's an example:

``` ruby
require 'pushpop-sendgrid'

job 'send multiple emails' do

  step 'send some emails' do

    ['josh+1@keen.io', 'justin+1@keen.io'].each do |to_address|
      send_email to_address, 'pushpop-app@keen.io', 'Nice subject', 'Nice body'
    end

  end

end
```

### Contributing

Code and documentation issues and pull requests are welcome.
