function [x, t, i] = pagerank(U, G, p, alpha)
% PAGERANK  Google's PageRank
% pagerank(U,G,p) uses the URLs and adjacency matrix produced by SURFER,
% together with a damping factory p, (default is .85), to compute and plot
% a bar graph of page rank, and print the dominant URLs in page rank order.
% x = pagerank(U,G,p) returns the page ranks instead of printing.
% See also SURFER, SPY.

if nargin < 3, p = .85; end
if nargin < 4, alpha = .99; end

% Eliminate any self-referential links
%G = G - diag(diag(G));

% c = out-degree, r = in-degree
[~,n] = size(G);
c = sum(G,1);
r = sum(G,2);

% Scale column sums to be 1 (or 0 where there are no out links).
k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);

e = ones(n,1);
I = speye(n,n);

% ------------------------------- INVERSE ITER ----------------------------
% Solve (I - p*G*D)*x = e
disp('Using inverse iteration\n');
tic();
z = ((1-p)*(c~=0) + (c==0))/n;
A = p*G*D + e*z;
x = ones(n, 1)/n;

ray_q = (transpose(x)*A*x)/(transpose(x)*x);
ray_q_prev = 0

% accounting tollerance since RQ is an approx and speeds up the
% convergence quite a lot.
iter = 0;
while norm(ray_q - ray_q_prev, 1) > 0.0000000000001
    ray_q_prev = ray_q;
    x = (alpha*I - A)\x;
    x = abs(x)
    x = x/norm(x,1)
    ray_q = (transpose(x)*A*x)/(transpose(x)*x);
    iter = iter + 1;
end
t = toc();
i = iter;
disp('took iter: ');
iter
% -------------------------------------------------------------------------

% Normalize so that sum(x) == 1.
x = x/sum(x);

% Bar graph of page rank.
shg
bar(x)
title('Page Rank')

% Print URLs in page rank order.

if nargout < 1
   [~,q] = sort(-x);
   disp('     page-rank  in  out  url')
   k = 1;
   maxN = length(U);
   while  (k <= maxN) && (x(q(k)) >= .005)
       disp(k)
      j = q(k);
      temp1  = r(j);
      temp2  = c(j);
      disp(fprintf(' %3.0f %8.4f %4.0f %4.0f  %s', j,x(j),full(temp1),full(temp2),U{j}))
      k = k+1;
   end
end
