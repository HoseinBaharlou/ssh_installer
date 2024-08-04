#!/bin/bash

# به‌روزرسانی لیست بسته‌ها
sudo apt-get update

# نصب سرویس SSH
sudo apt-get install -y openssh-server

# فعال کردن و استارت سرویس SSH
sudo systemctl enable ssh
sudo systemctl start ssh

# تغییر تنظیمات SSH برای اجازه ورود با پسورد
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/#PasswordAuthentication no/' /etc/ssh/sshd_config

# اجازه ورود یوزر root از طریق SSH
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin prohibit-password/#PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

# ریستارت کردن سرویس SSH برای اعمال تغییرات
sudo systemctl restart ssh

echo "SSH installation and configuration completed successfully. Root login enabled."
