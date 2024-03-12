% Strategic interaction (Figure2,Figure3 code)

clear all,clc,close all

% Read data
A=csvread('strategic interaction.csv',1,0);
W=csvread('W3.csv');
% Row-normalize W
W=normw(W);
% Model parameters and y and x variables
N=284;
T=20;
nobs=N*T;
y=A(:,3); % column number in the data matrix that corresponds to the dependent variable
dum=A(:,12); % 17=pilot, 18=rank, 19=turnover,20=carbon-peaking pressure,21=d1,22=d2
xh=A(:,[4,5,6,7,8,9,10,11,12,13,14,15,16]);% column numbers in the data matrix that correspond to the independent variables, no constant because it will be eliminated
% Create wx variables
for t=1:T
    t1=1+(t-1)*N;t2=t*N;
    wx(t1:t2,:)= W*xh(t1:t2,:);
end
x=[dum xh wx];
info.model=3; % Fixed effects
results = sarregime_panel(y,x,dum,W,T,info);
vnames=strvcat('y','dum','x1','x2','x3','x4','x5','x6','x7','x8','x9','x10','x11','x12','x13','x14','x15','x16','W*x1','W*x2','W*x3','W*x4','W*x5','W*x6','W*x7','W*x8','W*x9','W*x10','W*x11','W*x12','W*x13','W*x14','W*x15','W*x16');
prt_spreg(results,vnames,1);
