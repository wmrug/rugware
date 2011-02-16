# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


events = Event.create([{ :title => "January Meetup - Happy Birthday to You", :body => "<p>It's the New Year and our first WMRUG of 2011!! Three reasons to celebrate this month:</p>
<ul><li>To kick the year off, we'll gather round and plan WMRUG 2011. Give your input on what you'd like most to learn, see, and do in the coming year ahead.</li><li>WMRUG is 1-year old this January! We'll celebrate by heading to the pub a little sooner than usual to get some more social time in.</li><li>Omar and Richard seek to settle the Emacs vs. vim productivity war. Pick up lots of tips and tricks to speed up your coding as they each pitch their preferred choice.</li></ul>
<p>Same time and place as usual (7:00pm, Faraday Wharf), RSVP for pizza+drinks!</p>
<p><strong>Price:</strong> GBP5.00 per person(refund policy)</p>
<p><strong>How to find us:</strong> We'll be using Room 1A/B. Reception/doors are locked after 6pm, just buzz security and say you're here for the Ruby User Group. Parking is available on the podium.</p>", :start_time => "Wednesday, January 19, 2011 7:00 PM", :end_time => "Wednesday, January 19, 2011 10:00 PM"}, { :title => "December Meetup - It's Christmas!!!", :body => "<p>Curry and beer Christmas social at the Grameen Khana Restaurant.</p><p>'Inspirational, award winning cuisine-served to perfection.'</p><p>Come one, come all: WMRUG's first Christmas, plus celebrate 12 months of events!!</p><p>(Dietary needs like Halal food and cuisines for vegetarians are available.)</p>", :start_time => "Wednesday, December 15, 2010 7:00 PM", :end_time => "Wednesday, December 15, 2010 10:00 PM"}, { :title => "November Meetup - Sassy CSS, Twitter Fail, and Group Coding", :body => "<p>The plan for the night:</p><ul><li>Socialising & Introduction: 7pm</li><li>Pizza & Drinks</li><li>Nugget: The 4 main Twitter Ruby libraries, and why they all fail. - Quentin</li><li>Presentation Session: Sassy CSS (SCSS) - Adre</li><li>Coding Session: Completing the WMRUG website - Everyone</li><li>Close & Pub: 9:30pm+</li></ul>
<p><strong>RSVP:</strong> If you are thinking of attending, please let us know through Meetup as it helps us keep you informed of last-minute changes (and we can get a good seating/food plan together).</p>
<p><strong>Price:</strong> GBP5.00 per person(refund policy)</p>
<p><strong>How to find us:</strong> We'll be using Room 1A/B. Reception/doors are locked after 6pm, just buzz security and say you're here for the Ruby User Group. Parking is available on the podium.</p>", :start_time => "Wednesday, November 17, 2010 7:00 PM", :end_time => "Wednesday, November 17, 2010 10:00 PM"}, { :title => "February Meetup", :body => "<p>The plan for the night:</p><ul><li>Socialising & Introduction: 7pm</li><li>Pizza & Drinks</li><li>Nugget:My trip to Chicago: their 500-member RUG, pair-programming sessions, and Pivotal Labs' offices - Quentin (~15 mins) </li><li>Session 2: _whytheluckystiff - Jonas (~20 mins)</li><li>Session 3: Varnish: high-performance cache used by Heroku and Posterous - Tom (~35 mins)</li><li>Close & Pub: 9pm+</li></ul>
<p><strong>RSVP:</strong> If you are thinking of attending, please let us know through Meetup as it helps us keep you informed of last-minute changes (and we can get a good seating/food plan together).</p>
<p><strong>Price:</strong> GBP5.00 per person(refund policy)</p>
<p><strong>How to find us:</strong> We'll be using Room 1A/B. Reception/doors are locked after 6pm, just buzz security and say you're here for the Ruby User Group. Parking is available on the podium.</p>", :start_time => "Wednesday, February 16, 2011 7:00 PM", :end_time => "Wednesday, February 16, 2011 10:00 PM"}])

Photo.create([:description=>"After moving around frequently in our first year, we have now settled down, and this is our new home.", :title=>"Birmingham Science Park Aston", :url=>"http://indigodream.files.wordpress.com/2009/06/r_brum14jun2009-054.jpg", :event_id => 2, :date => "Wednesday, February 16, 2011"])
Photo.create([:description=>"An iconic site in our groups hometown...", :title=>"Birmingham BUll Ring", :url=>"http://www.digitalbirmingham.co.uk/uploaded_images/Bull%20at%20Bullring%20from%20BANF%20030.jpg", :event_id => 3, :date => "Wednesday, February 16, 2011"])
Photo.create([:description=>"The reason for our existance...as a group.", :title=>"Ruby on Rails", :url=>"http://www.webaxes.com/wp-content/uploads/2010/06/ruby-on-rails.jpg", :event_id => 3, :date => "Wednesday, February 16, 2011"])

