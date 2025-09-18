% Generalized power iteration method (GPI) for solving 
% max_{Q'Q=I} Tr(Q'AQ+Q'BQC+Q'D)
function[Q,obj]=new_GPI(Q,X,A,B,C,D)



[m,~]=size(X);
[C_m,~]=size(C);

%Q    = orth(rand(m,m)); % orth initialize  matrix Q
%Q    = Q(:,1:C_m);

A=max(A,A');
B=max(B,B');
C=max(C,C');



alpha=abs(eigs(A,1));

beta=abs(eigs(B,1));

        
err=1;t=1;

A_til=alpha.*eye(m)+A;
B_til=beta.*eye(m)+B;
while err>1e-3
    M=2*A_til*Q+2*B_til*Q*C+D;
    [U,~,V]=svd(M,'econ');
    Q=U*V';
    obj(t)=trace(Q'*A*Q+Q'*B_til*Q*C+Q'*D);
    if t>=2
        err=abs(obj(t-1)-obj(t))/abs(obj(t-1));
    end
        t=t+1;
    if  t>300
        break;
    end
end
plot(obj);
grid on;
ylabel('Objectve value');
xlabel('Iteration');
xlim([1,t-1]);
title('PCA+LDA method');
    
    
    