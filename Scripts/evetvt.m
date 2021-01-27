%Temperature
%Data Import
cold_cup = importdata('PUTTY_CCUP.txt'); cold_cup = cold_cup.data;
hot_cup = importdata('PUTTY_HCUP.txt'); hot_cup = hot_cup.data;
high_cup = importdata('PUTTY_HIGH.txt'); high_cup = high_cup.data;
low_cup = importdata('PUTTY_LOW.txt'); low_cup = low_cup.data;
reg_cup = importdata('PUTTY_RCUP.txt'); reg_cup = reg_cup.data;
reg_room = importdata('PUTTY_DESK.txt'); reg_room = reg_room.data;

%Mean and Standard Deviation
temps_m = [mean(cold_cup(:,3)) mean(hot_cup(:,3)) mean(reg_cup(:,3)) mean(reg_room(:,3))];
temps_a = [15.0 49.5 23.5 22.8];
std_t = [std(cold_cup(:,3)) std(hot_cup(:,3)) std(reg_cup(:,3)) std(reg_room(:,3))];

%Linear Regression and Plotting for Temperature
[r2, b0, b1, yhat, temps] = lin_reg(temps_a, temps_m);

plot(yhat, temps)
title('Calibration Curve for BME:280 Temperature', 'FontSize', 14)
xlabel('Actual Temperature (°C)')
ylabel('Measured Temperature (°C)')
grid
hold on
errorbar(temps_a, temps_m, std_t, 'o')
r2

%Elavation
%Data Import
floor = importdata('floor_t1.log'); floor = floor.data;
desk = importdata('desk_t1.txt'); desk = desk.data;
sky = importdata('sky_t1.txt'); sky = sky.data;

%Mean and Standard Deviation
ela_m = [mean(floor(:,6)) mean(desk(:,6)) mean(sky(:,6))];
ela_a = [345 345.8 347.1];
std_e = [std(floor(:,6)) std(desk(:,6)) std(sky(:,6))];

%Linear Regression
[r2_e, b0_e, b1_e, yhat_e, elas] = lin_reg(ela_a, ela_m);

plot(elas, yhat_e)
title('Calibration Curve for BME280 Elavation', 'FontSize', 14)
xlabel('Actual Elavation (m)')
ylabel('Measured Elavation (m)')
grid
hold on
errorbar(ela_a, ela_m, std_e, 'o')
r2_e