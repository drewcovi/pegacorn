# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create(:first_name => 'William', :last_name => 'Harrison', :age => 68, :quote => "I'm just singin' in the rain!")
# User.create(:first_name => 'Abraham', :last_name => 'Lincoln', :age => 56, :quote => "I'd like to see a show tonight.")

User.create([
  { email: 'drew@clockwork.net',
    first_name: 'Drew',
    last_name: 'Covi',
    ldap: 'drew',
    password: 'testing123'
  },
  { email: 'devteam@clockwork.net',
    password: 'testing123',
    first_name: 'Clockwork',
    last_name: 'Devteam'
  }
])
Post.create([
  { title: 'post 1',
    body: 'post-body',
    permalink: 'post-1'
  }
])