function jdn = ce2jdn(year,month,day)
%JDN2CE calculates a Julian Day Number for a given Gregorian Common Era date

% The algorithm is based on NASA/Goddard's code: 
% https://bowie.gsfc.nasa.gov/time/julian.txt 

CEyear = year;
CEmonth = month;
CEday = day;

IGREG = (14+31*(10+12*1582));

if CEyear < 0
  CEyear = CEyear + 1;
end
if CEmonth > 2
  CEmonth = CEmonth +1;
else
  CEyear = CEyear - 1;
  CEmonth = CEmonth + 13;
end

jdn = floor(floor(365.25*CEyear)+floor(30.6001*CEmonth)+CEday+1720995);

if (CEday + 31 * (CEmonth + 12 * CEyear)) >= IGREG
ja = floor(0.01*CEyear);
jdn = jdn + 2-ja+floor(0.25*ja);
end
  
end