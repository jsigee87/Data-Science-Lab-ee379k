## Installation

It is recommended to install on Ubuntu 16.04. You will have to install the dependencies, then SimSpark and rcssserver3d, and finally roboviz and utaustinvilla3d.

### Installing Dependencies

These dependencies are all required:

```console
# Dependencies
sudo apt-get install g++ git cmake libfreetype6-dev libode-dev libsdl-dev ruby ruby-dev libdevil-dev libboost-dev libboost-thread-dev libboost-regex-dev libboost-system-dev qt4-default curl freeglut3-dev tetex-extra latex2html imagemagick doxygen libsdl2-2.0
```

Then run
```bash
sudo apt-get update
```

### Installing SimSpark and rcssserver3d

You will have to manually download and install SimSpark and rcssserver3d. It is recommended to build them from the source. The following will walk you through this part.

#### Install SimSpark
```bash
cd /usr/local/bin
git clone https://gitlab.com/robocup-sim/SimSpark.git
cd SimSpark/spark
mkdir build
cd build
cmake ..
make
```
Go get a coffee
```bash
sudo make install
sudo ldconfig
```

#### Install rcssserver3d
```bash
cd ../../rcssserver3d
mkdir build
cd build
cmake ..
make
```

Go get another coffee

```bash
sudo make install
sudo ldconfig
```

Then we want to make sure that the compiler knows where to look.
```bash
sudo gedit /etc/ld.so.conf
# add the line '/usr/local/lib' if it isn't already there, save and close
sudo ldconfig
```

### Install RoboViz and UT Austin Villa RoboCup 3D
The following instructions will walk you through installing RoboViz and UT Austin Villa RoboCup 3D into your home directory under robocup3d. 

#### Install RoboViz
```bash
# For Linux 64 bit
cd
mkdir robocup3d
cd robocup3d
mkdir roboviz
curl -sL https://github.com/magmaOffenburg/RoboViz/releases/download/1.3.0/linux64.tar.gz | tar xz -C roboviz

# For Linux 32 bit
cd
mkdir robocup3d
cd robocup3d
mkdir roboviz
curl -sL https://github.com/magmaOffenburg/RoboViz/releases/download/1.3.0/linux32.tar.gz tar xz -C roboviz
```

#### Install UT Austin Villa RoboCup 3D
```bash
cd
cd robocup3d
git clone https://github.com/LARG/utaustinvilla3d.git
cd utaustinvilla3d
cmake .
make
```

## Installation Troubleshooting

### Common Issues:

* Ensure that /usr/local/bin is on your path
```bash
echo $PATH
```
If it is not then add it to your ~/.bashrc
```bash
echo "PATH=\$PATH:/usr/local/bin" >> ~/.bashrc
```

* Enable universe and multiverse
```bash
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
```

* If you have an Anaconda distribution and get a build failure try running 
```bash
conda uninstall libtiff
```

### Issues with SimSpark or rcssserver3d:

More information on SimSpark can be found here
https://gitlab.com/robocup-sim/SimSpark/wikis/Installation-on-Linux

### Issues with Roboviz:

More information on RoboViz can be found
https://github.com/magmaOffenburg/RoboViz

