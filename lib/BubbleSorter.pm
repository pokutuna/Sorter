package BubbleSorter;

use strict;
use warnings;

use base qw(Sorter);

sub sort {
    my $self = shift;
    my @sorted = &_bsort($self->get_values);
    $self->set_values(@sorted);
}

sub _bsort {
    return @_ if @_ <= 1;
    my $size = @_ - 1;
    my @ary = @_;
    while ($size > 0) {
        foreach my $index (0..($size - 1)) {
            if ($ary[$index] > $ary[$index + 1]) {
                ($ary[$index], $ary[$index + 1]) = ($ary[$index + 1], $ary[$index])
            }
        }
        $size -= 1;
    }
    return @ary;
}

1;
