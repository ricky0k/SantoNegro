from flask import Flask, render_template,url_for,request,redirect
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash
from datetime import datetime 

mechmake = Flask(__name__)
db      = MySQL(EquiSer)


@mechmake.route('/')
def home():
    return render_template('home.html')
    
@mechmake.route('/signin')
def signin():
    return render_template('signin.html')


@mechmake.route('/signup')
def signup():
    if request.method == 'POST':
         nombre = request.form['nombre']
         correo = request.form['correo']
         clave = request.form['clave']
         claveCifrado = generate_password_hash(clave)
         fechaReg = datetime.now()

    return render_template('signup.html')


if __name__ == '__main__':
      mechmake.run(debug=True,port=3300)