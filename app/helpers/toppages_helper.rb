module ToppagesHelper
  
  def identify_name(evidence)
    name_id = evidence.user_id
    user = User.find_by(id: name_id)
    user.name
  end
  
  def identify_user_id(evidence)
    name_id = evidence.user_id
    user = User.find_by(id: name_id)
  end
  
  def identify_user
    @user = User.find_by(id: session[:id])
  end
end
