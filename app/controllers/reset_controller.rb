class ResetController < ApplicationController
  def destroy
    Comment.delete_all
    Post.delete_all
    User.delete_all

    flash = { notice: 'Database cleaned up' }

    redirect_to(jobs_path, flash: flash)
  end
end
