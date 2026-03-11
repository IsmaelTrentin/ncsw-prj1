function [l, R] = degc(G, U, n)
    total_deg = sum(G, 1)' + sum(G, 2);
    
    [degs_desc, idxs_desc] = sort(total_deg, 'descend');
    
    top_idxs = idxs_desc(1:n);
    top_degs = degs_desc(1:n);
    top_urls = U(top_idxs);
    
    l = top_idxs;
    R = table(top_idxs, top_urls, top_degs, ...
        'VariableNames', {'Index', 'URL', 'Degree'});
end