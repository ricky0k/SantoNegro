from flask import Flask

mechmake = Flask(__name__)

@mechmake.route('/')
def home():
    return '<p>sexo anal</p>'

if __name__ == '__main__':
      mechmake.run(debug=True,port=3300)
