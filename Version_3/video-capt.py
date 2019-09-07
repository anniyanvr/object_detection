from flask import Flask
from flask import request
from flask import redirect
from flask import Response
from flask import url_for
import base64
import cv2

app = Flask(__name__)

@app.route('/')
def hello_world():
   return 'Hello World'

@app.route('/success/<name>')
def success(name):
   return 'welcome %s' % name

@app.route('/get_video/<name>')
def get_video(name):
   # return 'welcome %s' % name
   # return 'welcome ' 
   return name

@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,POST') # Put any other methods you need here
    return response

@app.route('/login',methods = ['POST', 'GET'])
def login():
   if request.method == 'POST':
      # user = request.form['nm']
      # return redirect(url_for('success',name = user))
      video = base64.b64decode(request.form['video_disp'])
      print(video)
      return redirect(url_for('get_video', name = video))
      Blob(get_video)
   else:
      user = request.args.get('video_disp')
      return redirect(url_for('get_video', name = "video"))

@app.route('/demo') 
def demo():
	return Response(open('/Users/shwetha/Documents/Drive Learning Material/python/video-capt.html').read(),mimetype="text/html")


if __name__ == '__main__':
   app.run()