class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates_uniqueness_of :name
  has_many :article_categories
  has_many :article, through: :article_categories

end
