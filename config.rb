# --- GENERAL SETTINGS ---------------------------------------------------------

Time.zone = 'London'

# Asset paths
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# --- COMPASS SETTINGS ---------------------------------------------------------

compass_config do |config|
  config.output_style = :compact
end

# --- GOOGLE ANALYTICS ---------------------------------------------------------

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-5369593-1'
end

# --- SITEMAPS -----------------------------------------------------------------

set :url_root, 'http://float64.uk'
activate :search_engine_sitemap

# --- TEMPLATE HELPER METHODS --------------------------------------------------

helpers do
  # Output a css class if the given regex matches
  def if_path(regex, classes = 'pure-menu-selected')
    regex =~ current_page.url ? classes : ''
  end

  # Format dates how I want them
  def format_date(date)
    date.strftime("%B #{date.day.ordinalize}, %Y")
  end
end

# --- DEVELOPMENT AND BUILD SETTINGS -------------------------------------------

# Pretty URLs (must be activated _after_ other extension)
activate :directory_indexes

configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload
  # Do not concat/minify assets, load each one on its own.
  set :debug_assets, true
end

configure :build do
  activate :minify_css

  # activate :minify_javascript
  # activate :asset_hash # (cache buster)
  # activate :relative_assets
end

after_build do
  system('htmlbeautifier build/*/*.html')
  system(%q{find build/ -name '*.html' -exec htmlbeautifier '{}' +})
end

# --- DEPLOYMENT ---------------------------------------------------------------

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method       = :rsync
  deploy.host         = 'de1.lividpenguin.com'
  deploy.path         = '/srv/vhost/lividpenguin.com'
  deploy.clean        = true
end
