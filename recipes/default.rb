git '/home/ubuntu/apps/api' do
	repository 'gitlab@gitlab.owlgrin.com:horntell/api.git'
	revision 'master'
	action :sync
end

composer_project '/home/ubuntu/apps/api' do
	action :update
end

git '/home/ubuntu/apps/api/app/config/production' do
	repository 'gitlab@gitlab.owlgrin.com:horntell/configs.git'
	revision 'api'
	action :sync
end

execute 'making api storage writable' do
	command 'sudo chmod -R a+w /home/ubuntu/apps/api/app/storage'
end