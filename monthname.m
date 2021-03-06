function monthname = monthnameSH(x)

monthhexanamearray = {'641 631 648 631 62F 6CC 646 02F 62D 645 644',...
    '627 631 62F 6CC 628 647 634 62A 02F 62B 648 631',...
    '62E 631 62F 627 62F 02F 62C 648 632 627','62A 6CC 631 02F 633 631 637 627 646',...
    '645 631 62F 627 62F 02F 627 633 62F','634 647 631 6CC 648 631 02F 633 646 628 644 647',...
    '645 647 631 02F 645 6CC 632 627 646','622 628 627 646 02F 639 642 631 628',...
    '622 630 631 02F 642 648 633','62F 6CC 02F 62C 62F 6CC','628 647 645 646 02F 62F 644 648',...
    '627 633 641 646 62F 02F 62D 648 62A'};

month = monthhexanamearray{x};
monthsplit = strsplit(month);
monthname = strjoin(cellstr((char(hex2dec(monthsplit))))');
monthname = monthname(~isspace(monthname));

end