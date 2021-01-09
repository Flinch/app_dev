class Comment < ApplicationRecord
	 validates :description, presence: true, length: { minimum: 1, maximum: 300 }
	 belongs_to :user
  	 belongs_to :article
end