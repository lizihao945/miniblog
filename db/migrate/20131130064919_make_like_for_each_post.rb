class MakeLikeForEachPost < ActiveRecord::Migration
  def up
  	Post.all.each do |post|
  		if post.like.nil?
  			like = Like.new
  			like.post = post
  			like.count = 0
  			post.like = like
  		end
  	end
  end

  def down
  end
end
