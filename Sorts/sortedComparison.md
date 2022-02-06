 # Comparison of various not in place sorting algorithm (mostly non comparative)
The array is generated with `randNumArray` like that :
`randNumArray size 1 max`

Scientific notation is used for for readibility. (*1e1 = 10*, 1e4 = 10 000).
max value isn't really `max` but * `max-1`* . This is because it would give an unfair disadvantage to base10 radixSort.

## Individual results

### `sorted` 
GP default method (based on mergeSort I think). Could probably made faster (but less convenient)
nickname : `std`
cmd : `cpoT (function {sorted (global 'array')})`

|     | 1e1   | 1e2   | 1e3   | 1e4   | 1e5   | 1e7   | 1e9   | maxInt |
| --- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ------ |
| 1e1 | 0.01  | 0.01  | 0.01  | 0.01  | 0.01  | 0.01  | 0.01  | 0.01   |
| 1e2 | 0.19  | 0.19  | 0.19  | 0.18  | 0.18  | 0.19  | 0.19  | 0.19   |
| 1e3 | 2.64  | 2.7   | 2.73  | 2.68  | 2.73  | 2.74  | 2.77  | 2.76   |
| 1e4 | 36.48 | 37.6  | 38.24 | 38.16 | 37.56 | 34.88 | 37.42 | 37.5   |
| 1e5 | 449.5 | 461.5 | 430   | 458.5 | 426.5 | 440   | 437   | 459.5  |
| 1e6 | 4922  | 4933  | 4908  | 5400  | 5172  | 5038  | 5551  | 5576   |
| 1e7 | 56895 | 60099 | 60260 | 60548 | 59154 | 61614 | 59549 | 59228  |


### `cSorted`
nickName : `cStd`
cmd : `cpoT (function {cSorted (global 'array') 1 (global 'range')})`

|     | 1e1    | 1e2   | 1e3    | 1e4   | 1e5   | 1e7   | 1e9 | maxInt |
| --- | ------ | ----- | ------ | ----- | ----- | ----- | --- | ------ |
| 1e1 | 0      | 0.01  | 0.04   | 0.4   | 3.97  | 385.5 | mem | mem    |
| 1e2 | 0.02   | 0.02  | 0.06   | 0.41  | 4.02  | 394   | mem | mem    |
| 1e3 | 0.16   | 0.16  | 0.2    | 0.53  | 4.12  | 408   | mem | mem    |
| 1e4 | 1.46   | 1.57  | 1.6    | 2.03  | 5.39  | 391.5 | mem | mem    |
| 1e5 | 15.38  | 15.94 | 14.94  | 15.87 | 20.44 | 426   | mem | mem    |
| 1e6 | 151.67 | 140.5 | 144.83 | 152   | 147   | 619   | mem | mem    |
| 1e7 | 1380   | 1534  | 1522   | 1525  | 1460  | 2704  | mem | mem    |

### `cSortedD`
nickName : `cStdD`
cmd : `cpoT (function {cSortedD (global 'array')})`

|     | 1e1   | 1e2   | 1e3   | 1e4    | 1e5   | 1e7   | 1e9    | maxInt |
| --- | ----- | ----- | ----- | ------ | ----- | ----- | ------ | ------ |
| 1e1 | 0.04  | 0.05  | 0.05  | 0.05   | 0.05  | 0.05  | 0.05   | 0.05   |
| 1e2 | 0.21  | 0.5   | 0.71  | 0.77   | 0.72  | 0.74  | 0.74   | 0.68   |
| 1e3 | 1.85  | 2.4   | 5.61  | 8.61   | 9.33  | 9.55  | 10.3   | 9.49   |
| 1e4 | 18.13 | 18.63 | 25.26 | 59.73  | 96    | 99.89 | 101.44 | 100.67 |
| 1e5 | 182.8 | 183   | 193   | 260.33 | 720   | 1107  | 1131   | 1136   |
| 1e6 | 1922  | 1908  | 1850  | 1940   | 2621  | 11286 | 12882  | 12446  |
| 1e7 | 17810 | 18297 | 17861 | 18037  | 20157 | mem   | mem    |        |

### `radixCSorted`
nickName : `rStd`
cmd : `cpoT (function {radixCSorted (global 'array') (global 'range')})`

|     | 1e1   | 1e2    | 1e3    | 1e4    | 1e5   | 1e7   | 1e9  | maxInt |
| --- | ----- | ------ | ------ | ------ | ----- | ----- | ---- | ------ |
| 1e1 | 0.01  | 0.03   | 0.05   | 0.06   | 0.07  | 0.09  | 0.12 | int    |
| 1e2 | 0.07  | 0.16   | 0.26   | 0.35   | 0.45  | 0.66  | 0.92 | int    |
| 1e3 | 0.65  | 1.42   | 2.26   | 3.27   | 4.22  | 6.41  | 9.14 | int    |
| 1e4 | 6.58  | 14.01  | 22.51  | 31.93  | 41.23 | 65.43 | 86.2 | int    |
| 1e5 | 66.79 | 139.17 | 223.25 | 307.33 | 400   | 619   | 896  | int    |
| 1e6 | 642   | 1362   | 2235   | 3108   | 4088  | 5950  | 8228 | int    |
| 1e7 | 6638  | mem    | mem    | mem    | mem   | mem   | mem  |        |

### `radixCsorted256`
nickName: `rC256`
cmd: `cpoT (function {radixCSorted256 (global 'array') (global 'range')})`

|     | 1e1   | 1e2   | 1e3    | 1e4    | 1e5  | 1e7   | 1e9    | maxInt |
| --- | ----- | ----- | ------ | ------ | ---- | ----- | ------ | ------ |
| 1e1 | 0.05  | 0.05  | 0.1    | 0.1    | 0.15 | 0.15  | 0.21   | 0.21   |
| 1e2 | 0.1   | 0.11  | 0.21   | 0.21   | 0.32 | 0.32  | 0.42   | 0.42   |
| 1e3 | 0.64  | 0.62  | 1.22   | 1.25   | 1.81 | 1.83  | 2.43   | 2.44   |
| 1e4 | 5.67  | 5.69  | 11.99  | 11.83  | 17.7 | 17.75 | 23.88  | 23.75  |
| 1e5 | 58.94 | 59.38 | 117.25 | 117.13 | 176  | 176.4 | 236.25 | 223.25 |
| 1e6 | 592   | 592   | 1185   | 1169   | 1793 | 1814  | 2422   | 2434   |
| 1e7 | 5932  | 5833  | mem    | mem    | mem  | mem   | mem    | mem    |


### `radixBsorted`
nickName : `rStdB`
cmd : `cpoT (function {radixBSorted (global 'array') (global 'range')})`

|     | 1e1   | 1e2   | 1e3    | 1e4   | 1e5   | 1e7   | 1e9   | maxInt |
| --- | ----- | ----- | ------ | ----- | ----- | ----- | ----- | ------ |
| 1e1 | 0.01  | 0.02  | 0.03   | 0.05  | 0.05  | 0.07  | 0.08  | int    |
| 1e2 | 0.05  | 0.11  | 0.16   | 0.22  | 0.29  | 0.42  | 0.57  | int    |
| 1e3 | 0.42  | 0.9   | 1.4    | 1.92  | 2.52  | 3.85  | 5.32  | int    |
| 1e4 | 4.2   | 8.97  | 13.56  | 19.52 | 25.13 | 37.92 | 51.28 | int    |
| 1e5 | 41.08 | 87.45 | 137.86 | 192.4 | 248.5 | 371   | 511   | int    |
| 1e6 | 411   | 875   | 1375   | 1937  | 2540  | 3624  | 5080  | int    |
| 1e7 | 3928  | 8963  | 13506  | 19179 | 25070 | 37066 | 50474 | int    |

### `radixBSorted256`
nickName : `rB256`
cmd : `cpoT (function {radixBSorted256 (global 'array') (global 'range')})`

|     | 1e1   | 1e2   | 1e3  | 1e4   | 1e5    | 1e7   | 1e9    | maxInt |
| --- | ----- | ----- | ---- | ----- | ------ | ----- | ------ | ------ |
| 1e1 | 0.1   | 0.09  | 0.14 | 0.14  | 0.19   | 0.19  | 0.25   | 0.25   |
| 1e2 | 0.13  | 0.12  | 0.21 | 0.21  | 0.3    | 0.3   | 0.39   | 0.4    |
| 1e3 | 0.46  | 0.47  | 0.88 | 0.87  | 1.27   | 1.3   | 1.76   | 1.76   |
| 1e4 | 3.82  | 3.8   | 7.84 | 7.66  | 11.38  | 11.72 | 15.28  | 15.2   |
| 1e5 | 37.96 | 36.6  | 73   | 71.46 | 109.75 | 113   | 147.17 | 148.5  |
| 1e6 | 358.5 | 358.5 | 736  | 733   | 1140   | 1052  | 1473   | 1446   |
| 1e7 | 3659  | 3707  | 7568 | 7415  | mem    | mem   | mem    | mem    |

