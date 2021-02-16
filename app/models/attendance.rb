class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event

    

  def attending_send
    AttendingMailer.attending_email("kadoc@mail.com").deliver_now
  end
end
