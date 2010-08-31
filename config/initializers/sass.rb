# Compress generated stylesheets
Sass::Plugin.options[:style] = :compressed

# Keep stylesheet templates in app folder
Sass::Plugin.options[:template_location] = File.join(Rails.root, 'app', 'stylesheets')