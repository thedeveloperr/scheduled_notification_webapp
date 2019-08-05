
## Purpose
A weekend Ruby on rails side project to create a tool for tech fest team and events while learning ruby on rails. This tool will allow event coordiantors to schedule reminder and announcement SMS for event particiapnts. (Will be extended to other modes soon.)
Another aim is to open source it and allow students in my college to contribute to it and get started in open source development.


### TODO:
* Automated unit tests
* A good UI/UX
* Automatic deployment system
* Logging system
* Extending it to support emails, push notifications etc.

### Running it on your system

Ensure you have:
Rails 5+ and ruby version compatible with it.
Redis 5
AWS account with SNS service configured

Tested with Mac but should work with linux too. Not tested with windows.
Open terminal and do following:
1. Clone this repo using `git clone <repo_url>`
2. go to the folder using.
3. Run `bundle install`
4. Modify .env file according to your AWS account region
5. The secrets and access id etc. are stored in `config/credentials.yml.enc` Add your aws credentials like:

```
aws_sns:
  access_key_id: <replace_with_your_key_id>
  secret_access_key: <replace_with_your_key>
```

6. Run 4 terminal tabs/processes and in each tab go to project folder and run:
`redis-server`
`bin/rails server`
`QUEUE=* rake resque:work`
`bundle exec rake resque:scheduler`
