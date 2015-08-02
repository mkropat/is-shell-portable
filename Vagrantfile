require 'json'

boxes = JSON.parse(File.read('boxes.json')).collect do |k,v|
  { :name => k, :image => v["image"] }
end

Vagrant.configure(2) do |config|

  boxes.each do |box|
    config.vm.define box[:name] do |config|

      config.vm.box = box[:image]
      config.vm.synced_folder ".", "/vagrant", disabled: true

      config.ssh.insert_key = false

      config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--usb", "off"]
        vb.customize ["modifyvm", :id, "--usbehci", "off"]
      end

    end
  end
end
