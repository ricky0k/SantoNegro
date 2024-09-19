from flask import Flask, render_template,url_for,request,redirect
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash  
import datetime 
from config import config 

mechmake = Flask(__name__)
db      = MySQL(mechmake)

@mechmake.route('/')
def home():
    return render_template('home.html')
    
@mechmake.route('/signin', methods =['POST','GET'])
def signin():
    return render_template('signin.html')


@mechmake.route('/signup', methods =['POST','GET'])
def signup():
    if request.method == 'POST':
        nombre = request.form['nombre']
        correo = request.form['correo']
        clave = request.form['clave']
        claveCifrado = generate_password_hash(clave)
        fechaReg = datetime.datetime.now()
        regUsuario = db.connection.cursor()
        regUsuario.execute("INSERT INTO usuario (nombre,  correo, clave,fechareg) VALUES (%s, %s, %s, %s)", (nombre,correo,claveCifrado,fechaReg))
        db.connection.commit()
        return render_template('home.html')
    else:
        return render_template('signup.html')


if __name__ == '__main__':
    mechmake.config.from_object(config['development'])
    mechmake.run(port=3300)