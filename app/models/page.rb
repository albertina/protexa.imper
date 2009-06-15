class Page < ActiveRecord::Base
	has_permalink :name, :param => :permalink

def new_position
    self.position = (Page.count(:all).to_i + 1) unless nil
  end
  
  def change_position(position)
    unless self.position == position.to_i
      if Page.find(:first, :order => :position).position == position
      else
        pages = Page.find(:all, :conditions => ["position >= %s",position], :order => 'position DESC')
        for page in pages
          page.position = page.position + 1
          page.save
        end
        self.position = position
      end
    end
  end
end
