+++
title = "Software"
description = "Software created by James Moriarty."
date = "2021-02-10"
aliases = []
author = "James Moriarty"
+++

This is a showcase for some of my personal software projects. You can find out more about my professional accomplishments on [LinkedIn](https://www.linkedin.com/in/jamespaulmoriarty).

- [MiniAASM](#miniaasm)
- [Alpaca Desktop](#alpaca-desktop)
- [Forward Proxy](#forward-proxy)
- [React Instagram Feed](#react-instagram-feed)
- [Gomem](#gomem)
- [Cloudformation Cheapest NAT](#cloudformation-cheapest-nat)
- [Gohack](#gohack)
- [Call Graph](#call-graph)
- [Lisp](#lisp)
- [Nebula](#nebula)
- [Scorched Earth](#scorched-earth)
- [Garmin Connect Import](#garmin-connect-import)


## MiniAASM

```ruby
aasm do
  state :transmitting, initial: true
  state :waiting_confirmation
  state :terminated

  event :work_succeeded do
    transitions from: :waiting_confirmation, to: :transmitting
    transitions from: :transmitting, to: :waiting_confirmation, guard: %i[hold?]
    # ...
```

A [Finite-state machine](https://en.wikipedia.org/wiki/Finite-state_machine) library intended to be compatible with [lightweight implementations](https://github.com/mruby/mruby) of the Ruby language using 100LOC and only standard libraries. Inspired by [Heroku Postgres State Machines](https://www.citusdata.com/blog/2016/08/12/state-machines-to-run-databases/).

- [Github](https://github.com/jamesmoriarty/mini-aasm)

## Alpaca Desktop

[![Alpaca Desktop Screenshot](/images/software/software-alpaca-desktop2.png)](/images/software/software-alpaca-desktop2.png)

Experimental OSX menu bar widget for Alpaca (a local proxy supporting NTLM authentication for command line tools). Built to reduce toil involved in installation and configuration for several hundred engineers.

- [Github](https://github.com/jamesmoriarty/alpaca-desktop)

## Forward Proxy

```shell
$ forward-proxy --binding 0.0.0.0 --port 3182 --threads 2
[2021-01-14 19:37:47 +1100] INFO Listening 0.0.0.0:3182
[2021-01-14 19:38:24 +1100] INFO CONNECT raw.githubusercontent.com:443 HTTP/1.1
```

Minimal forward proxy in 150LOC and using only standard libraries. Useful for development, testing, and teaching. Automated tests simulate a range of destination scenarios including slow network, stream responses, and X509 certificates.

- [Github](https://github.com/jamesmoriarty/forward-proxy)

## React Instagram Feed

[![React Instagram Screenshot](/images/software/software-react-instagram.png)](/images/software/software-react-instagram.png)

Simple React component to render a [Instagram](http://instagram.com) feed. Used an unofficial client-side integration method to avoid having to use a server-side access token. Archived as a result of [Instagram](http://instagram.com) fixing their Cross-Origin-Request policies. I used this to learn Reach and ironically it was then used by educational institutions to teach React before being archived.

- [Github](https://github.com/jamesmoriarty/react-instagram-authless-feed)

## Gomem

```go
import "github.com/jamesmoriarty/gomem"

// Open process with handle.
process, err  := gomem.GetOpenProcessFromName("example.exe")
// Read from process memory.
valuePtr, err := process.ReadUInt32(offsetPtr)
// Write to process memory.
process.WriteByte(valuePtr, value)
```

A Go library to manipulate Windows processes. Useful for developing process memory based security exploits. Automated tests manipulate and verify its own process memory via Windows APIs.

- [Github](https://github.com/jamesmoriarty/gomem)

## Cloudformation Cheapest NAT

[![AWS NAT](/images/software/software-nat.png)](/images/software/software-nat.png)

Cloudformation for a NAT auto-healing instance running on Spot. Featured in [Last Week In AWS](https://www.lastweekinaws.com/newsletter/word-level-overconfidence/).

- [Github](https://github.com/jamesmoriarty/cfn-cheapest-nat)

## Gohack

[![Gohack terminal output](/images/software/software-gohack.png)](/images/software/software-gohack.png)

Experimental Go language CSGO computer game exploit. Automated tests use stubbed external processes to avoid needing binary compatibility.

- [Github](https://github.com/jamesmoriarty/gohack)

## Call Graph

[![Call Graph presentation slide](/images/software/software-callgraph.png)](/images/software/software-callgraph.png)

A Ruby library to capture execution and create call graphs. Useful for illustrating [Law of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter) violations.

- [Github](https://github.com/jamesmoriarty/call-graph)

## Lisp

```lisp
$ lisp-repl
ctrl-c to exit
> (begin
(>   (define incf
((>     (lambda (x)
(((>       (set! x (+ x 1))))
(>   (define one 1)
(>   (incf one))
2
>
```

Minimal Lisp interpreter in 75LOC in Ruby using only standard libraries. Inspired by Google Research Peter Norvig's [Lis.py](http://norvig.com/lispy.html).

- [Github](https://github.com/jamesmoriarty/lisp)

## Nebula

<a href="/images/software/software-nebula.mp4">
  <video width="100%" autoplay loop>
    <source src="/images/software/software-nebula.mp4" type="video/mp4" />
  </video>
</a>

A prototype 2D Javascript space shooter. Simple physics, unit behaviors, parallax effects, and particles.

- [Github](https://github.com/jamesmoriarty/nebula)

## Scorched Earth

<a href="/images/software/software-scorched.mp4">
  <video width="100%" autoplay loop>
    <source src="/images/software/software-scorched.mp4" type="video/mp4" />
  </video>
</a>

A pure JRuby Scorched Earth clone and using only standard libraries. Implemented with an event-driven architecture. Dynamically generates color pallettes utilizing Triad Mixing and CIE94 color distances. Headless automated tests enabled through null pattern graphics context injection.

- [Github](https://github.com/jamesmoriarty/scorched_earth)


## Garmin Connect Import

[![Garmin Connect Import](/images/software/software-garmin-connect-import.jpg)](/images/software/software-garmin-connect-import.jpg)

[BMI as a measure is inaccurate and misleading](https://www.medicalnewstoday.com/articles/265215). [Index™ S2 Smart Scale](https://www.garmin.com/en-NZ/p/679362) have also been reported with [limited accuracy](https://www.youtube.com/watch?v=lBgNZLh5vmg), so I've built this to manually import data into Garmin Connect. The tool can be found [here](https://www.jamesmoriarty.xyz/garmin-connect-custom-import-data/).

- [Github](https://github.com/jamesmoriarty/garmin-connect-custom-import-data/tree/main)