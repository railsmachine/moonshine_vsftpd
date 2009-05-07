require File.join(File.dirname(__FILE__), 'spec_helper.rb')

class VsftpdManifest < Moonshine::Manifest
  plugin :vsftpd
end

describe Vsftpd do
  
  before do
    @manifest = VsftpdManifest.new
    @manifest.vsftpd
  end
  
  
  it "should install vsftpd" do
    @manifest.packages.keys.should include('vsftpd')
  end
    
  it "should enable and start the vsftpd service" do
    (service = @manifest.services['vsftpd']).should_not be_nil
    service.enable.should be_true
    service.ensure.should == :running
  end
  
  it "should create the configuration from the template" do
    (config = @manifest.files['/etc/vsftpd.conf']).should_not be_nil
    config.content.should match /anonymous_enable=NO/
  end
    
  it "should allow options to be specified" do
    @manifest.vsftpd(:anonymous_enable => 'YES')
    (config = @manifest.files['/etc/vsftpd.conf']).should_not be_nil
    config.content.should match /anonymous_enable=YES/
  end
    
end