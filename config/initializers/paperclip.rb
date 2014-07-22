Paperclip::Attachment.default_options[:url] = 'qapplication.s3.amazonaws.com'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-website-eu-west-1.amazonaws.com'