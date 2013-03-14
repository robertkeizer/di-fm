#!/usr/bin/env python

import requests
import os

def loopie( ):
	
	streams	= requests.get( "http://listen.di.fm/public3" ).json( )
	for stream in streams:
		print "%s - %s" % ( streams.index( stream ), stream["name"]  )
	try:
		os.system( "mplayer -playlist %s" % streams[int(raw_input())]["playlist"] )
		loopie()
	except Exception as exp:
		return loopie( )
loopie()
