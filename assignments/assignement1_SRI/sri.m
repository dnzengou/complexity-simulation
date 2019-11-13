function [SRI,t] = sri(Npop,gamma,beta,zeta,delta,tmax,dt,plotOption)
%% CONTENT
% I have re-written the original function created by Philip Munz for his paper:
% Munz, P., Hudea, I., Imad, J., & Smith, R. J. (2009).
% 'When sris attack!: mathematical modelling of an outbreak of sri infection.
% Infectious Disease Modelling Research Progress, 4, 133-150.'
% I did not invent anything, just re-adjusted it to our topic.
% Credits go to the original authors.

%% GOAL
%  Solve the system of ODE's for the basic model (figure 1) with a abm
%  approach
%% INPUT
% Npop: scalar: initial population
% gamma : scalar: "sri infection" rate.
% beta: scalar:  transformation into a sri rate.
% zeta: scalar:  sri recovery rate.
% delta: scalar:  "natural population death" rate.
% tmax: scalar: max duration of the simulation
% dt: scalar: time step
% plot: boolean: write 1 to plot the results, otherwise, write 0
%% Output
% S: number of susceptibles ( non infected human population)
% R: number of recovered (remitted)
% I: number of SRIs
%%


N = round(1+tmax/dt);
% preallocation

% first row: suceptible population
% second row: death population
% third row: sri population

% Initialisation
SRI(:,1) = [Npop;0;0];
% ODE resolution
for ii=1:N-1
    r1 = -beta*SRI(1,ii)*SRI(3,ii); % birth rate = death rate
    r2 = delta*SRI(1,ii)+gamma*SRI(1,ii)*SRI(3,ii)-zeta.*SRI(2,ii);
    r3 = (beta-gamma)*SRI(1,ii)*SRI(3,ii)+zeta*SRI(2,ii);
    SRI(:,ii+1)=SRI(:,ii)+dt.*[r1;r2;r3];
    
    if or(SRI(3,ii)<0,SRI(3,ii)>Npop)
        t = 0:dt:(size(SRI,2)-1)*dt; % time
        fprintf('Everyone has been infected \n')
        return
    elseif or(SRI(2,ii)<0,SRI(2,ii)>Npop)
        t = 0:dt:(size(SRI,2)-1)*dt; % time
        %fprintf('Everybody is dead. \n')
        return
    end
end

t = 0:dt:(size(SRI,2)-1)*dt; % time

%% dataplot
if plotOption==1
    figure
    plot(t,SRI(1,:),t,SRI(2,:),t,SRI(3,:));
    ylim([0,1.1*Npop])
    legend('susceptibles','recovered','infected')
    ylabel('Number of agents')
    xlabel('Time Steps')
    
    annotation('textbox',[.9 .5 .1 .2],'String','gama = 0.01; beta = 5e-3; N=1000','EdgeColor','none')
end

end


