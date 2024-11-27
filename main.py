import subprocess
from time import sleep

def executar_robot(arquivo_robot):
    # Comando para executar o arquivo .robot
    comando = ['robot', arquivo_robot]
    
    # Execute o comando usando subprocess.run
    resultado = subprocess.run(comando, capture_output=True, text=True)

    # Verifica se a execução foi bem-sucedida
    if resultado.returncode == 0:
        print(f"Execução do arquivo {arquivo_robot} foi bem-sucedida.")
    else:
        print(f"Erro ao executar o arquivo {arquivo_robot}.")
        print("Saída de erro:", resultado.stderr)
        raise Exception(f"Falha na execução de {arquivo_robot}")

def main():
    # Lista dos arquivos .robot que você deseja executar
    arquivos_robot = ['inicializacao.robot', 'login.robot']
    
    for arquivo in arquivos_robot:
        try:
            executar_robot(arquivo)
            sleep(5)
        except Exception as e:
            print(e)
            break  # Interrompe a execução caso haja erro em qualquer arquivo

if __name__ == "__main__":
    main()
