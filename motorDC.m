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
t = 0:0.01:20;
u1 = 10 * (t >= 0); % Entrada de 10V em t = 0
u2 = 0.091 * (t >= 10); % Entrada de 0.091Nm em t = 10
u = [u1; u2]; % Duas entradas

[y, ~, x] = lsim(sys, u, t);

% Plot da corrente e velocidade angular ao longo do tempo
figure;

subplot(2, 1, 1);
plot(t, x(:, 1), 'b', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Corrente (A)');
title('Resposta da Corrente do Motor DC');
grid on;

subplot(2, 1, 2);
plot(t, x(:, 2), 'r', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Velocidade Angular (rad/s)');
title('Resposta da Velocidade Angular do Motor DC');
grid on;