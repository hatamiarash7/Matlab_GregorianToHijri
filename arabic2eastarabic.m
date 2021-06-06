function Echar = arabic2eastarabic(A)
%ARABIC2EASTARABIC converts Arabic numerals to Eastern Arabic numerals
%
% MATLAB/Octave code developed by Omar Joya, Biruni Institute, 
% May 2018 <ojoya@biruni.af>
%-----------------------------------------------------------------------------

Asplit = cellstr(num2str(A)');
Ecell = cellfun(@(c)['06f' c],Asplit,'uni',false);
Echar = char(hex2dec(Ecell)');

% numerals = {'06f0','06f1','06f2','06f3','06f4','06f5','06f6','06f7',...
%     '06f8','06f9'};
% Asplit = cell2mat(cellstr(num2str(A)'));
% n = size(Asplit,1);
% Ecell = cell(1,n);
% for j = 1:n
%     k = str2num(Asplit(j))+1;
%     Ecell{j} = numerals{k};
% end
% Echar = strjoin({char(hex2dec(Ecell))})';

end


