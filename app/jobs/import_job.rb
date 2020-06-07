class ImportJob < ApplicationJob
  queue_as :default

  def perform(job_id)
    job = Job.find(job_id)

    Import::Process.call(job)
  end
end
