package Memcached::libmemcached::memcached_analyze;

=head1 NAME

memcached_analyze - Analyze server information

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  memcached_analysis_st *
    memcached_analyze (memcached_st *ptr,
                       memcached_stat_st *stat,
                       memcached_return_t *error);

=head1 DESCRIPTION

libmemcached(3) has the ability to query a memcached server (or collection
of servers) for their current state. Queries to find state return a
C<memcached_analysis_st> structure. You are responsible for freeing this structure.

memcached_analyze() analyzes useful information based on the provided servers
and sets the result to the C<memcached_analysis_st> structure. The return value
must be freed by the calling application.

A command line tool, memstat(1) with the option --analyze, is provided so that
you do not have to write an application to use this method.

=head1 RETURN

A pointer to the allocated C<memcached_analysis_st> structure on success and
a NULL pointer on failure. You may inspect the error detail by checking the
C<memcached_return_t> value.

Any method returning a C<memcached_analysis_st> expects you to free the
memory allocated for it.

=head1 HOME

To find out more information please check:
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Toru Maesaka, E<lt>dev@torum.netE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_strerror(3)

=cut
1;
