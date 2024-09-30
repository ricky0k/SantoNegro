from flask import Flask, render_template, url_for, request, redirect
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash
import datetime
from flask_login import LoginManager, login_user, logout_user
from config import config
from models.ModelUser import ModelUser
from models.entities.User import User

mechmake = Flask(__name__)
db = MySQL(mechmake)
adminSession = LoginManager(mechmake)

@adminSession.user_loader
def addUser(id):
    return ModelUser.get_by_id(db, id)

@mechmake.route('/')
def home():
    return render_template('home.html')

@mechmake.route('/admin')
def admin():
    return render_template('admin.html')

@mechmake.route('/user')
def user():
    return render_template('user.html')

@mechmake.route('/signin', methods=['POST', 'GET'])
def signin():
    if request.method == 'POST':  # Corregido request.method
        usuario = User(0, None, request.form['correo'], request.form['clave'], None, None)
        usuarioAutenticado = ModelUser.signin(db, usuario)
        if usuarioAutenticado is not None:
            if usuarioAutenticado.clave:  # Aquí debería haber una validación adecuada de la clave
                login_user(usuarioAutenticado)  # Indentación corregida
                if usuarioAutenticado.perfil == 'A':
                    return render_template('admin.html')
                else:
                    return render_template('user.html')
            else:
                return 'Contraseña incorrecta'
        else:
            return 'Usuario inexistente'
    else:
        return render_template('signin.html')

@mechmake.route('/signup', methods=['POST', 'GET'])
def signup():
    if request.method == 'POST':
        nombre = request.form['nombre']
        correo = request.form['correo']
        clave = request.form['clave']
        claveCifrado = generate_password_hash(clave)
        fechaReg = datetime.datetime.now()
        regUsuario = db.connection.cursor()
        regUsuario.execute("INSERT INTO usuario (nombre, correo, clave, fechareg) VALUES (%s, %s, %s, %s)", (nombre, correo, claveCifrado, fechaReg))
        db.connection.commit()
        return render_template('home.html')
    else:
        return render_template('signup.html')
    
@mechmake.route('/sigout',methods=['get','post'])
def sigout():
    logout_user()
    return redirect(url_for('home'))

if __name__ == '__main__':
    mechmake.config.from_object(config['development'])
    mechmake.run(port=3300)
