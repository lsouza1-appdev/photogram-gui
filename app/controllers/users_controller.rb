class UsersController < ApplicationController 

  def index

    @list_of_users = User.all.order({:username => :asc})
    render({:template => "/user_templates/index.html.erb"})
  end 

  def show
    path = params.fetch("name")

    @user = User.where({:username => path}).first

    if @user == nil
      redirect_to("/404")
    else
      render({:template => "/user_templates/show.html.erb"})
    end 
  end 


end 
