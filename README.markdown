Service Disruption
=============

A little library to easily tell you when the Tube has problems

## Install

    gem install service_disruption


## Running

    $: service_disruption start

Extra arguments are: `-d` to deamonise and `-i` to change the polling time, defaults to once every 30 seconds

Alternatively if you'd like to see some pretty colours on your command line you can run

    $: service_disruption status

That will tell you the current state of the tube network, you can also incude it as any other ruby library. It exposes the following API:

    ServiceDisruption.network #Returns the current network status as an object, all other methods can be accessed through this

## Who?

[Adam Carlile](http://adamcarlile.com) built this. Ping me on Twitter —
[@frozenproduce](http://twitter.com/frozenproduce).

NOTE: Not to be used for mission critical service monitoring!

