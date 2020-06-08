class JobsController < ApplicationController
  def index
    @jobs = Job.all.order(id: :desc).limit(10)
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    job = Job.create(
      source_class: Import::Sources::JsonPlaceholder::Source
    )

    if job
      ImportJob.perform_later(job.id)
      flash = { notice: 'Job successfully queued' }
    else
      flash = { alert: 'Something went wrong' }
    end

    redirect_to(jobs_path, flash: flash)
  end
end
