function prueba
clc

db='ejemplo5.data';
XC=load(db);
p=length(XC(:,1));
n=length(XC(1,:))-1;
X(:,1:n)=XC(:,1:n)

dist = distancias(p,n,X,X)
d=zeros(p,p);

% for mu2=1:1:p,
%     for mu=1:1:p,
%         for j=1:1:n,
%             dx=power(abs(X(mu2,j)-X(mu,j)),2);
%             d(mu2,mu)=d(mu2,mu)+dx;
%         end
%     end
% end


d