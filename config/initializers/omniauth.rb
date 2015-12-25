Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['287422847911-0jndenitrsdg4it0h8gqgmvb31sv7rq7.apps.googleusercontent.com'], ENV['41EsgtdjFJ2FJ98tJVzttSGE'], scope: 'userinfo.profile,youtube'

  OmniAuth.config.on_failure do |env|
    error_type = env['omniauth.error.type']
    new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
    [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
  end
end