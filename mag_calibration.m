clc;
%�ռ������������㷨  
num_points = length(x);  
%һ����ͳ��ƽ��  
x_avr = sum(x)/num_points;  
y_avr = sum(y)/num_points;  
z_avr = sum(z)/num_points;  
%������ͳ��ƽ��  
xx_avr = sum(x.*x)/num_points;  
yy_avr = sum(y.*y)/num_points;  
zz_avr = sum(z.*z)/num_points;  
xy_avr = sum(x.*y)/num_points;  
xz_avr = sum(x.*z)/num_points;  
yz_avr = sum(y.*z)/num_points;  
%������ͳ��ƽ��  
xxx_avr = sum(x.*x.*x)/num_points;  
xxy_avr = sum(x.*x.*y)/num_points;  
xxz_avr = sum(x.*x.*z)/num_points;  
xyy_avr = sum(x.*y.*y)/num_points;  
xzz_avr = sum(x.*z.*z)/num_points;  
yyy_avr = sum(y.*y.*y)/num_points;  
yyz_avr = sum(y.*y.*z)/num_points;  
yzz_avr = sum(y.*z.*z)/num_points;  
zzz_avr = sum(z.*z.*z)/num_points;  
%�Ĵ���ͳ��ƽ��  
yyyy_avr = sum(y.*y.*y.*y)/num_points;  
zzzz_avr = sum(z.*z.*z.*z)/num_points;  
xxyy_avr = sum(x.*x.*y.*y)/num_points;  
xxzz_avr = sum(x.*x.*z.*z)/num_points;  
yyzz_avr = sum(y.*y.*z.*z)/num_points;  
  
  
%����������Է��̵�ϵ������  
A0 = [yyyy_avr yyzz_avr xyy_avr yyy_avr yyz_avr yy_avr;  
     yyzz_avr zzzz_avr xzz_avr yzz_avr zzz_avr zz_avr;  
     xyy_avr  xzz_avr  xx_avr  xy_avr  xz_avr  x_avr;  
     yyy_avr  yzz_avr  xy_avr  yy_avr  yz_avr  y_avr;  
     yyz_avr  zzz_avr  xz_avr  yz_avr  zz_avr  z_avr;  
     yy_avr   zz_avr   x_avr   y_avr   z_avr   1;];  
%����������  
b = [-xxyy_avr;  
     -xxzz_avr;  
     -xxx_avr;  
     -xxy_avr;  
     -xxz_avr;  
     -xx_avr];  
  
resoult = A0\b;  
%resoult = solution_equations_n_yuan(A0,b);  
  
x0 = -resoult(3)/2;                  %��ϳ���x����  
y0 = -resoult(4)/(2*resoult(1));     %��ϳ���y����  
z0 = -resoult(5)/(2*resoult(2));     %��ϳ���z����  
  
A = sqrt(x0*x0 + resoult(1)*y0*y0 + resoult(2)*z0*z0 - resoult(6));   % ��ϳ���x�����ϵ���뾶  
B = A/sqrt(resoult(1));                                               % ��ϳ���y�����ϵ���뾶  
C = A/sqrt(resoult(2));                                               % ��ϳ���z�����ϵ���뾶 

%����������ԭ��
x = x-x0;
y = y-y0;
z = z-z0;

%�������ᰴ��������
x = x*(((A+B+C)/3)/A);
y = y*(((A+B+C)/3)/B);
z = z*(((A+B+C)/3)/C);

plot3(x,y,z);
axis equal;