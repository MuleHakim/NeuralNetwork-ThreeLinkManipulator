% Define link lengths and offsets
l1 = 1;
l2 = 1;
l3 = 1;
o1 = 0;
o2 = 0;
o3 = 0;

% Define link twists
t1 = 0;
t2 = pi/2;
t3 = 0;

% Define joint angles
q1 = pi/3;
q2 = pi/4;
q3 = pi/6;

% Define DH parameters
a = [0, l1, l2, l3];
d = [o1, o2, o3, 0];
alpha = [t1, t2, t3];

% Create transformation matrices for each link
T1 = DH(q1, d(1), a(1), alpha(1));
T2 = DH(q2, d(2), a(2), alpha(2));
T3 = DH(q3, d(3), a(3), alpha(3));

% Calculate forward kinematics
T = T1*T2*T3;

% Visualize the manipulator in 3D
x = [0, T1(1, 4), T(1, 4)];
y = [0, T1(2, 4), T(2, 4)];
z = [0, T1(3, 4), T(3, 4)];
plot3(x, y, z, '-o')
xlabel('X')
ylabel('Y')
zlabel('Z')

% DH function
function T = DH(q, d, a, alpha)
    T = [cos(q) -sin(q)*cos(alpha) sin(q)*sin(alpha) a*cos(q);         sin(q) cos(q)*cos(alpha) -cos(q)*sin(alpha) a*sin(q);         0 sin(alpha) cos(alpha) d;         0 0 0 1];
end