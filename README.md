# OMQ::SCATTER and OMQ::GATHER

[![CI](https://github.com/paddor/omq-rfc-scattergather/actions/workflows/ci.yml/badge.svg)](https://github.com/paddor/omq-rfc-scattergather/actions/workflows/ci.yml)
[![Gem Version](https://img.shields.io/gem/v/omq-rfc-scattergather?color=e9573f)](https://rubygems.org/gems/omq-rfc-scattergather)
[![License: ISC](https://img.shields.io/badge/License-ISC-blue.svg)](LICENSE)
[![Ruby](https://img.shields.io/badge/Ruby-%3E%3D%203.3-CC342D?logo=ruby&logoColor=white)](https://www.ruby-lang.org)

SCATTER and GATHER socket types ([RFC 49](https://rfc.zeromq.org/spec/49/))
for [OMQ](https://github.com/paddor/omq).

Single-frame PUSH/PULL equivalent. SCATTER round-robins, GATHER
fair-queues.

## Usage

```ruby
require "omq"
require "omq/rfc/scattergather"

gather = OMQ::GATHER.bind("tcp://127.0.0.1:5555")
scatter = OMQ::SCATTER.connect("tcp://127.0.0.1:5555")

scatter << "work item"
msg = gather.receive  # => "work item"
```

## Installation

```ruby
gem "omq-rfc-scattergather"
```

Requires `omq >= 0.12`.

## License

[ISC](LICENSE)
