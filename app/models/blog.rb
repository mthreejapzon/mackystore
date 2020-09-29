class Blog < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :author, presence: true
  validates :slug, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader
end
