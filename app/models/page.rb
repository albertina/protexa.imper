class Page < ActiveRecord::Base
	has_permalink :name, :param => :permalink
end
