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
