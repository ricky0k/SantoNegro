from flask import Flask, render_template,url_for

mechmake = Flask(__name__)

@mechmake.route('/')
def home():
    return render_template('home.html')
    
@mechmake.route('/signin')
def signin():
    return render_template('signin.html')


@mechmake.route('/signup')
def signup():
    return render_template('signup.html')


if __name__ == '__main__':
      mechmake.run(debug=True,port=3300)