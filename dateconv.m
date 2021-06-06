function [outdatenum,outdatetxt] = dateconv(yearinp,monthinp,dayinp)
%DATECONV converts date across Gregorian, Persian and Islamic calendars
%   outdate = dateconv(Y,M,D,from_calend,to_calend) computes bilateral date 
%   conversion between Gregorian Common Era ('ce'), Persian Solar Hijri or 
%   Jalali ('sh'), and Islamic Lunar Hijri ('lh') calendars. 
%   Outputs a 1x3 numeric array vector of [Y,M,D], and a character array 
%   with printed date with month names in Persian, Arabic, or English. For 
%   Persian and Islamic calendars, the numbers are shown in Eastern Arabic 
%   numerals. 
% 
% >> [outdatenum,outdatetxt] = dateconv(2000,1,1,'ce','sh')
% outdatenum =
%         1378          10          11
% outdatetxt =
%     '?? ??/??? ????'
% 
% >> datetoday
% Today's date is:
%    12-Nov-2020
% ?? ????/???? ????
% ?? ????-????? ????
% 
% Conversion takes place through the Julian Day Number. Each calendar is 
% converted to and computed back from the Julian Day Number.
% 
% For Gregorian calendar, the algorithm by NASA/Goddard is adopted, which 
% correctly computes the dates for Proleptic era (before 1582).
% 
% For Persian/ Jalali calendar, the algorithm is based on the method proposed 
% by Musa Akrami (2014) and implemented by Soroush Rabiei (2017).
% 
% Check & tests:
% 
% The start of the Persian calendar epoch (1/1/475 SH) per Akrami's 2,820 years cycle starts on Mar 15, 1096 (and NOT on March 21st as other date converter algorithms suggest):
% >> dateconv(475,1,1,'sh','ce')
% ans =
%         1096           3          15
% 
% The first day of the Persian calendar starts on Mar 19, 622:
% >> dateconv(1,1,1,'sh','ce')
% ans =
%    622     3    19
% 
% The first day of the Islamic Lunar Hijri starts on July 16, 622:
% >> dateconv(1,1,1,'lh','ce')
% ans =
%    622     7    16

% MATLAB/Octave code developed by Omar Joya, Biruni Institute, 
% May 2018 <ojoya@biruni.af>
%-----------------------------------------------------------------------------

% Ensure input values are integer and single scalars, months are between 
% 1 and 12, and days must not exceed month days depending on whether the
% year is a leap year or not

if  (mod(yearinp,1) ~= 0) || ~isscalar(yearinp)
    error('Year must be an integer and a single numerical scalar.');
elseif (mod(monthinp,1) ~= 0) || ~isscalar(monthinp)
    error('Month must be an integer and a single numerical scalar.');
elseif (mod(dayinp,1) ~= 0) || ~isscalar(dayinp)
    error('Day must be an integer and a single numerical scalar.');
elseif yearinp == 0
    err = ['Year cannot be 0. The first year of the calendar is 1, '...
        'while the first year before the start of calendar is -1.'];
    error(err);
elseif (monthinp <= 0) || (monthinp > 12)
    error('Month must be between 1 and 12.'); 
end

SHmdays = [31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29];
SHmdaysleap = [31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30];

    if leaptest(yearinp) == 0 && dayinp > SHmdays(monthinp)
        err = ['Number of days for month ', num2str(monthinp),...
        ' must not exceed ', num2str(SHmdays(monthinp))];
        error(err);
    elseif leaptest(yearinp) == 1 && dayinp > SHmdaysleap(monthinp)
        err = ['Number of days for month ', num2str(monthinp),...
        ' must not exceed ', num2str(SHmdaysleap(monthinp))];
        error(err);
    end

% Matching and calling relevant child functions

    jdn = ce2jdn(yearinp,monthinp,dayinp);
    [outdatenum,outdatetxt] = jdn2sh(jdn);

end