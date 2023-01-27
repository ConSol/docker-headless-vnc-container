#!/usr/bin/perl

use warnings;
use strict;

use File::Basename;
use YAML ();
use Test::More;

plan tests => 14;

chdir(dirname($0));
my $conf = YAML::LoadFile("docker-compose.yml");

is(ref $conf->{'services'}, "HASH", "read docker-compose.yml");
is(scalar %{$conf->{'services'}}, 4, "read services from docker-compose.yml");

for my $svc (sort keys %{$conf->{'services'}}) {
	my $app = $conf->{'services'}->{$svc};
	ok(1, $svc);
	for my $port (@{$app->{'ports'}}) {
		my($ip, $localport, $remoteport) = split(/:/mx, $port);
		if($remoteport eq "5901") {
			# vnc test
			my $out = `nc -w 1 127.0.99.13 $localport 2>&1`;
			like($out, '/RFB/', "vnc connect header found")
		}
		elsif($remoteport eq "6901") {
			# http test
			my $out = `curl -s http://127.0.99.13:$localport/?password=vncpassword 2>&1`;
			like($out, '/noVNC/', "web vnc html contains noVNC")
		} else {
			die("unknown port: ".$remoteport);
		}
	}
}
