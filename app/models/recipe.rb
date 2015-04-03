class Recipe < ActiveRecord::Base
   belongs_to :user
    has_many :ingredients
    has_many :directions
    
    accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attribute['name'].blank? },
    allow_destroy: true
    
     accepts_nested_attributes_for :directions, reject_if: proc { |attributes| attribute['step'].blank? },
    allow_destroy: true
    
    validates :title, :description, :image, presence: true
    has_attached_file :image, styles: { :medium => "400x400#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

#### 1:00:00  #####