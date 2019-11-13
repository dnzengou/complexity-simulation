%Alex Dytso
%Date: May 21 2012
%Discription: In this code we compare two random walks with two differenct
%probability distribuitions.
%First Walk is performed according to Normal Distribution with varience 1
%Secodn Walk is performed with Uniform distribution with varience 1
% Distributions are taken to have the same varience for the comparison
% reasons 

clc, clear all, clf

t=10; % number of random walks

Point1=[0,0];% original location of the point
%Point2=[0,0];% original location of the point

%subplot(1,2,1)
plot(Point1(1),Point1(2),'o');
%plot(Point1(1),'o');
title('Random walk by one agent')
axis([-100 100 -100 100])% fixing size of the window by setting the axes limits
axis square;   % set the aspect ratio of the axes to 1
hold on 


n=1;%index. Count walks.

while n<t
    
    V11=randn*(-1)^floor(2*randn);% random jump in X with normal dist
    V21=randn*(-1)^floor(2*randn);% random jump in Y with normal dist
     
    subplot(1,2,1) 
    Point1(1)=Point1(1)+V11;% new cooridnates for Norm dist
    Point1(2)=Point1(2)+V21;
    
    %subplot(1,2,1)
    plot(Point1(1),Point1(2),'b.'); % drawing new coordinate
    legend('agents')
    ylabel('y')
    xlabel('x')
    hold on
    drawnow % graphic function
    
    pause(.2) % pause to make animation slower 
    
    
    n=n+1; %increament number of walks
end