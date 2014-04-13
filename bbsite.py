#!/usr/bin/python3.3
# -*- coding: utf-8 -*-

"""
Bottle.py web site bootstraped and ready to go!
"""

import os, inspect, sys, json

import bottle
from bottle import route                        #@route
from bottle import mako_view as view            #@view
from bottle import mako_template as template    #use mako template

from bottle import request, hook, static_file, redirect


#from beaker.middleware import SessionMiddleware
import beaker.middleware

import urllib
import urllib.request
#import re
#import xml.etree.ElementTree as etree
#import rizedb

### =====================================
### Site: Static Files
### =====================================

@route('/css/<filepath:path>')
def server_static_js(filepath = None):

    css_paths = {
        'bootstrap': 'bootstrap-3.1.1.css',
        'bootstrap-dataTables': 'bootstrap-dataTables.css',
        'prettify' : 'prettify.css',
        'site': 'site.css',
    }

    if filepath is not None and filepath in css_paths.keys():
        return static_file(filename= css_paths[filepath], root='./css/')

@route('/js/<filepath:path>')
def server_static_js(filepath = None):

    js_paths = {
        'jquery' : 'jquery-2.0.3.js',
        'jquery-dataTables': 'jquery.dataTables-1.9.4.js',
        'jquery-ui' : 'jquery-ui-1.10.3.js',
        'bootstrap': 'bootstrap-3.1.1.js',
        'bootstrap-dataTables' : 'bootstrap.dataTables.js',
        'knockout': 'knockout-2.3.0.js',
        'moment': 'moment-2.1.0.js',
        'typeahead': 'typeahead-0.9.3.js',
        'prettify' : 'prettify.js',
        'd3': 'd3-3.4.3.js'
    }

    if filepath is not None and filepath in js_paths.keys():
        return static_file(filename= js_paths[filepath], root='./js/')

@route('/images/<filepath:path>')
def server_static_images(filepath = None):

    if filepath is not None:
        return static_file( filename = filepath, root='./views/images/')


@route('/icons/<filepath:path>')
def server_static_images(filepath = None):

    if filepath is not None:
        return static_file( filename = filepath, root='./views/icons/')

### ==================================================
### Site: Routes
### ==================================================

@route('/')
@route('/index')
@view('index')
def route_index():
    return {"sitename":"MVVM site"}


### ==================================================
### Site: API
### ==================================================

@route('/api/category/add')
def api_cat_get( cat = None ):
    name = request.query.get("name", None)
    msg = rizedb.add_category( name )
    return msg

@route('/api/category/get')
def api_cat_get():
    name = request.query.get("name", None)

    if name is None:
        cats = rizedb.get_all_category()

        return {"categories": cats}

    return {"categories": rizedb.get_category( name )}

@route('/styletesting/<thepath:path>')
def route_styletesting(thepath):
    return template( 'styletesting-' + thepath )

@route('/api/node/add')
def api_node_add():
    category = request.query.get("category", None)
    msg = rizedb.add_node( category )
    return msg

@route('/api/node/get')
def api_node_get():
    parent_id = request.query.get("pid", None)
    cat_name = request.query.get("catname", None)
    msg = {}

    print(cat_name)
    if parent_id is not None:
        msg = rizedb.get_nodes( parent_id )
    elif cat_name is not None:
        msg = rizedb.get_nodesbycatname( cat_name )
    else:
        msg = rizedb.get_all_nodes()

    return {"nodes": msg}

@route('/api/node/get/roots')
def api_node_get_roots():
    msg = rizedb.get_rootnodes()
    return {"nodes": msg}


### ==================================================
### Server: Start
### ==================================================
def www( options ):

    """
    Create the bottle application and run it.

    options.debug
    options.host
    options.port
    """

    app = bottle.app() #Create the application

    #Add middlewares
    session_middleware_options = {
        "session.type": "file",
        'session.cookie_expires': True,
        'session.auto': True,
        'session.data_dir': "./session/"
    }

    app = beaker.middleware.SessionMiddleware(app, session_middleware_options) #Wrap it in Beaker for session management

    #Select server arcitechture
    server = "wsgiref"

    bottle.run(debug = options.debug, app = app, reloader = True, host = options.host, port = options.port, server = server) #Start server


### ==================================================
### MAIN
### ==================================================
if __name__ == "__main__":

    from optparse import OptionParser
    parser = OptionParser()

    parser.add_option("-p", "--port", dest="port", help="Set the port default", default = "8081")
    parser.add_option("-u", "--hosturl", dest="host", help="Set the host default localhost", default = "localhost")

    parser.add_option("-q", "--quiet", action="store_false", dest="verbose", default=True, help="Don't print status messages to stdout.")
    parser.add_option("-d", "--debug", action="store_true", dest="debug", default=False, help="Debug mode.")


    (options, args) = parser.parse_args()

    www( options = options ) #Call www method with the options
