function [] = Line_Graph(breach_data)
    % Depending on User Input for starting and ending date/ period of time,
    % create a line graph.

    % Menu Prompts and Options:
    menuPromptYear1 = "Please select the starting year.";
    menuPromptYear2 = "Please select the ending year.";
    menuOptionsYear = [Get_Date(breach_data, 1, "year")];

    for i = 1:height(breach_data)
        year = Get_Date(breach_data, i, "year"); % Get list of years excluding repeats
        if (year ~= menuOptionsYear(end))
            menuOptionsYear = [menuOptionsYear, year];
        end
    end

    % Menu
    startingYear = menu(menuPromptYear1, num2cell(menuOptionsYear(1:end-1)));
    endingYear = startingYear + menu(menuPromptYear2, num2cell(menuOptionsYear(startingYear+1:end)));

    %Calculations for Plotting
    dates = menuOptionsYear(startingYear:endingYear);  
    attacks = zeros(1, length(dates));
    for i = 1:length(dates)
        year = dates(i);
        for j = 1:height(breach_data)
            if (Get_Date(breach_data, j, "year") == year)
                attacks(i) = attacks(i) + 1;
            end
        end
        % Make attacks a vector that corresponds to the number of attacks
        % each year from startingYear to endingYear
    end
    t = sprintf("Number of Breaches from %i to %i", menuOptionsYear(startingYear), menuOptionsYear(endingYear));
    % Plot
    plot(dates, attacks);
    title(t)

end

