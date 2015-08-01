boxes = File.readlines('boxes.txt').collect do |line|
  parts = line.split(' ')
  { :name => parts[0], :image => parts[1] }
end

Vagrant.configure(2) do |config|

  boxes.each_with_index do |box,i|
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
