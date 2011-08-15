package Sorter;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {};
    bless($self, $class);
    $self->_init;
    return $self;
}

sub _init {
    my $self = shift;
    $self->{values} = [];
}

sub set_values {
    my $self = shift;
    $self->{values} = \@_;
}

sub get_values {
    my $self = shift;
    @{$self->{values}};
}

sub sort {
    my $self = shift;
    my @sorted = &_qsort($self->get_values);
    $self->set_values(@sorted);
}

sub _qsort {
    return () if @_ < 1;

    my ($pivot, @values) = @_;
    my (@left, @right) = ((), ());
    foreach my $v (@values) {
        ($v < $pivot) ? push(@left, $v) : push(@right, $v);
    }

    return (&_qsort(@left), $pivot, &_qsort(@right));
}

1;

