# Matlab_GregorianToHijri

Converts Gregorian dates to Persian/ Jalali (Solar Hijri)

## How to

- You can run `datetoday.m` to see today's date in Hijri format.
- Or, you can use `dateconv.m` to convert your dates :

```matlab
dateconv(year, month, day);
```

Example :

```matlab
[sh, sh_fa] = dateconv(2021, 5, 6);

Today's date is :
    06-Jun-2021

    1400    2   16

    ۱۶ اردیبهشت/ثور ۱۴۰۰
```
