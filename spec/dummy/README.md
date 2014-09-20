Ottrick dummy application
=========================

To use this test dummy application, check out the source code from git, 
change directory to spec/dummy and run the application:

```bash
git clone https://github.com/swobspace/ottrick.git
bundle install
cd spec/dummy
bundle exec rake db:schema:load
bin/rails server
```
Browse to [localhost:3000](http://localhost:3000) and play around.

