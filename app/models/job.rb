class Job < ApplicationRecord
  enum status: {
    created: 'created',
    in_progress: 'in_progress',
    finished: 'finished'
  }

  serialize :summary

  def source
    @source ||= source_class.constantize.new
  end
end
