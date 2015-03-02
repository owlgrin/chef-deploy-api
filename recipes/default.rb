git '/home/ubuntu/apps/api' do
	repository 'gitlab@gitlab.owlgrin.com:horntell/api.git'
	revision 'master'
	action :sync
end

composer_project '/home/ubuntu/apps/api' do
	action :update
end

# making storage folder to allow everyone write
execute "Making '/home/ubuntu/apps/api' storage writable" do
	command "sudo chmod -R a+w /home/ubuntu/apps/api/app/storage"
end

# we are pulling production configs from a different private repo
git "/home/ubuntu/apps/api/app/config/production" do
	repository 'gitlab@gitlab.owlgrin.com:horntell/configs.git'
	revision 'api'
	action :sync
end

# move the .env file to the root of project
remote_file "Copy .env.production file" do 
  path "/home/ubuntu/apps/api/.env.production.php" 
  source "file:///home/ubuntu/apps/api/app/config/production/.env.production.php"
  owner 'ubuntu'
  group 'ubuntu'
  mode 0755
end
# file "/home/ubuntu/apps/api/.env.production.php" do
#   owner 'ubuntu'
#   group 'ubuntu'
#   mode 0755
#   content ::File.open("/home/ubuntu/apps/api/app/config/production/.env.production.php").read
#   action :create
# end