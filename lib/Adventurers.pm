package Adventurer;

use strict;
use warnings;

# Constructor method to create a new adventurer
sub new {
    my ($class, %args) = @_;
    
    # Set default values for attributes if not provided
    my $self = {
        name       => $args{name},
        age        => $args{age},
        fightStyle => $args{fightStyle},
        race       => $args{race},
        health     => $args{health} // 100,  # Default value for health is 100
        backpack   => {
            health_potion => 1,
        }, 
    };
    
    bless $self, $class;
    return $self;
}

# Method to create a new adventurer based on user input
sub create_adventurer {
    my ($class) = @_;
    
    print "Enter name: ";
    chomp(my $name = <STDIN>);
    
    print "Enter age: ";
    chomp(my $age = <STDIN>);
    
    print "Enter fight style: ";
    chomp(my $fightStyle = <STDIN>);
    
    print "Enter your race: ";
    chomp(my $race = <STDIN>);
    
    return $class->new(
        name       => $name,
        age        => $age,
        fightStyle => $fightStyle,
        race       => $race,
        # Assuming you want to use the default or provided value, you can set it as shown.
    );
}

# Method to display adventurer details
sub display {
    my ($self) = @_;
    print "\nAdventurer created:\n";
    print "Name: ", $self->{name}, "\n";
    print "Age: ", $self->{age}, "\n";
    print "Fight Style: ", $self->{fightStyle}, "\n";
    print "Race: ", $self->{race}, "\n";
    print "Health: ", $self->{health}, "\n";  # Added health display

    print "Backpack: ";
    if (%{$self->{backpack}}) {
        foreach my $item (keys %{$self->{backpack}}) {
            print "$item ($self->{backpack}{$item}), ";
        }
        print "\n";
    } else {
        print "Empty\n";
    }
    
}

sub add_to_backpack {
    my ($self, $item, $quantity) = @_;
    $quantity ||=1;
    $self->{backpack}{$item} += $quantity;
    print "$item has been added to your backpack.\n";
}

# Method to use an item from the backpack
sub use_item {
    my ($self, $item) = @_;
    if (exists $self->{backpack}{$item} && $self->{backpack}{$item} > 0) {
        $self->{backpack}{$item}--;
        print "You used one $item. Remaining: $self->{backpack}{$item}.\n";
        delete $self->{backpack}{$item} if $self->{backpack}{$item} == 0;
    } else {
        print "You don't have any $item in your backpack.\n";
    }
}

# Method to delete an item from the backpack
sub delete_item {
    my ($self, $item) = @_;
    if (exists $self->{backpack}{$item}) {
        delete $self->{backpack}{$item};
        print "$item has been removed from your backpack.\n";
    } else {
        print "You don't have any $item in your backpack.\n";
    }
}

# Method to get the name of the adventurer
sub get_name {
    my ($self) = @_;
    return $self->{name};
}

# Method to get the race of the adventurer
sub get_race {
    my ($self) = @_;
    return $self->{race};
}
# Method for the adventurer to attack
sub attack {
    my ($self, $target) = @_;
    my $damage = int(rand(10)) + 1;  # Random damage between 1 and 10
    $target->take_damage($damage);
    print $self->{name}, " attacks for $damage damage!\n";
}

# Method to apply damage to the adventurer
sub take_damage {
    my ($self, $damage) = @_;
    $self->{health} -= $damage;
    $self->{health} = 0 if $self->{health} < 0;
}
sub get_hp {
    my ($self) = @_;
    return $self->{health};
}

1;  # End of Adventurer package
