package Memcached::libmemcached::API;

=head1 NAME

Memcached::libmemcached::API - 

=head1 SYNOPSIS

    use Memcached::libmemcached::API;

    @function_names = libmemcached_functions();
    @constant_names = libmemcached_constants();
    @EXPORT_TAGS    = libmemcached_tags();

=head1 DESCRIPTION

This module should be considered private. It may change or be removed in future.

=head1 FUNCTIONS

=cut

use base qw(Exporter);
our @EXPORT = qw(
    libmemcached_functions
    libmemcached_constants
    libmemcached_tags
);


# load hash of libmemcached functions created by Makefile.PL
my $libmemcached_funcs = require "Memcached/libmemcached/func_hash.pl";
die "Memcached/libmemcached/func_hash.pl failed sanity check"
    unless ref $libmemcached_funcs eq 'HASH'
        and keys %$libmemcached_funcs > 20;

our @libmemcached_funcs = sort keys %$libmemcached_funcs;


# load hash of libmemcached functions created by Makefile.PL
my $libmemcached_consts = require "Memcached/libmemcached/const_hash.pl";
die "Memcached/libmemcached/const_hash.pl failed sanity check"
    unless ref $libmemcached_consts eq 'HASH'
        and keys %$libmemcached_consts > 20;

our @libmemcached_consts = sort keys %$libmemcached_consts;


=head2 libmemcached_functions

  @names = libmemcached_functions();

Returns a list of all the public functions in the libmemcached library.

=cut

sub libmemcached_functions { @libmemcached_funcs } 


=head2 libmemcached_constants

  @names = libmemcached_constants();

Returns a list of all the constants in the libmemcached library.

=cut

sub libmemcached_constants { @libmemcached_consts } 


=head2 libmemcached_tags

  @tags = libmemcached_tags();

Returns a hash list of pairs of tag name and array references suitable for setting %EXPORT_TAGS.

=cut

sub libmemcached_tags {
    my %tags;
    push @{ $tags{ $libmemcached_consts->{$_} } }, $_
        for keys %$libmemcached_consts;
    #use Data::Dumper; warn Dumper(\%tags);
    return %tags;
} 

1;
