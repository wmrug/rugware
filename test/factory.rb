Factory.define :event do |e|
  e.sequence(:title) {|n| "Title#{n}"}
  e.body "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  e.start_time Time.now
  e.end_time Time.now + Event::DEFAULT_MEETING_LENGTH
end

Factory.define :user do |u|
  u.sequence(:email) {|n| "test#{n}@example.com"}
  u.password "password"
  u.password_confirmation "password"
end