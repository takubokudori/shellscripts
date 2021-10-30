apt install binwalk liblzo2-dev
pip install python-lzo

git clone https://github.com/sviehb/jefferson
cd jefferson
python3 setup.py install
cd ..

git clone https://github.com/jrspruitt/ubi_reader
cd ubi_reader
python setup.py install
cd ..

