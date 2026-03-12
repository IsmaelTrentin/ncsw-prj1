function benchmark_charts(B, I)
    % 1. Setup Data
    sizes = [250, 500, 750, 1000, 1250, 1500];
    algoNames = {'Backslash Division', 'Power Method', 'Inverse Iteration'};
    B = B * 1000;
    
    %% --- FIGURE 1: Runtimes (Linear and Semilog) ---
    figure('Name', 'Algorithm Runtimes', 'Color', 'w');
    
    % Linear Scale (Standard)
    subplot(2, 1, 1);
    hold on;
    plot(sizes, B(1,:), '-o', 'LineWidth', 2, 'DisplayName', algoNames{1});
    plot(sizes, B(2,:), '-s', 'LineWidth', 2, 'DisplayName', algoNames{2});
    plot(sizes, B(3,:), '-^', 'LineWidth', 2, 'DisplayName', algoNames{3});
    grid on; hold off;
    title('Benchmark Times: Standard Scale');
    ylabel('Time (millis)');
    legend('Location', 'northwest');
    
    % Semilog Scale
    subplot(2, 1, 2);
    semilogy(sizes, B(1,:), '-o', 'LineWidth', 2, 'DisplayName', algoNames{1}); hold on;
    semilogy(sizes, B(2,:), '-s', 'LineWidth', 2, 'DisplayName', algoNames{2});
    semilogy(sizes, B(3,:), '-^', 'LineWidth', 2, 'DisplayName', algoNames{3});
    grid on; hold off;
    title('Benchmark Times: Logarithmic Scale (Y)');
    xlabel('Matrix Size (n)');
    ylabel('Time (millis)');
    legend('Location', 'northwest');
    
    %% --- FIGURE 2: Iterations (Linear and Semilog) ---
    figure('Name', 'Algorithm Iterations', 'Color', 'w');
    
    % Linear Scale (Standard)
    subplot(2, 1, 1);
    hold on;
    % Backslash is skipped because it contains NaNs
    plot(sizes, I(2,:), '-s', 'LineWidth', 2, 'DisplayName', algoNames{2});
    plot(sizes, I(3,:), '-^', 'LineWidth', 2, 'DisplayName', algoNames{3});
    grid on; hold off;
    title('Average Iterations: Standard Scale');
    ylabel('Number of Iterations');
    legend('Location', 'best');
    
    % Semilog Scale
    subplot(2, 1, 2);
    semilogy(sizes, I(2,:), '-s', 'LineWidth', 2, 'DisplayName', algoNames{2}); hold on;
    semilogy(sizes, I(3,:), '-^', 'LineWidth', 2, 'DisplayName', algoNames{3});
    grid on; hold off;
    title('Average Iterations: Logarithmic Scale (Y)');
    xlabel('Matrix Size (n)');
    ylabel('Number of Iterations');
    legend('Location', 'best');
end