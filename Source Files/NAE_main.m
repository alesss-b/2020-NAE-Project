%% 2020 NAE Project - Securing Cyber Space
%   Alfredo Rogel       Alex Bradshaw
%   Johan Gonzalez      Fernando Aguado 
%   Chibuzor Prince     Zhenyu yu
%   Albert ky

%{ 
Problem Statement:
    Using a file containing information about data breaches, output 
various visual representations of data corresponding to user input.
Then, perform projection calculations to predict future breaches.
%}   

%{
'breach_info.csv' layout:
Column 1 - Abreveated States
Column 2 - Entity Type
Column 3 - Number of Individuals Affected
Column 4 - Date
Column 5 - Device/Location of Breach
%}

% Housekeeping:
clc
clear
close all

%% Load Data
% Set matrix variables:
breach_data = readtable('breach_info.csv', 'Headerlines', 1);

% Menu Prompts and Options:
%   main:
    mainPrompt = "What would you like to see?";
    mainChoices = ["Line Graph", "Pie Chart", "Map Graph", "Projections", "Exit"];

%% Main Loop
mainChoice = menu(mainPrompt, mainChoices);
while mainChoice ~= 5
    % Main Menu Loop
    switch mainChoice
        % These will go to functions, there will be no code here.
        case 1 
            % Go To Line Graph
            disp("Chosen Line Graph");
            Line_Graph(breach_data);
            
        case 2
            % Go To Pie Chart
            disp("Chosen Pie Chart");
            Pie_Chart();
            
        case 3
            % Go To Map Graph
            disp("Chosen Map Graph");
            Map_Graph();
            
        case 4
            % GO To Projections
            disp("Chosen Projections");
            Projection();
            
    end
mainChoice = menu(mainPrompt, mainChoices);
end
fprintf("Exiting Program...\n");
