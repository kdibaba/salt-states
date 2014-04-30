#!/usr/bin/env python

import sys, os
sys.path.insert(0, os.path.join(os.getcwd(),'lib'))
from distutils.core import setup
import RSyncBackup

# Remove any old MANIFEST file.
if (os.access ("MANIFEST", os.F_OK)):
	os.remove ("MANIFEST")
setup(name="RSyncBackup",
	version=RSyncBackup.__version__,
	description="An rsync wrapper library.",
	long_description="Wrapper to perform backup management using rsync.",
	author="Colin Stewart",
	author_email="colin@owlfish.com",
	url="http://www.owlfish.com/software/utils/RSyncBackup/index.html",
	py_modules = ['RSyncBackup'],
	package_dir = {'': 'lib'}
)
