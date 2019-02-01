# webtail

golang implement of "tail -f" unix like, which in web browser , show log file content in browser real time.

***Adopted from https://github.com/snail007/webtail***

## Usage

```shell
./webtail -d /var/log
```

***logfilename*** is the log file name (no extension) in `/var/log` , all log files under that folder must has extension of `.log`.

then access:

`http://127.0.0.1:8822/show/logfilename`

the web page will show log content in real time:
```log
OPEN_SUCCESS
M: 2019-02-01 18:19:44.652 DMR Talker Alias (Data Format 1, Received 6/22 char): 'BG6WWH'
M: 2019-02-01 18:19:44.652 DMR Slot 2, Embedded Talker Alias Header
M: 2019-02-01 18:19:44.653 0000:  04 00 6C 42 47 36 57 57 48                         *..lBG6WWH*
M: 2019-02-01 18:19:45.374 DMR Talker Alias (Data Format 1, Received 13/22 char): 'BG6WWH DMR ID'
M: 2019-02-01 18:19:45.374 DMR Slot 2, Embedded Talker Alias Block 1
M: 2019-02-01 18:19:45.374 0000:  05 00 20 44 4D 52 20 49 44                         *.. DMR ID*
M: 2019-02-01 18:19:45.855 DMR Slot 2, received network end of voice transmission, 1.9 seconds, 0% packet loss, BER: 0.0%
```

## Binary

you can also use prebuild binary , you can get it [here](../..//releases)

```text
Usage of ./webtail:
  -d string
        dir path of log files
  -l string
        listen address (default ":8100")
  -v     show version
```