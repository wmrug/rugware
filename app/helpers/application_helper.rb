module ApplicationHelper
  def countdown_script_for_next_event
    @time = next_event_datetime
    "//<![CDATA[
        jQuery(document).ready(function() {
          $('#countdown_dashboard').countDown({
            targetDate: {
              'day':#{@time[3]}, 'month':#{@time[4]}, 'year': #{@time[5]}, 'hour': #{@time[2]}, 'min': #{@time[1]}, 'sec': #{@time[0]}
            }
          });

          $('#email_field').focus(email_focus).blur(email_blur);
          $('#subscribe_form').bind('submit', function() { return false; });
        });
      //]]>"
  end
  
  private
  def next_event_datetime
    Event.upcoming.first.start_time.to_time.to_a
  end
end
