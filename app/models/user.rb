class User < ApplicationRecord
  has_one :band
  has_one :organiser

  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def render_band_or_organiser
            if self.is_band
              Band.create!( user: self ) if self.band.nil?
              return self.band
            else
              Organiser.create!( user: self ) if self.organiser.nil?
              return self.organiser
         end
       end
end
