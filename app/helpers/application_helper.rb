module ApplicationHelper
  def countdown_script_for_next_event
    time = if @next_event
            @next_event.start_time.to_time.to_a
           else
             Time.now.to_a
           end

    "<script type=\"text/javascript\">
      //<![CDATA[
          jQuery(document).ready(function() {
            $('#countdown_dashboard').countDown({
              targetDate: {
                'day':#{time[3]}, 'month':#{time[4]}, 'year': #{time[5]}, 'hour': #{time[2]}, 'min': #{time[1]}, 'sec': #{time[0]}
              },
              // onComplete function
              onComplete: function() {
                $('#complete_info_message').slideDown(),
                $('.countdown_label').fadeOut()
              }

            });
          });
        //]]>
      </script>"
  end

end
