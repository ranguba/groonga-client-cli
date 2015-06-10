# README

## Name

groonga-client-cli

## Description

Groonga-client-cli provides command line
[Groonga](http://groonga.org/) clients.

Groonga command line clients can work without Groonga. `groonga`
command provided by Groonga can only use for GQTP but they can use for
both GQTP and HTTP.

Here are provided command lines:

  * `groonga-client`: Sends Groonga commands and shows responses.

## Install

    % gem install groonga-client-cli

## Usage

### `groonga-client`

`groonga-client` reads Groonga commands from one or more files, sends
these read commands and shows responses of them

Here is an example that restores dumped Groonga database to Groonga
runs at `http://localhost:10041/`:

    % groonga-client dump.grn

You can send Groonga commands to Groonga runs at other host by
`--host` option:

    % groonga-client --host 192.168.0.1 dump.grn

There are more options:

    % groonga-client --help
    Usage: groonga-client [options] GROONGA_COMMAND_FILE1 GROONGA_COMMAND_FILE2 ...

    Connection:
            --protocol=PROTOCOL          Protocol to connect to Groonga server.
                                         [http, gqtp]
                                         (http)
            --host=HOST                  Groonga server to be connected.
                                         (localhost)
            --port=PORT                  Port number of Groonga server to be connected.
                                         (auto)
            --read-timeout=TIMEOUT       Timeout on reading response from Groonga server.
                                         You can disable timeout by specifying -1.
                                         (60)
            --split-load-chunk-size=SIZE Split a large load to small loads.
                                         Each small load has at most SIZE records.
                                         Set 0 to SIZE to disable this feature.
                                         (10000)

## Mailing list

  * English: [groonga-talk@lists.sourceforge.net](https://lists.sourceforge.net/lists/listinfo/groonga-talk)
  * Japanese: [groonga-dev@lists.sourceforge.jp](http://lists.sourceforge.jp/mailman/listinfo/groonga-dev)

## Authors

  * Kouhei Sutou \<kou@clear-code.com\>

## License

LGPLv2.1 or later. See doc/text/lgpl-2.1.txt for details.

(Kouhei Sutou has a right to change the license including contributed
patches.)
