function datetoday()

clc;
clear;

greg = datetime('today');
[y,m,d] = ymd(greg);
[sh,sh_fa] = dateconv(y,m,d);
fprintf("Today's date is :\n");
disp(greg);
disp(sh);
disp(sh_fa);

end