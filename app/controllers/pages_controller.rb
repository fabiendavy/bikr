class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :bikes

  def bikes
  end
end
