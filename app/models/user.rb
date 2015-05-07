class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         attr_accessible :first_name, :last_name, :profile_name, :email, :password, :password_confirmation 

 has_many :statuses
  
def profile_name
   if self.first_name.blank? && self.last_name.blank?
        return "has no name"
   else
        if self.first_name.blank?
            return self.last_name
        elsif self.last_name.blank?
            return self.first_name
        else
             return self.first_name + " " + self.last_name
        end
   end
end
end