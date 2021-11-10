class PhotosController < ApplicationController 

  def index
    @list_of_photos = Photo.all.order({:created_at =>:desc})
    render({:template => "photo_templates/index.html.erb"})
  end 

  def show
    fetched = params.fetch("photo_id")
    @photo = Photo.where({:id => fetched}).first

    render({:template => "photo_templates/show.html.erb"})

  end 

  def toast
    
    the_id = params.fetch("photo_id")
    the_photo = Photo.where({:id => the_id}).first
    the_photo.destroy

    redirect_to('/photos')
  end 

  def create

  input_image = params.fetch("input_image")
  input_caption = params.fetch("input_caption")
  input_id = params.fetch("input_owner_id")

  new_photo = Photo.new

  new_photo.image = input_image
  new_photo.caption = input_caption
  new_photo.owner_id = input_id

  new_photo.save
    redirect_to('/photos/'+ new_photo.id.to_s)
  end 

  def update
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    the_id = params.fetch("photo_id")

    matching_photo = Photo.where({:id => the_id}).first

    matching_photo.image = input_image
    matching_photo.caption = input_caption
    matching_photo.save

    redirect_to("/photos/"+the_id.to_s)

  end 
      
  def create_comment

    input_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_comment = params.fetch("input_body")
    
    new_comment = Comment.new

    new_comment.photo_id = input_id
    new_comment.author_id = input_author_id
    new_comment.body = input_comment
    new_comment.save
    redirect_to("/photos/"+input_id.to_s)
  
  end 
    
      
   
end 