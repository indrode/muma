require 'factory_girl'

Factory.define :user do |user|
  user.login 'peter'
  user.password 'passw'
  user.password_confirmation 'passw'
end
