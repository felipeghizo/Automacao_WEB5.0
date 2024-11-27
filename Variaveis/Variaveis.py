from random import randint
possiveis_usuarios_errados = [
    'asKLJNFA', 'çslakd', 'gsdjkfgçlskd', 'sdkfjçl23', 'çasdof02',
    'jK8sdJFD', 'rtyuGds', 'FGdskl12', 'qweRTY123', 'asdfGHJK',
    'ZXCVBNM4', 'lkjhgfd', '1qaz2wsx', 'QWERTYui', 'poiuytRE',
    'mnbVCXZ', 'QazWSX12', 'hjklASDF', 'zxcvbnm123', 'aBcDeFgH',
    'qwerty1234', 'abcd1234', 'ASDFGHJKL', 'zxcvbnm456', '12345678',
    'password1', 'testuser', 'username12', '1234abcd', 'qwertyuiop',
    'letmein123', 'admin123', 'user12345', 'iloveyou', 'abc123456',
    'welcome1', 'userqwerty', 'mynameis', 'guest123', 'simplepass'
]

# Randomiza o usuário para que a conta não seja bloqueada.
USUARIO_ERRADO = possiveis_usuarios_errados[randint(0, len(possiveis_usuarios_errados) - 1)]
USUARIO_CORRETO = 'admin'
SENHA_CORRETA = 'admin123'
CAMERA = 'http://10.100.67.50/#/'