clear;
close all
clc

d = csvread("ntc.csv");

t = d(:,1);
ADC = [];
for i = 1:156 
    ADC(i) = ((d(i,2))/(d(i,2)+10)).*1024;
end


plot(ADC, t)
p = polyfit(ADC, t, 10);
ADC2 = 0:1023;
t2 = round(polyval(p, ADC2), 1);

plot(ADC, t, "o")
hold on
plot(ADC2, t2, 'r');

dlmwrite('data.dlm', t2*10, ',');