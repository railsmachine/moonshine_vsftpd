# Moonshine_Vsftpd

### A plugin for [Moonshine](http://github.com/railsmachine/moonshine)

This plugin provides an FTP server. By default, it allows system users 
to log in, chrooted to their home directory and disables anonymous FTP. 
It is suggested that you add FTP users like this on the server:

    useradd --shell /bin/false <username>

This will prevent the user from logging in interactively on the server.

IMPORTANT: comment out this line in /etc/pam.d/vsftpd to use non-interactive shells:
    auth   required        pam_shells.so

### Instructions

* <tt>script/plugin install git://github.com/railsmachine/moonshine_vsftpd.git</tt>
* Configure settings if needed. See template for available options.
    configure(:vsftpd => {:foo => true})
* Include the plugin and recipe(s) you want to use in your Moonshine manifest.
    plugin :vsftpd
    recipe :vsftpd
    
***

Unless otherwise specified, all content copyright &copy; 2014, [Rails Machine, LLC](http://railsmachine.com)
