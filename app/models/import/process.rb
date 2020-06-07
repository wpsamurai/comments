module Import
  class Process
    def self.call(job)
      new(job).call
    end

    def initialize(job)
      @job = job
      @source = job.source
    end

    def call
      status_start

      import_users
      import_posts
      import_comments

      status_finished
    end

    private

      def status_start
        @job.status = :in_progress
        @job.save!
      end

      def status_finished
        @job.finished_at = Time.current
        @job.summary = logger.messages

        @job.status = :finished
        @job.save!
      end

      def import_users
        Users.import(@source, logger)
      end

      def import_posts
        Posts.import(@source, logger)
      end

      def import_comments
        Comments.import(@source, logger)
      end

      def logger
        @logger ||= Logger.new
      end
  end
end