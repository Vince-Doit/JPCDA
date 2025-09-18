function [Q,W,obj,obj2,F_value,Trace_value,Lambda_value]=pcalinear(X,Y,w1,gamma)
% X is  a (d x n)  data matrix. 
% Y is  a (n x c)  label matrix. 
% W is  a (w1 x c) a projection matrix .
% w1 is the row number of matrix W, and  the column number of matrix Q.     w1 << d
% Q is the projetion matrix of PCA, and we Initialize Q with PCA. Q \in ^R {d x w1}
% b is the bias of linear regression.
% NITER is the number of iteration.
% Obj is the value of objective function in each iteration.



[nFea,nSmp] = size(X);% nFea is the number of feature, nSample is the number of instance.
c           = size(Y,2); % c  is the number of labels.

St          = X*X';  % convariance matrix of instance.

Q           = orth(rand(nFea,nFea)); % orth initialize  matrix Q
Q           = Q(:,1:w1);

I           = ones(nSmp,1);
H           = eye(nSmp)-I*I'/nSmp;

Iw          = eye(w1);

err=1;t=1;

while 1
        W   = pinv(Q'*X*H'*H*X'*Q+gamma*Iw)*Q'*X*H'*H*Y; 
       temp = H*(X'*Q*W-Y);
     lambda = trace(Q'*St*Q)/(2*(norm(temp,'fro')^2+gamma*norm(W,'fro')^2));
     Lambda_value(t)=lambda;
       
       
       F_value(t)=norm(temp,'fro')^2;

     Trace_value(t)=trace(Q'*St*Q);
     
      value =trace(Q'*St*Q)^2/(norm(temp,'fro')^2+gamma*norm(W,'fro')^2);
    obj2(t) = value;

        A   = St;
        B   = -X*H'*H*X';  
        C   = lambda*W*W';
        D   = 2*lambda*X*H'*H*Y*W';
  [Q,obj]   = new_GPI(Q,X,A,B,C,D); 
    if t>=2
        err=abs(obj2(t-1)-obj2(t))/abs(obj2(t-1));
    end
        t=t+1;
    if  t>500
        break;
    end
       
end

clear A B C D temp err  lambda St;

























