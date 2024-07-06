# Motor de Corrente Contínua (DC) - Modelo e Simulação :woman_technologist:	
![Badge Conclusão](http://img.shields.io/static/v1?label=STATUS&message=CONCLUÍDO&color=GREEN&style=for-the-badge) :shipit:


## Introdução
Este repositório contém o estudo e a modelagem de um motor DC ECX 32 Flat UAV[^1]. O objetivo é entender o comportamento dinâmico do motor e simular sua resposta a diferentes entradas.

### Parâmetros do Motor
Antes de prosseguir, definimos os seguintes parâmetros do motor em unidades do Sistema Internacional (SI):

| Descrição | Valor em SI |
| --- | --- |
| Resistência da armadura |  $Nm/A$ |
| Constante de velocidade |  |
| Constante de torque |  |
| Inércia do rotor | |
| Coeficiente de fricção do rotor | |
| Indutância da armadura | |
Resistência da armadura ®: 0.179 ohms

Indutância da armadura (L): 4.55e-5 henrys

Constante de velocidade (Ke): Calculada como o inverso da constante de velocidade angular (kv)

Constante de torque (Kt): 0.012 Nm/A

Inércia do rotor (J): 35.1e-7 kg.m^2

Coeficiente de fricção do rotor ©: 0.000005496 N.m.s/rad

## Representação em Espaço de Estados
O sistema é representado pelas equações em espaço de estados:
x˙y​=Ax+Bu=Cx+Du​
Onde:

(x) é o vetor de estados (corrente e velocidade angular).
(u) é o vetor de entradas (tensão aplicada à armadura e torque externo).
(y) é o vetor de saídas (corrente e velocidade angular).

##Simulação da Resposta
Realizamos a simulação da resposta do sistema a duas entradas degrau:

Uma entrada de 10V em (t = 0).
Uma entrada de 0.091Nm em (t = 10).

Os resultados são plotados nos gráficos abaixo:
!Resposta da Corrente do Motor DC
Figura 1: Resposta da Corrente do Motor DC
!Resposta da Velocidade Angular do Motor DC
Figura 2: Resposta da Velocidade Angular do Motor DC











### Montagem do Circuito
![IMG_20230616_140339](https://github.com/melmorais/aerotech/assets/136825758/3c2c5c74-d1cf-44d5-b051-2a6ee7659c0e)

## Desenvolvimento e Contribuição

Este projeto foi elaborado e construído no Laboratório Aerotech situado no Departamento de Engenharia Aeronáutica da Universidade de São Paulo (campus São Carlos).

* **Lara Melanie Bastos de Morais** - [![Gmail Badge](https://img.shields.io/badge/-laramorais@usp.br-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:laramorais@usp.br)](mailto:laramorais@usp.br)
* **Carlos Persiani** - [![Gmail Badge](https://img.shields.io/badge/-carlospersiani@usp.br-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:carlospersiani@usp.br)]



[^1]: [Documentação](https://www.maxongroup.net.au/medias/sys_master/root/8930376351774/210827-Brosch-UAV-2021-UG-PRINT.pdf)
