# summary

This is a script that imports various stock data.


## price.py

Here is a script that scrapes all stock quotes.
https://finance.daum.net/domestic/all_quotes

### Example
`` `
$ ./price.py
{'name': 'AJ Networks', 'symbol': '095570', 'price': 4720.0}
{'name': 'AJ Rent a Car', 'symbol': '068400', 'price': 10550.0}
{'name': 'AK Holdings', 'symbol': '006840', 'price': 35150.0}
`` `

## day.py

This is a script to get daily quotes from Naver.


### Example
`` `
$ ./day.py -s 005930
005930 43800 44200 43650 43950 4637815
`` `

### Application Examples

[GNU Parallel] (https://www.gnu.org/software/parallel/) allows you to spawn 10 processes to import data in parallel.

`` `
$ cat / tmp / symbols | parallel --jobs 10 -N300 --pipe ./day.py -s-> `date +% Y-% m-% d`.txt
`` `

## minute.py

This is a script to get minute quotes from Naver.

### Example
`` `
$ ./minute.py -s 005930
005930 44300 406234 09:00
005930 44250 39591 09:01
005930 44200 10132 09:02
005930 44250 26397 09:03
005930 44150 35251 09:04
005930 44250 52259 09:05
005930 44200 47983 09:06
005930 44150 26621 09:07
005930 44150 51956 09:08
005930 44100 31060 09:09
005930 44150 4102 09:10
005930 44100 9177 09:11
005930 44050 53945 09:12
005930 44000 56709 09:13
005930 44000 7189 09:14
005930 44050 17476 09:15
`` `

### Application Examples

[GNU Parallel] (https://www.gnu.org/software/parallel/) allows you to spawn 10 processes to import data in parallel.

`` `
$ cat / tmp / symbols | parallel --jobs 10 -N300 --pipe ./minute.py -s-> `date +% Y-% m-% d`.txt
`` `
