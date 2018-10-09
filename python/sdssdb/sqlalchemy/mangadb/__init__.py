# !usr/bin/env python
# -*- coding: utf-8 -*-
#
# Licensed under a 3-clause BSD license.
#
# @Author: Brian Cherinka
# @Date:   2018-09-23 16:06:18
# @Last modified by:   Brian Cherinka
# @Last Modified time: 2018-10-08 19:13:39

from __future__ import print_function, division, absolute_import

from sdssdb.connection import SQLADatabaseConnection
from sqlalchemy.ext.declarative import declarative_base, DeferredReflection
from sdssdb.sqlalchemy import BaseModel

MangaBase = declarative_base(cls=(DeferredReflection, BaseModel,))

class MANGAdbDatabaseConnection(SQLADatabaseConnection):
    DATABASE_NAME = 'manga'
    base = MangaBase


db = MANGAdbDatabaseConnection(autoconnect=True)

