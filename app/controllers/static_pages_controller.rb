class StaticPagesController < ApplicationController
  def home
    @medias = Media.by_user(user_id)
  end

  def contact
  end
end
