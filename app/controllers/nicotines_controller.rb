class NicotinesController < ApplicationController
  def index
    @nicotine_counts = Nicotine.all
  end
end
