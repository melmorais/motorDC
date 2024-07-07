# Motor de Corrente Contínua (DC) - Modelo e Simulação 
![Badge Conclusão](http://img.shields.io/static/v1?label=STATUS&message=CONCLUÍDO&color=GREEN&style=for-the-badge) 


# Introdução

Este projeto consiste na modelagem e simulação de um motor de corrente contínua (DC) utilizando representação em espaço de estados. O objetivo é analisar a resposta do sistema a entradas degrau de tensão e torque aplicadas em tempos específicos.

## Problema Proposto

O objetivo deste trabalho é estudar e modelar o comportamento de um motor de corrente contínua (DC) em um sistema de controle. Inicialmente, os parâmetros do motor foram definidos em unidades do Sistema Internacional (SI). Em seguida, o sistema foi representado em espaço de estados, considerando as equações que descrevem o comportamento dinâmico do motor. As matrizes de estado, entrada, saída e transmissão direta foram determinadas para o sistema. Posteriormente, foi realizada a simulação da resposta do sistema a duas entradas degrau: uma entrada de 10V em \( t=0s \) e uma entrada de 0.091Nm em \( t=10s \). A resposta do sistema, representada pela corrente e velocidade angular ao longo do tempo, foi analisada e plotada em gráficos.

## Equações do Motor DC

As equações diferenciais que descrevem o comportamento de um motor DC são dadas por:

1. **Equação da Tensão da Armadura:**
   $$V(t) = L\frac{di(t)}{dt} + Ri(t) + K_e \omega(t)$$ 
   onde:
   -  $V(t)$ é a tensão da armadura
   -  $L$ é a indutância da armadura
   -  $R$ é a resistência da armadura
   -  $i(t)$ é a corrente da armadura
   -  $K_e$ é a constante de velocidade
   -  $\omega(t)$ é a velocidade angular do motor

2. **Equação da Dinâmica Rotacional:**
   $$J \frac{d\omega(t)}{dt} + b \omega(t) = K_t i(t) - T_L$$
   onde:
   - $J$ é a inércia do rotor
   - $b$ é o coeficiente de fricção viscosa
   - $K_t$  é a constante de torque
   - $T_L$  é o torque de carga

## Representação em Espaço de Estados

A representação em espaço de estados é utilizada para descrever sistemas dinâmicos na forma de equações de estado. As equações do motor DC podem ser reescritas na forma de espaço de estados:

$$
\begin{aligned}
\dot{x} &= Ax + Bu \\
y &= Cx + Du
\end{aligned}
$$

Onde:

$$
A = \begin{bmatrix}
-\frac{R}{L} & -\frac{Ke}{L} \\
\frac{Kt}{J} & -\frac{c}{J}
\end{bmatrix}, \quad
B = \begin{bmatrix}
\frac{1}{L} & 0 \\
0 & -\frac{1}{J}
\end{bmatrix}, \quad
C = \begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix}, \quad
D = \begin{bmatrix}
0 \\
0
\end{bmatrix}
$$


## Descrição do Código

O código MATLAB fornecido realiza a modelagem e simulação do motor DC. Ele está dividido nas seguintes partes:

1. **Definição dos Parâmetros do Motor DC:** Nesta seção, são definidos os valores dos parâmetros do motor em SI:
   

| Descrição | Valor em SI |
| --- | --- |
| Resistência $(R)$ |  $0,179$ $\Omega$   |
| Indutância $(L)$ | $4,55. 10^{-5}H$  |
| Constante de velocidade $(k_v)$|  $83,545$ $(rad/s)/V$|
| Constante de velocidade $(k_e)$| $0,01197$ $V/(rad/s)$ |
| Constante de torque $(k_t)$| $0,012$ $Nm/A$ |
| Inércia do rotor | $35,1. 10^{-7} kgm^2$|
| Coeficiente de fricção do rotor | $5,496.10^{6}  Nms/rad$|


2. **Construção do Sistema em Espaço de Estados:** As matrizes \( A \), \( B \), \( C \) e \( D \) são definidas com base nos parâmetros do motor.
3. **Simulação da Resposta do Sistema:** A resposta do sistema é simulada utilizando a função `lsim` do MATLAB, que resolve as equações diferenciais do sistema para as entradas definidas.
4. **Plotagem dos Resultados:** Os gráficos da corrente e da velocidade angular ao longo do tempo são gerados e exibidos.




### Montagem do Circuito
![IMG_20230616_140339](https://github.com/melmorais/aerotech/assets/136825758/3c2c5c74-d1cf-44d5-b051-2a6ee7659c0e)

## Desenvolvimento e Contribuição :shipit:	

Este projeto foi elaborado para a disciplina "Sistemas de Controle de Aeronaves I" do Departamento de Engenharia Aeronáutica da Universidade de São Paulo (campus São Carlos), sob coordenação do Prof. Dr. Glauco Augusto de Paula Caurin.

* **Lara Melanie Bastos de Morais** - [![Gmail Badge](https://img.shields.io/badge/-laramorais@usp.br-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:laramorais@usp.br)](mailto:laramorais@usp.br)
* **Andreia Miho Suzumura** - [![Gmail Badge](https://img.shields.io/badge/-miho.suzumura@usp.br-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:miho.suzumura@usp.br )](mailto:miho.suzumura@usp.br )
* **Lívia Silva Ramos** - [![Gmail Badge](https://img.shields.io/badge/-livias.ramos@usp.br-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:livias.ramos@usp.br )](mailto:livias.ramos@usp.br )
* **Pedro Roberto Vianna Bernardi** - [![Gmail Badge](https://img.shields.io/badge/-pedro.bernardi@usp.br-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:pedro.bernardi@usp.br )](mailto:pedro.bernardi@usp.br )
* **Lucas Tsubakiyama Sasaki** - [![Gmail Badge](https://img.shields.io/badge/-lucas.sasaki@usp.br-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:lucas.sasaki@usp.br)](mailto:lucas.sasaki@usp.br)





[^1]: [Documentação](https://www.maxongroup.net.au/medias/sys_master/root/8930376351774/210827-Brosch-UAV-2021-UG-PRINT.pdf)
