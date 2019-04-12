credentials = Rails.application.credentials
puts 'manually creating SQS queue'
sqs_client = Aws::SQS::Client.new(
  access_key_id: credentials[:aws][:access_key_id],
  secret_access_key: credentials[:aws][:secret_access_key],
)

sqs_client.create_queue(queue_name: "#{Rails.configuration.active_job.queue_name_prefix}_default")
puts "Done"

Shoryuken.active_job_queue_name_prefixing = true
ENV['AWS_ACCESS_KEY_ID'] = credentials[:aws][:access_key_id]
ENV['AWS_SECRET_ACCESS_KEY'] = credentials[:aws][:secret_access_key]
Shoryuken.options[:aws][:access_key_id] = credentials[:aws][:access_key_id]
Shoryuken.options[:aws][:secret_access_key] = credentials[:aws][:secret_access_key]

Shoryuken.options[:logfile] = "./log/shoryuken.log"
Shoryuken.add_group('default', 25)
puts "Shoryuken Configured"

# use this command to start shoryuken
# bundle exec shoryuken -R -C ~/projects/aws_meetup_2/config/shoryuken.yml -L ~/projects/aws_meetup_2/log/shoryuken.log
# RAILS_ENV=production bundle exec shoryuken -R -C ~/aws_meetup_2/current/config/shoryuken.yml -L ~/aws_meetup_2/shared/log/shoryuken.log
# RAILS_ENV=production bundle exec shoryuken --rails --daemon --logfile ~/aws_meetup_2/shared/log/shoryuken.log --config ~/aws_meetup_2/current/config/shoryuken.yml --pidfile ~/aws_meetup_2/shared/tmp/pids/shoryuken.pid
