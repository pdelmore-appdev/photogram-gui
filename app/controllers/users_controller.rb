class UsersController < ApplicationController


  def index 
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })


    render({ :template => "user_templates/index.html.erb"})
  end

  def show
# Parameters: {"path_username"=>"anisa"}

url_username = params.fetch("path_username")

@all_users = User.where({ :username => url_username })

@single_user = @all_users.at(0)

# if single_user == nil
#   redirect_to("/404")
# else
    render({ :template => "user_templates/show.html.erb" })
  # end
end

end
