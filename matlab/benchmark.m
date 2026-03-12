function [avg_t, avg_i] = benchmark(R)
    sum_t = 0;
    sum_i = 0;
    n = 5;
    for j = 1:n
        [~, t, i] = pagerank2(R, R);
        sum_t = sum_t + t;
        sum_i = sum_i + i;
    end
    avg_t = sum_t / n;
    avg_i = sum_i / n;
end