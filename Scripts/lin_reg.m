function [r2, b0, b1, yhat, voltage] = lin_reg(voltage, temps)

% linear regression for calibration curve
sumx=0;
sumy=0;
yhat=0;
sumxy=0;
sumx2=0;
[holder,howbig]=size(voltage);

for i=1:howbig
	x(i)=voltage(i);
	y(i)=temps(i);
	sumx=sumx+x(i);
	sumy=sumy+y(i);
	sumxy=sumxy+(x(i)*y(i));
	sumx2=sumx2+(x(i)^2);
end

b0=((sumy*sumx2)-(sumx*sumxy))/((howbig*sumx2)-(sumx^2));
b1=((howbig*sumxy)-(sumy*sumx))/((howbig*sumx2)-sumx^2);

sumcorym=sumy/howbig;
sumcym2=0;
sumcyh2=0;

for i=1:howbig 
	sumcym2=sumcym2+((y(i)-sumcorym)^2);
	yhat(i)=(b1*x(i))+b0;
	sumcyh2=sumcyh2+((y(i)-yhat(i))^2);
end

r2=(sumcym2-sumcyh2)/sumcym2;