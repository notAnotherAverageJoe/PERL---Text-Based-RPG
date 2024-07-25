package Harpy;

use strict;
use warnings;

sub new {
    my ($class, %args) = @_;
    my $self = {
        name   => $args{name},
        age    => $args{age},
        health => $args{health} // 100,
    };
    bless $self, $class;
    return $self;
}

# Method for the harpy to attack
sub attack {
    my ($self, $target) = @_;
    my $damage = int(rand(10)) + 1;  # Random damage between 1 and 10
    $target->take_damage($damage);
    print $self->{name}, " attacks for $damage damage!\n";
}

# Method to apply damage to the harpy
sub take_damage {
    my ($self, $damage) = @_;
    $self->{health} -= $damage;
    $self->{health} = 0 if $self->{health} < 0;
}

1;
