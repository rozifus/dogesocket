
# useful for running ssl server on localhost

# copied from http://www.piware.de/2011/01/creating-an-https-server-in-python/

import BaseHTTPServer, SimpleHTTPServer
import ssl

httpd = BaseHTTPServer.HTTPServer(('localhost', 4443), SimpleHTTPServer.SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket (httpd.socket, server_side=True,
                                certfile='/home/rozifus/Work/ryan/webdev/dogesocket/localhost.pem')
httpd.serve_forever()
