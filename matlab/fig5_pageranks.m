clear
clear all

n = 6;
U = {
'https://www.alpha.com'
'https://www.beta.com'
'https://www.gamma.com'
'https://www.delta.com'
'https://www.rho.com'
'https://www.sigma.com'
};
j = [1 1 2 2 3 4 5 6];
i = [2 3 4 3 4 1 6 5];
G = sparse(i, j, 1, n, n);

c = full(sum(G));
k = find(c~=0);
D = sparse(k, k, 1./c(k), n, n);
e = ones(n, 1);
I = speye(n, n);

p = 0.85;
x = (I - p*G*D)\e;
x = x/norm(x,1)