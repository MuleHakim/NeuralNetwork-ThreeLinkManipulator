function x = neural_network(q2t,q3t,q4t)
%% Initialisation of Variables
%input a set of angles for q2,q3,q4 as q2=[5 2 1 3]'*pi/180 for example

net=zeros(3,3);%neural network
dl=zeros(3,3);%backprop to store delta

%%initialise weights (which were first randomised)
w_1=[0.6948    0.3171    0.9502    0.0344    0.4387    0.3816    0.7655    0.7952    0.1869]';
w_2=[0.4898    0.4456    0.6463    0.7094    0.7547    0.2760    0.6797    0.6551    0.1626]';    
w=[w_1 w_2];

b1=1;%bias for hidden
b2=1;%bias for output
p=0.1;%learning rate

%get set of input from cubic trajectory for q2,q3,q4 
%with angles used in FK

q2u=[];
q3u=[];
q4u=[];

for n=1:size(q2t,1)-1
    q2s=returnPVA(q2t(n,1),q2t(n+1,1),3);
    q2u=vertcat(q2u,q2s(:,1));
    
    q3s=returnPVA(q3t(n,1),q3t(n+1,1),3);
    q3u=vertcat(q3u,q3s(:,1));
    
    q4s=returnPVA(q4t(n,1),q4t(n+1,1),3);
    q4u=vertcat(q4u,q4s(:,1));
end

q=[q2u q3u q4u];%expected output