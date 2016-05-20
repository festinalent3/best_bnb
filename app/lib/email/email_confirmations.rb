require 'mail'

class EmailConfirmation

  def self.sign_up(recipient)
    begin
      Mail.deliver do
        to      recipient
        from    'beast@teambeast.com'
        subject 'BEAST'

        text_part do
          body "Welcome to the beast network, thanks for signing up!"
        end
      end
    rescue
    end
  end

  def self.space_created(recipient)
    begin
      Mail.deliver do
        to      recipient
        from    'beast@teambeast.com'
        subject 'BEAST'

        html_part do
          body (File.read('space_created.html')) + "Hell"
        end
      end
    rescue
    end
  end

  def self.request_space(recipient)
    begin
      Mail.deliver do
        to      recipient
        from    'beast@teambeast.com'
        subject 'BEAST'

        html_part do
          body File.read('space_requested.html')
        end
      end
    rescue
    end
  end

  def self.confirm_booking(recipient)
    begin
      Mail.deliver do
        to      recipient
        from    'beast@teambeast.com'
        subject 'BEAST'

        html_part do
          body File.read('confirm_booking.html')
        end
      end

      Mail.deliver do
        to      'maxprovin01@gmail.com'
        from    'beast@teambeast.com'
        subject 'BEAST'

        text_part do
          body File.read('booking_confirmed.html')
        end
      end
    rescue
    end
  end

end