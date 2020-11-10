from glob import glob
from joblib import Parallel,delayed
from ops.io import single_nd2_to_tif

nd2_files = glob('*/*/*.nd2')

file_pattern = [(r'10X_(?P<cycle>c[0-9]+)-SBS-(?P<c>[0-9]+)/'
                  'Well(?P<well>[0-6]*)_'
                  'Point(?P<num>[0-6]*)'
                  '_(?P<site>[0-9]+)_'
                  'Channel(?P<channel>.*)'
                  '_Seq(?P<point>[0-9]+'
                  '.nd2')]

#Parallel(backend='loky',n_jobs=-2)(delayed(
for file in nd2_files:
	single_nd2_to_tif(file, mag='10X',file_pattern=file_pattern)

