class Comment < ApplicationRecord
	 validates :description, presence: true, length: { minimum: 1, maximum: 1000 }
	 belongs_to :user
  	 belongs_to :article
end