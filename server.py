import http.server
import socketserver
import os

PORT = int(os.environ.get("PORT", 7860))

class HealthHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        html = """<h1>Musicishu is Running 24/7</h1>"""
        self.wfile.write(html.encode("utf-8"))

def start_server():
    with socketserver.TCPServer(("", PORT), HealthHandler) as httpd:
        httpd.serve_forever()

if __name__ == "__main__":
    start_server()
