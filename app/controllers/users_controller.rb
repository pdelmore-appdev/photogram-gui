class UsersController < ApplicationController


  def index 
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })


    render({ :template => "user_templates/index.html.erb"})
  end

  def show

url_username = params.fetch("path_username")

@all_users = User.where({ :username => url_username })

@single_user = @all_users.at(0)

    render({ :template => "user_templates/show.html.erb" })
end

def add_user

  query_username = params.fetch("query_username")

  new_user = User.new

  new_user.username = query_username

  new_user.save

  
redirect_to("/users/#{new_user.username}")
end

def update_user


 # the_user doesn't work because I need to somehow edit  
edited_username = params.fetch("query_username")
user_id = params.fetch("query_id")

all_users = User.where({ :id => user_id })

the_user = all_users.first

the_user.username = edited_username

the_user.save


redirect_to("/users/#{the_user.username}")
end

end
