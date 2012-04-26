Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '372191216164729', '8e14e471d32070ceddc2e57ee55dc676',
           :scope => 'email, read_stream', :authorize_params => { :display => 'popup' },
           :client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}
end
