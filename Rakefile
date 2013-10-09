desc "Build website using jekyll"
task :build do
  system 'jekyll build'
end

desc "Rsync deployment"
task :deploy do
  system 'rsync -avz --delete _site/ scarlett.lon.lividpenguin.com:/home/hosting/web/lividpenguin.com/public/'
end