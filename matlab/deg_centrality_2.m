[top5_idxs, ~] = deg_centrality(G,U);

G_new = G;
G_new(top5_idxs, :) = 0;
G_new(:, top5_idxs) = 0;

save('WIKI450_ISO.mat', 'G_new');

figure;
subplot(1, 2, 1);
spy(G);
title('WIKI450');

subplot(1, 2, 2);
spy(G_new);
title('WIKI450 ISO');