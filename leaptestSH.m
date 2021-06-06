function leap = leaptestSH(year)
%LEAPTESTSH calculates if a given Solar Hijri year is a leap year or not
%   The calculation is based on the method proposed by Musa Akrami (2014)
%   and implemented by Soroush Rabiei (2017)
%   https://arxiv.org/abs/1111.4926 
%   https://github.com/soroush/libcalendars/blob/dev/src/cl-solar-hijri.c

% Persian (Solar Hijri) calendar's cycle of years 
SH_cycle = 2820;

% Number of leaps years in a cycle of 2820 years
leaps_total = 683;

% Leap threshold = 0.242198581560284;
leap_threshold = leaps_total / SH_cycle;

% Mean calendar year 
year_legnth = 365.242198581560284;

% Calculation of a leap year
frac = mod((year + 2346) * leap_threshold, 1);
if frac < leap_threshold
    leap = 1;
else 
    leap = 0;
end

end
