#!/usr/bin/env perl
use strict;
use warnings;
#use Dancer2;
use FindBin;
use lib "$FindBin::Bin/../lib";
#use lib "../lib";

use autohome;
use autohome::API;
#autohome->to_app;


use Plack::Builder;

builder {
    mount '/'      => autohome->to_app;
    mount '/api' => autohome::API->to_app;
};

