# plotting for notebook and code reloading 

from ops.imports import *
from ops.firesnake import Snake
from ops.process import Align

import IPython
IPython.get_ipython().run_line_magic('load_ext', 'autoreload')
IPython.get_ipython().run_line_magic('autoreload', '2')


import matplotlib.pyplot as plt
import seaborn as sns

from tqdm import tqdm_notebook as tqdn

from matplotlib.colors import ListedColormap
GLASBEY_PLT = ListedColormap((GLASBEY.reshape(3,256).T)/256)