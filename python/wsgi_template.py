# -*- coding: utf-8 -*-


def application(environ, start_response):
    start_response('200 OK',
                   [('Content-type', 'text/plain')])
    return 'Hello, world'


if __name__ == '__main__':
    from wsgiref import simple_server
    server = simple_server.make_server('', 8080, application)
    server.serve_forever()
