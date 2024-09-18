from werkzeug.security import  check_password_hash
from flask_login import UserMixin

class User(UserMixin):
  def __init__(self,id, nombre, correo, clave, fechareg) -> None:
    self.id       = id
    self.nombre   = nombre
    self.correo   = correo
    self.clave    = clave
    self.fechareg = fechareg
    self.pefil    = perfil

  @classmethod
  def ValidClave(self,claveCifrada,clave):
    return check_password_hash(claveCifrada,clave)