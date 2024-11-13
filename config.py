from werkzeug.security import check_password_hash
from flask_login import UserMixin

class Config:
  SECRET_KEY =  '12345'
  DEBUG      = True

class DevelopmentConfig(Config):
    '''MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = 'mysql'
    MYSQL_DB = 'mechmake' '''

    #pythonannywere
class DevelopmentConfig(Config):
    MYSQL_HOST = 'ABroStar.mysql.pythonanywhere-services.com'
    MYSQL_USER = 'ABroStar'
    MYSQL_PASSWORD = 'Euri02513'
    MYSQL_DB = 'ABroStar$mechmake'

config = {
    'development' : DevelopmentConfig
  }

