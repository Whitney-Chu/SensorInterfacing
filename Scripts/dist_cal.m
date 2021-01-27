%Data import - Distances
d20 = uiimport('20 cm dist.txt');
d30 = uiimport('30 cm dist.txt');
d40 = uiimport('40 cm dist.txt');
d50 = uiimport('50 cm dist.txt');
d80 = uiimport('80 cm dist.txt');
d110 = uiimport('110 cm dist.txt');
d140 = uiimport('140 cm dist.txt');
d160 = uiimport('160 cm dist.txt');
d180 = uiimport('180 cm dist.txt');
d200 = uiimport('200 cm dist new.txt');
d230 = uiimport('230 cm dist.txt');
d260 = uiimport('260 cm dist.txt');
d290 = uiimport('290 cm dist.txt');
d293 = uiimport('293 cm dist.txt');
d300 = uiimport('300 cm dist new.txt');
d330 = uiimport('330 cm dist.txt');

%Mean and Standard Deviation
m_d20 = mean(d20.data); s_d20 = std(d20.data);
m_d40 = mean(d40.data); s_d40 = std(d40.data);
m_d50 = mean(d50.data); s_d50 = std(d50.data);
m_d80 = mean(d80.data); s_d80 = std(d80.data);
m_d110 = mean(d110.data); s_d110 = std(d110.data);
m_d140 = mean(d140.data); s_d140 = std(d140.data);
m_d160 = mean(d160.data); s_d160 = std(d160.data);
m_d180 = mean(d180.data); s_d180 = std(d180.data);
m_d200 = mean(d200.data); s_d200 = std(d200.data);
m_d230 = mean(d230.data); s_d230 = std(d230.data);
m_d260 = mean(d260.data); s_d260 = std(d260.data);
m_d290 = mean(d290.data); s_d290 = std(d290.data);
m_d300 = mean(d300.data); s_d300 = std(d300.data);
m_d330 = mean(d330.data); s_d330 = std(d330.data);

dist_m = [m_d20 m_d40 m_d50 m_d80 m_d110 m_d140 m_d160 m_d180 m_d200 m_d230 m_d260 m_d290 m_d300 m_d330];
dist_a = [20 40 50 80 110 140 160 180 200 230 260 290 300 330];
std_dev = [s_d20 s_d40 s_d50 s_d80 s_d110 s_d140 s_d160 s_d180 s_d200 s_d230 s_d260 s_d290 s_d300 s_d330];

%Linear Regression and Plotting
[r2, b0, b1, yhat, dists] = lin_reg(dist_a, dist_m);

plot(yhat, dists)
title('Calibration Curve for Ultrasonic Sensor', 'FontSize', 14)
xlabel('Actual Distance (cm)')
ylabel('Measured Distance (cm)')
grid
hold on
errorbar(dist_a, dist_m, std_dev, 'o')
r2

plot(samp2,d50.data)
title('Static Response at 50cm', 'FontSize', 14)
xlabel('Time (seconds)')
ylabel('Measured Distance (cm)')
grid

plot(samp2,d300.data)
title('Static Response at 300cm', 'FontSize', 14)
xlabel('Time (seconds)')
ylabel('Measured Distance (cm)')
grid
