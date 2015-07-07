class ProfileController < ApplicationController
  def index
    profiles = Profile.all.toJSON
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
