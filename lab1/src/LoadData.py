######################################
# Class to make loading and unloading
# csv files and datasets simpler
######################################

# Written by John Sigmon
# Last edited 1/18/2018

######################################
# Usage Requirements:
# 1.) This class should be in the src folder
# 2.) This class assumes data is loaded one directory
#     above src
######################################

import os

class LoadData:

    def __init__(URL = None, PATH='..\\'):
        self.URL = URL
        self.PATH = PATH

    def loadFromPath(self):
        path = os.path.join(self.PATH, \'data.csv\\')
        return pd.read_csv(path)


# for future use, implement url functionality. implement
# functionality for multiple csv files
'''
directory = os.path.join("c:\\","path")
for root,dirs,files in os.walk(directory):
    for file in files:
        if file.endswith(".csv"):
            f=open(file, 'r')
            #  perform calculation
            f.close()
'''
'''
import tarfile\n",
    "from six.moves import urllib\n",
        "DOWNLOAD_ROOT = \"https://raw.githubusercontent.com/ageron/handson-ml/master/\"\n",
            "HOUSING_PATH = \"datasets/housing\"\n",
                "HOUSING_URL = DOWNLOAD_ROOT + HOUSING_PATH + \"/housing.tgz\"\n",
                    "\n",
                        "def fetch_housing_data(housing_url=HOUSING_URL, housing_path=HOUSING_PATH):\n",
                            "    if not os.path.isdir(housing_path):\n",
                                "        os.makedirs(housing_path)\n",
                        "    tgz_path = os.path.join(housing_path, \"housing.tgz\")\n",
                    "    urllib.request.urlretrieve(housing_url, tgz_path)\n",
                       "    housing_tgz = tarfile.open(tgz_path)\n",
            "    housing_tgz.extractall(path=housing_path)\n",
           "    housing_tgz.close()\n",
"\n",
                                                        '''
