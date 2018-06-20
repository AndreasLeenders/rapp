class RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
      if current_user.is_band
       edit_band_path(current_user.render_band_or_organiser.id)
     else
       edit_organiser_path(current_user.render_band_or_organiser.id)
   end
end


end
