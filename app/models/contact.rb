class Contact < ApplicationRecord
  def full_name 
    return first_name + " " + last_name
  end  

  def friendly_created_time
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end  
end