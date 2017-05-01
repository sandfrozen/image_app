class Pin < ActiveRecord::Base
    belongs_to :user
    
    has_attached_file :image, 
                      :storage => :cloudinary,
                      :path => ':id/:style/:filename',
                      :styles => { :medium => "300x300>", :thumb => "100x100>" },
                      :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
                      :cloudinary_resource_type => :image,
                      :cloudinary_url_options => {
                        :default => {
                            :secure => true
                        },
                        :styles => {
                            :medium => {
                                #dodatkowe opcje do wyświetlania załadowanego stylu, ten wyswietla jakosc 75% i obraca o 20 stopni 
                                #:quality => 75,
                                #:transformation => [ { :angle => 20 } ]
                            }
                        }
                      }

    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
