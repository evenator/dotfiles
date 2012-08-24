sudo nano /etc/grub.d
cd /etc/grub.d
ls
mv 10_linux 50_linux
sudo mv 10_linux 50_linux
ls
sudo mv 20_linux_xen 50_linux_xen
ls 40_custom
cat 40_custom
cat 30_custom
cat 30_os_prober
cat 30_os-prober
nano 30_os-prober
clear
ls
mv 20_memtest86+ 60 memtest86+
mv 20_memtest86+ 60_memtest86+
sudo mv 20_memtest86+ 60_memtest86+
ls
ls -lisa
sudo apt-get purge bcmwl-kernel-source broadcom-sta-common broadcom-sta-source
gconftool-2 --set /desktop/gnom/shell/windows/button_layout --type string :minimize,maximize,close
gconftool-2 --set /desktop/gnome/shell/windows/button_layout --type string :minimize,maximize,close
sudo gconftool-2 --set /desktop/gnome/shell/windows/button_layout --type string :minimize,maximize,close
sudo /etc/init.d/gdm restart
gconftool-2
gconftool-2 --help
gconftool-2 --client
gconftool-2 --help-all
gconftool-2 --get /desktop/gnome/shell/windows/button_layout
gnome-shell -v
gnome-shell --help
gnome-shell --version
sudo apt-get-install gmenu-simple-editor
sudo apt-get install gmenu-simple-editor
exit
sudo apt-get purge bcmwl-kernel-source broadcom-sta-common broadcom-sta-source
sudo apt-get install b43-fwcutter firmware-b43-installer
sudo nano /etd/default/grub
sudo nano /etc/default/grub
cd /boot/grub
ls
ls -lisa
ls -lisa | grep .cfg
sudo nano grub.cfg
clear
cd /etc/grub.d/
ls
sudo nano 00_header
sudo nano 10_linux
sudo vim 10_linux
apt-get install vim
sudo apt-get install vim
sudo vim 10_linux
ls
cp . ~/grub.d
ls ~/grub.d
cp --help
cp -R . ~/grub.d
ls ~/grub.d
clear
ls
sudo rm 50_linux
sudo rm 50_linux_xen 
mv 40_custom 06_custom
sudo mv 40_custom 06_custom
sudo mv 41_custom 07_custom
cat README 
sudo grub-mkconfig 
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer
ssh cse-homes.case.edu
ssh esv@csehomes.engineering.case.edu
ssh esv@vorlon.case.edu
ssh esv@volatile.case.edu
ssh edward.venator@csehomes.engineering.case.edu
sudo apt-get install network-manager-vpnc
cd ciscovpn/
sudo ./vpn_install.sh 
cd /opt/cisco/vpn/bin
./vpnui
exit
sudo apt-getinstall dhcp3-server
sudo apt-get install dhcp3-server
sudo vim /etc/
sudo vim /etc/dhcp
clear
ls /etc/dhcp
ls /etc/dhcp/dhcpd.conf
sudo nano /etc/dhcp/dhcpd.conf
sudo gedit /etc/dhcp/dhcpd.conf
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install ros-fuerte-desktop-full
sudo nvidia-xconfig
sudo vim /etc/X11/xorg.conf
sudo restart gdm
git clone git@github.com:evenator/masters.git
ssh --help
ssh-keygen -t rsa -C "esv@case.edu"
git clone git@github.com:evenator/masters.git
git push -u origin master
cd masters
git push -u origin master
git status
git add PCBs/xBEE_dip/
git status
git commit
vim ~/.bashrc
source ~/.bashrc
git status
git commit -f
git push
git config --global core.editor "vim"
git status
cd masters/
cd PCBs/
cd cRIO\ Breakout/
gschem2pcb
gsch2pcb breakout.pcb
sudo apt-get install geda-utils
gsch2pcb breakout.pcb
gsch2pcb breakout
ls
gsch2pcb project
ls
rm *.pcb
rm *.net
rm *.cmd
ls
gsch2pcb project
rm *.pcb
rm *.net
rm *.cmd
cd ~/masters/
git pull
git status
rm PCBs/cRIO\ Breakout/breakout.pcb-
git pull
git status
git commit -a
git status
git pull
git status
git commit
git add rm PCBs/cRIO\ Breakout.net
git rm PCBs/cRIO\ Breakout.net
git rm PCBs/cRIO\ Breakout/breakout.net
git rm PCBs/cRIO\ Breakout/breakout.pcb
git status
git commit -a
git config --global user.name "Ed Venator"
git config --global user.email "esv@case.edu"
git commit --mand --reset-author
git commit --amend --reset-author
git status
cd PCBs/cRIO\ Breakout/
gsch2pcb project 
rm breakout.pcb
sudo apt-get update
sudo apt-get upgrade
cleaer
clear
gsch2pcb project 
vim breakout.pcb
pcb breakout.pcb
pcb --help
cd masters/
git status
git log
git status
git commit -a
git push
cd /usr/share/application
cd /usr/share/applications
ls
cat banshee.desktop 
cat banshee-media-player.desktop 
ls
cd ~/masters/PCBs/cRIO\ Breakout/
git pull
rm breakout.cmd 
rm breakout.net 
rm breakout.pcb 
git pull
gsch2pcb breakout.gsch2pcb 
git status
git add breakout.net
git add breakout.pcb
git add breakout.sch
git add breakout.png
git commit
git push
git commit
git commit -a
cd ../eStop
gsch2pcb estop.gsch2pcb 
rm estop.pcb
rm estop.new.pcb
gsch2pcb estop.gsch2pcb 
rm estop.pcb estop.net estop.cmd
gsch2pcb estop.gsch2pcb 
git status
git add estop.cmd
git add estop.net
git add estop.pcb
git add estop.sch
git status
git rm project
git add ../footprints/screw_5mm_2.fp
git rm ../footprints/screw_5mm_2-op.fp
git add ../symbols/npn-TO220.sym
git status
git commit
cd ../eStop_remote/
ls
mv project remote.gch2pcb
ls
git rm remote.pcb remote.net remote.cmd
rm remote.pcb remote.net remote.cmd
gsch2pcb remote.gsch2pcb
clear
gsch2pcb remote.gsch2pcb
ls
mv remote.gch2pcb remote.gsch2pcb
gsch2pcb remote.gsch2pcb
gsch2pcb remote.gsch2pcb -v
mv remote.gch2pcb remote.gsch2pcb
rm remote.pcb remote.net remote.cmd
gsch2pcb remote.gsch2pcb
clear
gsch2pcb remote.gsch2pcb
gsch2pcb remote.gsch2pcb -v
gsch2pcb remote.gsch2pcb
git status
git add remote.cmd
git rm project
git add remote.sch
git status
clear
git status
git add remote.net
git add remote.pcb
git status
git commit
git status
git rm ../eStop/estop.new.pcb
git rm ../eStop/estop.new.pcb -f
git rm ../eStop/estop.pcb- -f
git status
git rm ../eStop/estop.sch~ -f
git status
git commit
git status
git add ../eStop/estop.gsch2pcb
git add remote.gsch2pcb
git commit -m"Adding some project files."
git status
gm ../footprints/CONNECTOR_1_2.fp 
rm ../footprints/CONNECTOR_1_2.fp 
git status
git push
git status
cd masters/PCBs/eStop
gsch2pcb estop.gsch2pcb
rm estop.pcb
mv estop.pcb.bak7 estop.pcb
gsch2pcb estop.gsch2pcb
git status
git add estop.pcb
git add estop.sch
git commit
git status
cd ../cRIO\ Breakout/
git status
git add breakout.pcb
git add breakout.bot*
git add breakout.top*
git status
mov breakout.combined-drill breakout.combine-drill.cnc
mv breakout.combined-drill breakout.combine-drill.cnc
git status
mv breakout.combine-drill.cnc breakout.combined-drill.cnc
git status
git add breakout.*.gbr
git add breakout.*.cnc
git add breakout.zip
git status
clear
git status
git commit
git status
cd ~/sicktoolbox-1.0.1/
./configure
make
sudo make install
cd c++/examples/
ls
cd ..
make
make --help
cd examples/
make
cd lms
make
cd lms_plot_values/
make
make install
cd ../../..
ls
cd ..
ls
sudo make
sudo make install
cd c++/examples/
cd lms
ls
cd lms_config/
ls
cd src/
ls
lms_config
./lms_config
ls /dev | grep tty0
./lms_config /dev/tty0 500000
ls /dev |grep tty
./lms_config /dev/ttyS0 500000
sudo ./lms_config /dev/ttyS0 500000
ls /dev |grep tty
sudo ./lms_config /dev/tty 500000
clclear
sudo ./lms_config /dev/tty 500000clear
clear
clearclear
clear
ls /dev | grep tty
sudo ./lms_config /dev/ttyS0 500000
cd ~/sicktoolbox-1.0.1/c++/examples/lms/lms_config/src/
sudo ./lms_config /dev/ttyS0 500000
sudo ./lms_config /dev/ttyS1 500000
sudo ./lms_config /dev/ttyS2 500000
sudo ./lms_config /dev/ttyS3 500000
sudo ./lms_config /dev/ttyS 500000
sudo ./lms_config /dev/ttyS0 500000
exit
cd masters/
git status
git rm PCBs/eStop/eStop.zip
git add PCBs/eStop/estop.*.gbr
git add PCBs/eStop/estop.zip
git status
git commit -a
git pull
git push
git status
rm PCBs/cRIO\ Breakout/breakout.combined-drill~
rm PCBs/cRIO\ Breakout/*~
rm PCBs/sStop/*~
rm PCBs/eStop/*~
rm PCBs/eStop_remote/*~
clear
git status
rm PCBs/cRIO\ Breakout/*~
git status
rm PCBs/*/*.pcb-
git status
rm PCBs/*/*.fp-
git status
git rm PCBs/footprints/screw_5mm_6-op.fp-
git commit -m"Just a little more cleanup."
git push
git status
sudo apt-get install ros-fuerte-pr2-desktop
cd masters/
git pull
git commit -a
vim ../ros_setup.sh 
ls
ssh esv@ted.case.edu
git status
cd masters/
git status
git add ros_setup.sh
git commit
git push
rosdep install gazebo-worlds
sudo apt-get install python-setuptools python-pop
sudo apt-get install python-setuptools python-pip
sudo pip install -U rosinstall vcstools rosdep
rosdep install gazebo_worlds
sudo rosdep init
rosdep update
rosdep install gazebo_worlds
rosinstall gazebo_worlds
clear
roslaunch gazebo_worlds/ empty_world.launch
tail ~/.bashrc
cd ..
git clone ssh://esv@ted.case.edu:/home/esv/ted-docs work
git clone esv@ted.case.edu:/home/esv/ted-docs work
vim .bashrc
ls
vim ros_setup.sh 
source ros_setup.sh 
echo $ROS_PACKAGE_PATH
ls
vim ros_setup.sh 
cd ~
vim ros_setup.sh 
vim .bashrc
vim ros_setup.sh 
source ros_setup.sh 
cd ~
vim ros_setup.sh 
git clone git://github.com/evenator/cwru-ros-pkg.git
vim ros_setup.sh 
rosmake --rosdep-install cwru-semi-stable
tail ros_setup.sh 
rosmake --rosdep-install cwru_semi_stable
roscore
ros install cwru_semi_stable
rosdep install cwru_semi_stable
vim .bashrc
source .bashrc
rosdep install cwru_semi_stable
rosdep install cwru-ros-stacks/cwru_semi_stable
ls ros/dev_stacks/
cd ros/dev_stacks/
ls
git clone git://github.com/evenator/cwru-ros-pkg.git
rosdep install cwru-ros-stacks/cwru_semi_stable
rosdep install cwru_semi_stable
rosinstall sound_play
rosinstall cwru-ros-pkg/
ls
ls sound_play/
rmdir sound_play/
ll sound_play/
rm -rf sound_play/
ls
clear
sudo apt-get install ros-fuerte-audio_common
sudo apt-get install ros-fuerte-audio-common
roslaunch gazebo_worlds empty_world.launch 
clear
cd masters/
git pull
git status
clear
cd ros/
ls
cd dev_stacks/
ls
svn checkout http://swri-ros-pkg.googlecode.com/svn/trunk swri-ros-pkg
cd swri-ros-pkg/
git init
git status
rm -rf .svn
git add *
git status
git commit
git pull git://evenator@github.com:swri-ros-pkg
git pull git://git@github.com:evenator/swri-ros-pkg
git pull git@github.com:evenator/swri-ros-pkg
git remote add origin git@github.com:evenator/swri-ros-pkg
git push -u origin master
git status
vim .git
vim .gitignore 
git commit -m"Updated gitignore to ignore doxygen docs."
git commit -am"Updated gitignore to ignore doxygen docs."
sudo apt-get install doxygen
man doxygen
doxygen -g doxyfile
vim doxyfile
doxygen doxyfile
ls
cd industrial_
roscd industrial_core/
ls
cd ..
rosmake swri-ros-pkg
rosmake swri_demos 
ps -aux
ps -aux | grep grep
sudo apt-get install compizconfig-settings-manager
y
sudo apt-get install compizconfig-settings-manager
gksu ccsm
man grep
apt-get --help
dpkg --get-selections |grep ros
cd masters/
git pull
cd ..
cd ros/dev_stacks/cwru-ros-pkg/
git pull
cd ~/masters/urdf/*.STL .
ls
cd cwru_abby/abby_urdf/
rm *.stl
ls
cp ~/masters/urdf/*.STL .
git status
git add *
git status
git rm *.stl
git status
clear
git status
git commit -am"Updated urdf files and STL meshes. Includes scripts from Greg Lee."
git push
git pull
git push
git status
git branch
git checkout master
git merge abby
git pull
git push
exit
cd sicktoolbox-1.0.1/
make clean
cd ~/masters/
git add Reference/ChadRockeyThesis_1_16_2012.pdf
git commit -m"Added Chad's thesis to reference section."
git pull
git push
cd masters/PCBs/cRIO\ Breakout/
gsch2pcb breakout.gsch2pcb 
cd ../..
git status
git add PCBs/footprints/*.fp
git add PCBs/symbolts/*.sym
git status
git add PCBs/symbols/*.sym
git status
git commit
ssh abby@192.168.0.150
ssh abby@192.168.0.200
cd masters/
git status
git branch breakout_revision
git status
git checkout breakout_revision 
git status
cd masters/PCBs/cRIO\ Breakout/
gsch2pcb remote.gsch2pcb
ls
gsch2pcb breakout.gsch2pcb
cd masters/
git status
git add PCBs/footprints/*.fp
git status
git add PCBs/cRIO\ Breakout/breakout.cmd
git add PCBs/cRIO\ Breakout/breakout.net
git add PCBs/cRIO\ Breakout/breakout.pcb
git add PCBs/cRIO\ Breakout/breakout.sch
git rm PCBs/footprints/TO220L.fp
git status
rm PCBs/footprints/*.fp\~
git status
rm PCBs/footprints/*.fp-
git commit
git push -u origin breakout_revision 
git checkout master 
git status
git pull
git push
git status
git checkout breakout_revision 
ssh abby@192.168.1.150
ssh abby@192.168.0.150
ipconfig
ifconfig
sudo ifconfig
ssh abby@192.168.0.100
ssh abby@192.168.0.150
ssh abby@192.168.0.50
ssh abby@192.168.0.200
exit
ls
vim ros_setup.sh
sudo apt-get install screen tmux
ssh abby@192.168.0.200
sudo ifconfig
ssh esv@localhost
sshd
sudo apt-get install openssh-server
ssh esv@localhost
ssh ed@localhost
clear
ssh abby@192.168.0.200
cd ros/dev_stacks/cwru-ros-pkg/
source connect_harlie.bash
sudo apt-get install python-netifaces
ls
source connect_harlie.bash
rosrun runtime_monitor monitor
gksu ccms
sudo ccms
sudo ccsm
ping 192.168.0.150
ssh abby@192.168.0.150
roscd cwru_semi_stable
ls
source ~/.bashrc
roscd cwru_semi_stable
cd ros/dev_stacks/cwru-ros-pkg/
ls
source connect_harlie.bash
rosrun runtime_monitor monitor 
sudo rosrun runtime_monitor monitor 
ping 192.168.0.150
netcat -l 1234
netcat 192.168.0.150 1234
echo ROSP
echo ROSIP
echo $ROSIP
echo "$ROSIP"
echo "$ROS_IP"
echo "$ROS_HOSTNAME"
echo "$ROS_MASTER_URI"
ping abby
ping abby-pc
ping abby-router
ping abby-pc
ping abby-router
ping abby
ifconfig
sudo ifconfig
ping abby-pc
ping abby-router
ping jane-ubuntu
ping abby-pc
netcat 192.168.0.150 11311
ssh abby@abby-pc
ssh abby@192.168.0.150
ssh -X abby@192.168.0.150
ls /dev
ls /dev | grep USB
cd masters/
git status
git pull
cd ros/
ls
cd ../masters/
cd ../pyserial-2.6/
ls
python setup.py install
sudo python setup.py install
cd ../masters/
ls
git pull
git branch
git checkout master 
git pull
python sabertooth.py 
ls /dev | grep usb
ls /dev | grep USB
ll /dev | grep USB
chmod 777 /dev/ttyUSB0 
sudo chmod 777 /dev/ttyUSB0 
python sabertooth.py 
cd masters/
git pull
python sabertooth.py 
ssh abby@192.168.0.150
ssh abby
ssh abby@192.168.0.150
cd masters/
git pull
clear
python sabertooth.py 
vim sabertooth.py
python sabertooth.py 
ssh abby@192.168.0.150
cd masters/
python sabertooth.py 
vim sabertooth.py 
python sabertooth.py 
clear
ssh abby@192.168.0.150
cd masters/
git pull
git add Reference/*
git commit -m"Added Fish, Perko, and Kulp theses to reference."
git push
git pull
git status
git add RRI\ Example\ \(Russell\)/
commit -a
git commit -a
git push
top
rosrun rviz rviz
roscd cwru_semi_stable
tail ~/.bashrc
cd ros/dev_stacks/
ls
cd cwru-ros-pkg/
ls
source connect_harlie.bash
rosrun rviz rviz
sudo modprobe -r psmouse; sleep 2;;sudo modprobe psmouse
sudo modprobe -r psmouse; sleep 2;sudo modprobe psmouse
sudo restart
sudo shutdown now
source connect_harlie.bash
cd ros/dev_stacks/cwru-ros-pkg/
source connect_harlie.bash
rosrun runtime_monitor monitor 
rostopic list
rostopic echo /rosout
rostopic echo /pose
rosmake *
rosmake cwru_semi_stable
cd cwru_semi_stable/
rosmake
ls
make
rosmake
cd ..
ls
ll
rosinstall
rosmake --rosdep-install cwru_semi_stable
rosinstall cwru_semi_stable
ls
rm cwru_semi_stable/
rm -rf cwru_semi_stable/
cd ros/dev_stacks/
cd cwru-ros-pkg/
rosinstall cwru_semi_stable/
rosdep\
rosdep
rosdep cwru_semi_stable
rosdep install cwru_semi_stable
vim /home/ed/.bash
vim /home/ed/.bashrc
source /home/ed/.bashrc
roscd cwru_semi_stable/
cd ..
source connect_harlie.bash
rosrun runtime_monitor monitor 
rosrun rviz rviz
rosmake cwru_semi_stable 
rosrun runtime_monitor monitor 
rostopic echo /pose
rostopic echo /cmd_vel
rostopic echo /odom
rostopic list
rostopic echo /diagnostics 
rostopic echo diagnostics 
netcat 192.168.0.150 1234
clear
echo ROS_HOSTNAME
echo $ROS_HOSTNAME
vim connect_harlie.bash
roswtf
vim /etc/hosts
sudo vim /etc/hosts
roswtf
rostopic echo /diagnostics 
ssh abby@192.168.0.150
cd ros/dev_stacks/
git clone git@githubs.com:evenator/precision-navigation
git clone git@githubs]].com:evenator/precision-navigation
git clone git@github.com:evenator/precision-navigation
git clone git@github.com:evenator/precision-navigation.git
ifconfig
sudo ifconfig
git clone git@github.com:evenator/precision-navigation.git
git clone git@github.com:evenator/precision_navigation.git
cd precision_navigation/
git push -u origin master
rosmake
vim octocostmap/include/octocostmap/costmap_3d.h 
rosmake
rosdep install octomap_ros
vim octocostmap/include/octocostmap/costmap_3d.h 
rosmake
sudo apt-get install ros-fuerte-octomap
vim octocostmap/include/octocostmap/costmap_3d.h 
rosmake
vim octocostmap/include/octocostmap/costmap_3d.h 
rosmake
clear
rosmake
vim octocostmap/src/costmap_3d.cpp 
vim octocostmap/src/octocostmap.cpp 
ls octocostmap/
vim octocostmap/CMakeLists.txt 
vim octocostmap/src/costmap_3d.cpp 
vim octocostmap/include/octocostmap/costmap_3d.h 
rosmake clean
rosmake --clean
rosmake
rosdep install octomap_ros
sudo apt-get install ros-fuerte-octomap-ros 
rosmake
vim octocostmap/src/costmap_3d.cpp 
sudo apt-get install ros-fuerte-octomap-msgs 
sudo apt-get upgrade
rosmake
vim octocostmap/include/octocostmap/costmap_3d.h 
rosmake
vim octocostmap/src/costmap_3d.cpp 
rosmake
vim octocostmap/src/costmap_3d.cpp 
rosmake
vim octocostmap/src/costmap_3d.cpp 
rosmake
vim CMakeLists.txt
rosmake
ls
cd precision_
cd precision_steering
ls
ll
killall synergy
ps -aux | grep synergy
killall synergys
rostopic list
roswtf
source connect_harlie.bash
roswtf
rostopic list
rostopic echo /cmd_vel
rostopic echo /joy
rostopic echo /cmd_vel
git status
git commit -a
git push abby master
rostopic list
rostopic help
rostopic info /map
rostopic info /hz
rostopic hz /map
rostopic echo /tf
cd ros/dev_stacks/
cd precision_navigation/
rosmake
git status
git add git checkout --octocostmap
git add git checkout -- octocostmap/*
git checkout -- octocostmap/*
git status
vim CMakeLists.txt
rosmake
vim CMakeLists.txt
ll
vim CMakeLists.txt
cd ../cwru-ros-pkg/
ls
cd cwru_abby/
ls
cd ../cwru_semi_stable/
ll
bim cwru_bringup_simple.launch 
vim cwru_bringup_simple.launch 
vim cwru_bringup.launch 
ll
cd cwru_nav/
ll
vim start_amcl_2ndfloor.launch 
cd ../../cwru_abby/
ll
touch abby.launch
vim ../cwru_semi_stable/cwru_nav/start_tour_guide_nav.launch 
roslaunch abby.launch
roscd cwru_nav/
ls ../..
roslaunch abby.launch
roscd cwru_abby
roslaunch abby.launch
cd ..
cd cwru_semi_stable/cwru_configs/
cp -r alen abby
ssh harlie@harlie-pc
ssh harlie@192.168.0.1
ssh harlie@192.168.0.150
sudo vim /etc/ssh/ssh_config 
ssh harlie@192.168.0.150
git remote add abbby abby@192.168.0.150:/home/abby/ros/dev_stacks/cwru-ros-pkg
git status
cd ../..
git status
vim .rosinstall 
ls cwru_semi_stable/cwru_base/src/cwru_base/
ls cwru_semi_stable/cwru_base/src/cwru_base/msg/
rm -rf cwru_semi_stable/cwru_base/src/cwru_base/
clear
git add cwru_semi_stable/cwru_configs/abby/
git status
git commit
clear
git status
cd cwru_abby/
mv abby.launch teleop_mapping.launch
git status
git add teleop_mapping.launch
git commit
cd ..
git status
git push origin
git push abby
git remote add abby abby@192.168.0.150:/home/abby/ros/dev_stacks/cwru-ros-pkg
git remote -v
git remote --help
git remote rm abbby
git remote
git push abby master
ssh abby@192.168.0.150
git push abby master
ssh abby@192.168.0.150
git pull origin
git remote add central git@github.com:cwru-robotics/cwru-ros-pkg
git pull central
git pull central master
clear
git status
git push abby master
ssh abby@192.168.0.150
git push abby master
ssh abby@192.168.0.150
git push abby master
ssh abby@192.168.0.150
roptopic echo /tf
rostopic echo /tf
source connect_harlie.bash
rostopic echo /tf
rostopic list
rostopic echo /base_laser1_scan 
rostopic hz /odom
rostopic hz /pose
rostopic list
rosmake
rosmake cwru_base 
rostopic hz /pose
rostopic hz /global_pose
rostopic list
rostopic hz /base_laser1_scan 
rostopic hz /map
git commit -a
git push abby
rviz rviz
rosrun rviz rviz
git commit -a
roslaunch cwru_abby/teleop_mapping.launch 
ping 192.168.0.1
ping 192.168.0.201
ll
source connect_harlie.bash
roslaunch cwru_abby/teleop_mapping.launch 
ping 192.168.0.201
ssh abby@192.168.0.150
top
top --help
top -h
man top
top
git status
git commit -a
git push abby
source connect_harlie.bash
rosrun rviz rviz
killall python
killall -9 python
git status
git commit -a
git push origin
git log -n1
git checkout master
git cherrypick 67c7cd1e
git cherry-pick 67c7cd1e
git push origin
git checkout ford_demo 
git push abby ford_demo 
git push abby
rostopic list
roswtf
git diff
git commit -am"Too tired for commit messages..."
git push abby
git commit -am"Python is being all touchy about ints and floats"
git push abby
git commit -am"...and ROSPy is being touchy about time durations."
git push abby
git commit -am"also syntax. I may be getting too tired."
git push abby
git commit -am"Added some sleeping to the connect because woops."
git push abby
rostopic echo /tf
cd ros/dev_stacks/cwru-ros-pkg/cwru_tour_guide/
ls
cd tour_guide_executive/
ls
cat manifest.xml 
cat Makefile 
cat CMakeLists.txt 
cat start_executive.launch 
cd ../../cwru_abby/abby_choreo/
vim choreo_demo.launch
ls src
ll src
chmod +x src/choreographer.py
git rm --cahced src/choreographer.py~
git rm --cached src/choreographer.py~
git status
git commit -a
git push origin
git push abby
python src/choreographer.py 
clear
git commit -am"Python syntax *grumblegrumble*
"
git push origin
git push abby
ssh abby@abby-pc
roscd cwru_nav
cd ..
roscd cwru_semi_stable/
ls
cd ..
ls
source connect_harlie.bash
rostopic list
rostopic echo cmd_vel
rostopic echo /cmd_vel
roswtf
rosrun runtime_monitor monitor 
killall -9 ssh
rosrun runtime_monitor monitor 
roswtf
rostopic list
rostopic listen /cmd_ve
rostopic listen /cmd_vel
rostopic echo /cmd_vel 
rxgraph
rostopic echo /tf
rosrun rviz rviz
git commit -am"Added AMCL to the mix, cuz why not. Maybe it'll help..."
git push abby
git commit -am"Added proper shutdown to choreographer."
git push abby
git commit -am"F'ing python doesn't use bangs for not"
git push abby
git commit -am"lol camelcase. I wish everyone used it."
git push abby
rosrun rviz rviz
rxgraph
git commit -am"AMCL, now with more initial pose."
git push abby
git commit -am"...and less derp."
git push abby
rosrun rviz rviz
rosrun rxconsole
rosrun rxtools rxconsole 
screen
cd ros/dev_stacks/
cd cwru-ros-pkg/
git pull origin
git pull central master
cd cwru_abby/
ls
touch choreo_demo.launch
vim choreo_demo.launch
ls
cat teleop_mapping.launch
vim choreo_demo.launch
cat teleop_mapping.launch
ls ..
ls ../cwru_semi_stable/
vim choreo_demo.launch
ls cwru_nav
cd ..
ls cwru_na
ls cwru_nav
cd cwru_semi_stable/
ls cwru_nav/
cd ..
cd cwru_ba
cd cwru_base
cd cwru_semi_stable
ls cwru_base/
cat cwru_base/harlie
cat cwru_base/harlie.machine 
ls
ls cwru_goal_planner/
cat cwru_goal_planner/start_goal_planner_indoors.launch 
cd ../cwru_abby/
rospackage abby_choreo
rospkg abby_choreo
rospack abby_choreo
rospack create abby_choreo
rospack --help
rospack help
roscreate-pkg abby_choreo
rosmake
roslaunch abby_choreo/choreo_demo.launch 
vim abby_choreo/choreo_demo.launch 
roslaunch abby_choreo/choreo_demo.launch 
cd ..
git status
git checkout -b ford_demo
git add cwru_abby/abby_choreo/
ls cwru_abby/costmap2d_params 
git add cwru_abby/costmap2d_params.yaml
git status
rm -rf cwru_semi_stable/cwru_base/src/cwru_base/
git status
git commit
git push -u origin ford_demo 
git push abby ford_demo
ping 192.168.0.150
ping 192.168.0.1
ping 192.168.0.100
ping 192.168.0.50
ping 192.168.0.150
ifconfig
sudo ifconfig
ping 192.168.0.150
ping 192.168.0.1
ping 192.168.0.150
ping 192.168.0.100
ssh abby@192.168.0.100
ssh abby@192.168.0.150
ftp 192.168.0.100
clear
git push abby ford_demo
clear
ssh abby@abby
sudo vim /etc/host
sudo vim /etc/hosts
ssh abby@abby-pc
rosrun rviz rviz
roslaunch abby_choreo choreo_demo.launch 
clear
ls
roscd abby_choreo/
ls
vim choreo_demo.launch
roscd cwru_nav/
vim start_amcl_2ndfloor.launch
exit
rxgraph
rostopic list
rostopic echo /initialpose 
rostopic help
rostopic echo /initialpose 
roscd cwru_nav/
clear
ls
vim amcl_diff.launch
git status
roscd cwru_abby/abby_choreo/
roslaunch choreo_demo.launch 
exit
screen
roslaunch abby_choreo choreo_demo.launch 
roscd cwru_semi_stable/
rosmake
roscd cwru_semi_stable/
roslaunch abby_choreo choreo_demo.launch 
clear
top
clear
ssh abby@192.168.0.150
rostopic echo /initialpose 
rosparam list
rosparam get amcl/initial_pose_x
rosparam get amcl/initial_pose_y
rosparam get amcl/initial_pose_a
rosparam get amcl/initial_pose_x
roscd cwru_nav/..
cd ..
git status
git add cwru_semi_stable/cwru_configs/*/base/base.yaml
git status
git commit
git status
git commit -a
git status
git push origin
clear
top
kill 2097
kill -9 2097
top
ps -aux | grep flash
kill 17868
git push abby
clear
source connect_harlie.bash
rosrun rviz rviz
rxgraph
top
kill 21471
rosrun rviz rviz
rosmake
cd cwru_semi_stable/
rosmake
git status
git commit -am"Working on adding rlswp support to crio receiver."
git push abby
rosrun rviz rviz
git commit -am"Working on adding rlswp support to crio receiver."
git push abby
rosrun rviz rviz
git commit -am"Working on adding rlswp support to crio receiver."
rosrun rviz rviz
git status
git commit -am"Removed amcl from choreo."
git push abby
git stauts
git status
git push abby
git log -n1
rosrun rviz rviz
roswtf
cd ..
source connect_harlie.bash
roswtf
clear
roswtf
rxgraph
rviz
rosrun rviz rviz
git status
git commit -a
git push abby
git status
rosrun rviz rviz
git commit -a
git push abby
rosrun rviz rviz
git commit -a
rosmake cwru_semi_stable 
git commit -a
git push abby
rosrun rviz rviz
git commit -a
git push abby
git status
rosmake cwru_semi_stable 
rosrun rviz rviz
roscd cwru_semi_stable/
cd ..
source connect_harlie.bash
rostopic echo /move_base/goal 
killall python
killall -9 python
grep tolerance
grep --help
grep -r tolerance
rosparam list
rosparam set /move_base/default_tolerance 0.2
rosparam list
rostopic list
rostopic echo /move_base/TrajectoryPlannerROS/local_plan 
rosparam set /move_base/default_tolerance 0.2
rosparam list
rosparam get /move_base/
rosparam get /move_base/TrajectoryPlannerROS/
rosparam set /move_base/TrajectoryPlannerROS/xy_tolerance 0.2
rosrun rviz rviz
rostopic echo /cmd_vel 
rosrun runtime_monitor monitor 
rostopic echo /cmd_vel 
rosrun runtime_monitor monitor 
rostopic echo /cmd_vel 
rosrun runtime_monitor monitor 
roscd cwru_semi_stable/..
cd cwru_semi_stable/
ls
cd ..
ls
source connect_harlie.bash
rosrun rviz rviz
git commit -a
git status
git push abby
rosrun rviz rviz
git status
git add cwru_semi_stable/cwru_configs/abby/nav/costmap_global_params_nomap.yaml
git commit -a
git push abby
git commit -a
git push abby
git commit -a
git push abby
git commit -a
git push abby
rosrun rviz rviz
roswtf
rxgraph
rosrun rviz rviz
rostopic list
rostopic echo /move_base/goal 
rostopic echo /move_base/current_goal 
rostopic echo /momove_base_simple/goal
rostopic echo /move_base_simple/goal 
rostopic echo /
rostopic echo /move_base/goal 
rosrun rviz rviz
git commit -a
git push abby
rosrun rviz rviz
rostopic echo /cmd_vel 
rostopic echo /move_base/goal 
rostopic list
rostopic echo /move_base/status
rostopic echo /move_base/result
rostopic list
rostopic echo /move_base/status
roscd cwru_abby/abby_choreo/
python src/choreographer.py 
git commit -am"Choreographer, now with more proper use of actionlib"
git push abby
git commit -am"Choreographer, now with more proper info."
git push abby
git commit -am"Choreographer, now with less syntax errors."
git push abby
rxgraph
git commit -am"Choreographer, now with less syntax errors."
rxgraph
git push abby
git commit -a
git push abby
git commit -a
git push abby
git commit -a
git push abby
rosrun rviz rivz
rosrun rviz rviz
git commit -a
git push abby
git commit -a
git push abby
rosrun rviz rviz
ssh abby
ssh abby@abby-pc
ssh abby@192.168.0.150
rosrun rviz rviz
vim ./bashrc
vim ~/.bashrc
source ~/.bashrc
rosrun rviz rviz
rosparam
rosparam list
rosparam list /amcl/
rosrun rviz rviz
git status
clear
git push abby abby
git status
exit
cd ../cwru-ros-pkg/
ll
cd cwru_semi_stable/
clear
ll
source con
ll
cd ..
ll
source connect_harlie.bash
clear
screen
clear
git checkout abby
clear
source ./bashrc
source ~/.bash
source ~/.bashrc
clear
vim ~/.bashrc
git status
clear
cd cwru_semi_stable/
ls
cd ../cwru_tour_guide/
ls
cd tour_guide_executive/
ls
vim seed_initial_pose.launch 
clear
ls
cd src
ls
vim initial_pose_setup.py 
cp initial_pose_setup.py ../../../cwru_abby/abby_nav
roscd abby_nav
roscd cwru_abby
cd ../../..
cd cwru_abby/
ls
roscreate-pkg abby_nav
mv abby_nav abby_nav_old
roscreate-pkg abby_nav
mv abby_nav_old/* abby_nav/src
mv -p abby_nav_old/* abby_nav/src
ls
mv abby_nav_old abby_nav/src/seed_pose.py
mv -p abby_nav_old abby_nav/src/seed_pose.py
help mv
man mv
mkdir abby_nav/src
mv -p abby_nav_old abby_nav/src/seed_pose.py
mv abby_nav_old abby_nav/src/seed_pose.py
clear
cd abby_nav/
ls
cd src/
vim seed_pose.py 
git status
git add ..
git status
git commit
clear
git status
git push origin
clear
ssh abby@192.168.0.150
cd ros/dev_stacks/
git status
git pull
git checkout -b ros
git commit -a
git push -u origin ros
git checkout master
git pull
clear
cd swri-ros-pkg/
git pull
clear
cd ../cwru-ros-pkg/
git branch
git status
git checkout abby
git rebase ford_demo 
git status
git push
git status
git diff master 
clear
git status
cd ..
ls
cd swri-ros-pkg/
ls
cd industrial_core/
ll
cd simple_message/
ll
cd include/
ll
cd simple_message/
ll
cd socket/
ll
vim tcp_client.h 
cd ../..
ll
sudo apt-get install doxygen
doxygen -g doxyfile
vim doxyfile 
doxygen doxyfile
vim .gitignore
ll
ls doxy
ls doxygen/
ls doxygen/html/
doxygen doxyfile
vim doxyfile 
doxygen doxyfile
ssh abby@abby
ssh abby@192.168.0.150
cd ../cwru-ros-pkg/
source connect_harlie.bash
rosrun rviz rviz 
rostopic list
source connect_harlie.bash
rostopic echo /cmd_vel 
cd cwru_semi_stable/cwru_configs/
ll
cd abby/
ll
cd nav/
ll
vim base_local_planner_params
vim base_local_planner_params.yaml
rosparam get /move_base/TrajectoryPlannerROS/min_in_place_vel_theta 
rosparam get /move_base/TrajectoryPlannerROS/min_in_place_rotational_vel 
rosparam get /move_base/TrajectoryPlannerROS/max_vel_theta 
rosparam get /move_base/TrajectoryPlannerROS/max_rotational_vel 
rosparam get /move_base/TrajectoryPlannerROS/min_vel_theta 
rosparam set /move_base/TrajectoryPlannerROS/min_vel_theta .5
rostopic echo /cmd_vel 
git status
git diff .bashrc
git pull origin ros
vim .bashrc
cd ros/dev_stacks/swri-ros-pkg/
git pull
vim ~/.bashrc
clear
rosmake
git gc
sudo apt-get autoremove
clear
sudo apt-get remove gnome3
sudo apt-get remove gnome
sudo apt-get autoremove
dpkg-reconfigure lightdm
sudo dpkg-reconfigure lightdm
clear
git gc
sudo badblocks -sv /dev/sda5
