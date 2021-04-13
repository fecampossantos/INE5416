from abc import ABC, abstractmethod


class Produto(ABC):
    def __init__(self, codigo, valor):
        self.codigo: int = codigo
        self.valor: float = valor
    
    @abstractmethod
    def definir(self):
        print('Eu sou um produto!')

class Pilha:

    def __init__(self, tipoPilha, quantidadePilha):
        self.tipoPilha: str = tipoPilha
        self.quantidadePilha: int = quantidadePilha
        
class Periferico(Produto):

    _n_perifericos: int = 0

    @staticmethod
    def get_total_perifericos():
        return Periferico._n_perifericos

    def __init__(self, tipo, codigo, valor, pilha):
        super().__init__(codigo, valor)
        self.tipo: str = tipo
        self.pilha: Pilha = pilha
        Periferico._n_perifericos += 1
    
    def definir(self):
        print('Eu sou um periferico!')
    


class Computador(Produto):

    _n_computadores: int = 0

    @staticmethod
    def get_total_computadores():
        return Computador._n_computadores

    def __init__(self, modelo, codigo, valor):
        super().__init__(codigo, valor)
        self.modelo: str = modelo
        self.ligado: bool = False
        Computador._n_computadores += 1

    def definir(self):
        print('Eu sou um computador!')

    def ligar(self):
        if(self.ligado):
            print('O computador ja está ligado!')
        else:
            self.ligado = True

    def desligar(self):
        if(not self.ligado):
            print('O computador ja está desligado!')
        else:
            self.ligado = False


##  aqui embaixo colocar as chamadas que você quiser, como criação
#   de objetos, chamadas de método e etc.
##