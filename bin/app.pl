#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use autohome;
use autohome::API;
use Plack::Builder;

builder {
    mount '/'    => autohome->to_app;
    mount '/api' => autohome::API->to_app;
};

