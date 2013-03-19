raise ArgumentError, "Platform #{platform} not supported" unless platform?('ubuntu', 'debian')

include_recipe "java"

deb_pkg = "riemann_#{node[:riemann][:server][:version]}_all.deb"
deb_pkg_full = "#{Chef::Config[:file_cache_path]}#{deb_pkg}"
deb_pkg_source = "#{node[:riemann][:source]}/#{deb_pkg}"

remote_file deb_pkg_full do
  source deb_pkg_source
  not_if "test -e #{deb_pkg_full}"
end

dpkg_package deb_pkg_full do
  not_if "test $(dpkg -s riemann | grep -c #{node[:riemann][:server][:version]}) -gt 0"
end

service "riemann" do
  supports :start => true, :stop => true, :restart => true, :status => true, :reload => true, :'force-reload' => true
  action [:enable, :start]
end
