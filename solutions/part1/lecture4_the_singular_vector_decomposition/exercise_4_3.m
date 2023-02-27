clc; clear;

A = [1 2; 0 2];

[U,S,V] = svd(A);

[m, n] = size(A); % U:m*m, V:n*n

ss = diag(S);

v_end_points_xsub = V(1, :);
v_end_points_ysub = V(2, :);

u_end_points_xsub = U(1, :);
u_end_points_ysub = U(2, :);

% Plot a circle with radius = 1
ths = linspace(0, 2*pi, 100);
x = cos(ths);
y = sin(ths);
plot(x, y);
axis equal;
hold on;

% Plot the ellipse transformed by A
xy = [x;y];
transformed_xy = A*xy;
transformed_x = transformed_xy(1,:);
transformed_y = transformed_xy(2,:);
plot(transformed_x, transformed_y);
hold on;



% Plot the right singular vector v1, v2
quiver(0,0,v_end_points_xsub(1),v_end_points_ysub(1), "AutoScale","off");
hold on;
quiver(0,0,v_end_points_xsub(2),v_end_points_ysub(2), "AutoScale","off");

% Plot the left singular vector u1,u2 scaled by the singular vales
quiver(0,0,ss(1)*u_end_points_xsub(1),ss(1)*u_end_points_ysub(1), "AutoScale","off");
hold on;
quiver(0,0,ss(2)*u_end_points_xsub(2),ss(2)*u_end_points_ysub(2), "AutoScale","off");

