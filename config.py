from werkzeug.security import check_password_hash
from flask_login import UserMixin

class Config:
  SECRET_KEY =  '12345'
  DEBUG      = True

class DevelopmentConfig(Config):
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = 'mysql'
    MYSQL_DB = 'mechmake'

config = {
    'development' : DevelopmentConfig
  }

