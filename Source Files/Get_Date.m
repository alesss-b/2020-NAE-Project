function [date] = Get_Date(breach_data, row, type)
% Get_Date takes the data set, the row in which the date can be found, as 
% well as the desired output type (day, month, year, full)
    if (row > height(breach_data))
        error("Row argument can not exceed vertical length of breach_data table.");
    else
        type = lower(type);
        
        date = char(breach_data{row, 4}); % fourth column will always contain the dates
        switch (type)
            case "day"
                % Return day
                date = date(4:5);
                date = str2double(date);
                
            case "month"
                % Return month
                date = date(1:2);
                date = str2double(date);
                
            case "year"
                % Return year
                date = ['20', date(9:10)];
                date = str2double(date);
                
            case "full"
                % Return full date
                date = datetime(Get_Date(breach_data, row, "year"), Get_Date(breach_data, row, "month"), Get_Date(breach_data, row, "day"));
            otherwise
                % Return error
                error("Invalid argument for type.");
        end
        return;
    end
end

