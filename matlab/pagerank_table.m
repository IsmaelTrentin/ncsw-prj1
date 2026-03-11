function T = pagerank_table(x, U, n)
    [x_desc, idxs_desc] = sort(x, 'descend');
    
    top_ranks = x_desc(1:n);
    top_idxs = idxs_desc(1:n);
    top_urls = U(top_idxs);
    
    T = table(top_ranks, top_urls, 'VariableNames', {'Rank', 'URL'});
end