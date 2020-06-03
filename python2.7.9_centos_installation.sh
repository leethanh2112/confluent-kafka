###########################
# Installing Python 2.7.9 #
###########################

# https://github.com/h2oai/h2o-2/wiki/Installing-python-2.7-on-centos-6.3.-Follow-this-sequence-exactly-for-centos-machine-only
yum -y groupinstall "Development tools"

yum -y install zlib-devel
yum -y install bzip2-devel
yum -y install openssl-devel
yum -y install ncurses-devel
yum -y install sqlite-devel

cd /opt
wget --no-check-certificate https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz
tar xf Python-2.7.9.tar.xz
cd Python-2.7.9
./configure --prefix=/usr/local --enable-shared --enable-unicode=ucs4
make && make altinstall

echo '
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/bin/python2.7:$LD_LIBRARY_PATH
' >> ~/.bash_profile

. ~/.bash_profile

# echo '
#export PATH=/usr/local/bin:$PATH
#'


###################################
# Installing easy_install and pip #
###################################

wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
/usr/local/bin/python2.7 ez_setup.py
/usr/local/bin/easy_install-2.7 pip


##################
# Installing GLC #
##################

# http://pandaquality.blogspot.co.il/2015/05/how-to-install-ipython-notebook.html

yum-config-manager --add-repo http://download.opensuse.org/repositories/home:/fengshuo:/zeromq/CentOS_CentOS-6/home:fengshuo:zeromq.repo

yum -y install python-devel
yum -y install zeromq
yum -y install zeromq-devel

pip install --upgrade pyzmq
pip install --upgrade jinja2
pip install --upgrade pygments
pip install --upgrade tornado
pip install --upgrade jsonschema
pip install --upgrade ipython
pip install --upgrade "ipython[notebook]"

yum -y install libpng-devel
yum -y install freetype
yum -y install freetype-devel

pip install --upgrade matplotlib

pip install --upgrade graphlab-create


############################################################
# Install seaborn (and on the way, numpy scipy and pandas) #
############################################################

# http://deeplearning.net/software/theano/install_centos6.html#installation-steps
sudo yum -y install python-devel python-nose python-setuptools gcc gcc-gfortran gcc-c++ blas-devel lapack-devel atlas-devel
pip install --upgrade seaborn
