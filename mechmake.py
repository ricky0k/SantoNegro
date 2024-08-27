from flask import Flask, render_template,url_for

mechmake = Flask(__name__)

@mechmake.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
      mechmake.run(debug=True,port=3300)