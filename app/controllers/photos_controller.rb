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


    # render({ :template => "photo_templates/delete.html.erb" })

    redirect_to("/photos")
  end


  def create
#   Parameters: {"query_image_url"=>"a", "query_photo_caption"=>"b", "query_owner_id"=>"c"}

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

end
