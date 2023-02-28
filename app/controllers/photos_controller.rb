class PhotosController < ApplicationController

  def index

@list_of_photos = Photo.order({ :created_at => :desc })


    render({ :template => "photo_templates/index.html.erb" })
  end

  def show

url_photo_id = params.fetch("path_photo_id")

@all_photos = Photo.where({ :id => url_photo_id })

@single_photo = @all_photos.first


  render({ :template => "photo_templates/show.html.erb" })
  end


  def delete_photo
photo_id = params.fetch("path_photo_id")

matching_photos = Photo.where({ :id => photo_id})

one_photo = matching_photos.first

one_photo.destroy


    redirect_to("/photos")
  end


  def create

query_image_url = params.fetch("query_image_url")
query_photo_caption = params.fetch("query_photo_caption")
query_owner_id = params.fetch("query_owner_id")

a_new_photo = Photo.new
a_new_photo.image = query_image_url
a_new_photo.caption = query_photo_caption
a_new_photo.owner_id = query_owner_id

a_new_photo.save


redirect_to("/photos/#{a_new_photo.id.to_s}")
  end


  def update_photo

query_image = params.fetch("query_image")
query_caption = params.fetch("query_caption")
update_photo_id = params.fetch("update_photo_id")

matching_photos = Photo.where({ :id => update_photo_id })

the_photo = matching_photos.first

the_photo.image = query_image
the_photo.caption = query_caption

the_photo.save


redirect_to("/photos/#{the_photo.id.to_s}")
  end


  def add_comment

query_photo_id = params.fetch("query_photo_id")
query_author_id = params.fetch("query_author_id")
query_body = params.fetch("query_body")

new_comment = Comment.new

new_comment.photo_id = query_photo_id
new_comment.author_id = query_author_id
new_comment.body = query_body

new_comment.save

redirect_to("/photos/#{new_comment.photo_id.to_s}")
  end


end
