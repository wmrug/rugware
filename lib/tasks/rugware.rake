namespace :rugware do
  namespace :dev do
    desc "Create example user and some example events"
    task :setup => [:users, :events] do
    end

    desc "Create Development User"
    task :users => :environment do
      user = User.create!({
        :email                 => "example@example.com",
        :password              => "example",
        :password_confirmation => "example",
      })
    end
    
    desc "Create some example events"
    task :events => :environment do
      start_month = Date.today - 3.months
      (0..5).each do |month_num|
        dt = start_month + month_num.months
        meeting_time = Time.mktime(dt.year,dt.month,15,19,0,0)
        Event.create!({
          :title => "WMRUG Meeting in #{Date::MONTHNAMES[meeting_time.month]} #{meeting_time.year}",
          :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          :start_time => meeting_time,
          :end_time => meeting_time + 2.hours,
        })
      end
    end
  
    desc "Reset database and re-setup development"
    task :reset => ["db:reset","db:seed",:setup] do
    end
  end
end