class User < ActiveRecord::Base

	belongs_to	:user_role
	has_many		:notes	
	
end
