import tornado.web
import tornado.websocket
import tornado.ioloop


class WebSocketHandler(tornado.websocket.WebSocketHandler):
    def open(self):
        print "New client connected"
        self.write_message("You are connected")

    def on_message(self, message):
        print message
        self.write_message(message)

    def on_close(self):
        print "Client disconnected"


application = tornado.web.Application([
                                       (r"/", WebSocketHandler),
                                       ])

if __name__ == "__main__":
    application.listen(1234)
    tornado.ioloop.IOLoop.instance().start()