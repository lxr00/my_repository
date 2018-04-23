clc;
%空间二次曲面拟合算法  
num_points = length(x);  
%一次项统计平均  
x_avr = sum(x)/num_points;  
y_avr = sum(y)/num_points;  
z_avr = sum(z)/num_points;  
%二次项统计平均  
xx_avr = sum(x.*x)/num_points;  
yy_avr = sum(y.*y)/num_points;  
zz_avr = sum(z.*z)/num_points;  
xy_avr = sum(x.*y)/num_points;  
xz_avr = sum(x.*z)/num_points;  
yz_avr = sum(y.*z)/num_points;  
%三次项统计平均  
xxx_avr = sum(x.*x.*x)/num_points;  
xxy_avr = sum(x.*x.*y)/num_points;  
xxz_avr = sum(x.*x.*z)/num_points;  
xyy_avr = sum(x.*y.*y)/num_points;  
xzz_avr = sum(x.*z.*z)/num_points;  
yyy_avr = sum(y.*y.*y)/num_points;  
yyz_avr = sum(y.*y.*z)/num_points;  
yzz_avr = sum(y.*z.*z)/num_points;  
zzz_avr = sum(z.*z.*z)/num_points;  
%四次项统计平均  
yyyy_avr = sum(y.*y.*y.*y)/num_points;  
zzzz_avr = sum(z.*z.*z.*z)/num_points;  
xxyy_avr = sum(x.*x.*y.*y)/num_points;  
xxzz_avr = sum(x.*x.*z.*z)/num_points;  
yyzz_avr = sum(y.*y.*z.*z)/num_points;  
  
  
%计算求解线性方程的系数矩阵  
A0 = [yyyy_avr yyzz_avr xyy_avr yyy_avr yyz_avr yy_avr;  
     yyzz_avr zzzz_avr xzz_avr yzz_avr zzz_avr zz_avr;  
     xyy_avr  xzz_avr  xx_avr  xy_avr  xz_avr  x_avr;  
     yyy_avr  yzz_avr  xy_avr  yy_avr  yz_avr  y_avr;  
     yyz_avr  zzz_avr  xz_avr  yz_avr  zz_avr  z_avr;  
     yy_avr   zz_avr   x_avr   y_avr   z_avr   1;];  
%计算非齐次项  
b = [-xxyy_avr;  
     -xxzz_avr;  
     -xxx_avr;  
     -xxy_avr;  
     -xxz_avr;  
     -xx_avr];  
  
resoult = A0\b;  
%resoult = solution_equations_n_yuan(A0,b);  
  
x0 = -resoult(3)/2;                  %拟合出的x坐标  
y0 = -resoult(4)/(2*resoult(1));     %拟合出的y坐标  
z0 = -resoult(5)/(2*resoult(2));     %拟合出的z坐标  
  
A = sqrt(x0*x0 + resoult(1)*y0*y0 + resoult(2)*z0*z0 - resoult(6));   % 拟合出的x方向上的轴半径  
B = A/sqrt(resoult(1));                                               % 拟合出的y方向上的轴半径  
C = A/sqrt(resoult(2));                                               % 拟合出的z方向上的轴半径 

%将球心移至原点
x = x-x0;
y = y-y0;
z = z-z0;

%将坐标轴按比例缩放
x = x*(((A+B+C)/3)/A);
y = y*(((A+B+C)/3)/B);
z = z*(((A+B+C)/3)/C);

plot3(x,y,z);
axis equal;