% Parâmetros do motor DC
R = 0.179; % Resistência da armadura (ohms)
L = 4.55e-5; % Indutância da armadura (henrys)
kv = 83.545;
Ke = 1 / kv; % Constante de velocidade (V/(rad/s))
Kt = 0.012; % Constante de torque (Nm/A)
J = 35.1e-7; % Inércia do rotor (kg.m^2)
c = 0.000005496; % Coeficiente de fricção do rotor (N.m.s/rad)

% Definição do sistema em espaço de estados
A = [-R/L, -Ke/L; Kt/J, -c/J];
B = [1/L, 0; 0, -1/J];
C = [1, 0; 0, 1];
D = zeros(2, 2);
sys = ss(A, B, C, D);

% Simulação da resposta do sistema a uma entrada degrau
tempo = linspace(0, 20, 2001); % de 0 a 20 segundos com incremento de 0.01 segundos
entrada_tensao = zeros(1, length(tempo));
entrada_torque = zeros(1, length(tempo));
for i = 1:length(tempo)
    if tempo(i) >= 0
        entrada_tensao(i) = 10; % Entrada de 10V em t = 0
    end
    if tempo(i) >= 10
        entrada_torque(i) = 0.091; % Entrada de 0.091Nm em t = 10
    end
end
entradas = [entrada_tensao; entrada_torque]; % Duas entradas

[resposta, ~, estados] = lsim(sys, entradas, tempo);

% Plot da corrente e velocidade angular ao longo do tempo
figure;

subplot(2, 1, 1);
plot(tempo, estados(:, 1), 'b', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Corrente (A)');
title('Resposta da Corrente do Motor DC');
grid on;

subplot(2, 1, 2);
plot(tempo, estados(:, 2), 'r', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Velocidade Angular (rad/s)');
title('Resposta da Velocidade Angular do Motor DC');
grid on;


% Estimativa das eficiências elétrica e mecânica
% Eficiência elétrica: Potência de entrada / Potência elétrica consumida
PotenciaEntrada = entrada_tensao .* estados(:, 1)'; % Potência de entrada (V * I)
PotenciaEletrica = R * (estados(:, 1).^2)'; % Potência elétrica consumida (I^2 * R)
eficiencia_eletrica = PotenciaEntrada ./ (PotenciaEntrada + PotenciaEletrica);

% Eficiência mecânica: Potência mecânica de saída / Potência de entrada
PotenciaMecanica = estados(:, 2)' .* Kt .* estados(:, 1)'; % Potência mecânica (ω * T)
eficiencia_mecanica = PotenciaMecanica ./ PotenciaEntrada;

% Plot das eficiências ao longo do tempo
figure;
subplot(2, 1, 1);
plot(tempo, eficiencia_eletrica, 'g', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Eficiência Elétrica');
title('Eficiência Elétrica do Motor DC');
grid on;

subplot(2, 1, 2);
plot(tempo, eficiencia_mecanica, 'm', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Eficiência Mecânica');
title('Eficiência Mecânica do Motor DC');
grid on;
