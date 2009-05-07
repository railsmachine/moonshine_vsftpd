module Vsftpd

  # Check the template file for available options:
  #
  #    configure(:vsftpd => {:key => 'value'})
  #
  # Include the plugin and call the recipe:
  #
  #    plugin :vsftpd
  #    recipe :vsftpd
  def vsftpd(options = {})
    package 'vsftpd',:ensure => :installed
    service 'vsftpd', :enable => true, :ensure => :running
    file '/etc/vsftpd.conf',
      :content => template(File.join(File.dirname(__FILE__), '..', 'templates', 'vsftpd.conf'), binding),
      :notify => service('vsftpd'),
      :require => package('vsftpd')
  end
  
end