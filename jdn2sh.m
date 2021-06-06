function [SHdate,date_fa] = jdn2sh(jdn)
%JDN2SH converts a Julian Day Number to Solar Hijri date

%   The algorithm is based on the method proposed by Musa Akrami (2014)
%   and implemented by Soroush Rabiei (2017)
%   https://arxiv.org/abs/1111.4926 
%   https://github.com/soroush/libcalendars/blob/dev/src/cl-solar-hijri.c

cycle_years = 2820;
sh_epoch_jdn = 2121446;
year_length = 365.24219858156028368;

jul_era = floor((jdn - sh_epoch_jdn) / year_length);
SHyear = jul_era + 475;
SHday = jdn - sh_epoch_jdn - floor(jul_era * year_length) + 1;

if leaptestSH(SHyear) == 1 && SHday > 366
    SHyear = SHyear + 1;
    SHday = SHday - 366;
elseif leaptestSH(SHyear) == 0 && SHday > 365
    SHyear = SHyear + 1;
    SHday = SHday - 365;
end

if SHyear <= 0
    SHyear = SHyear - 1;
    SHday = SHday - 1;
end

SHmonth = 0;

for SHmonth = 1:12
    SHmonth = SHmonth;
    if SHmonth >= 1 && SHmonth <7
        mdays = 31;
    elseif SHmonth >= 7 && SHmonth < 12
        mdays = 30;
    elseif leaptestSH(SHyear) == 0 && SHmonth == 12
        mdays = 29;
    elseif leaptestSH(SHyear) == 1 && SHmonth == 12
        mdays = 30;
    end
    if SHday > mdays 
        SHday = SHday - mdays;
    else
        break
    end
end

SHdate = [SHyear, SHmonth, SHday];

% Display date in Persian
date_fa = [arabic2eastarabic(SHday),' ',monthnameSH(SHmonth),' ',arabic2eastarabic(SHyear)];

end