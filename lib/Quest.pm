package Quest;

use strict;
use warnings;
use Term::ANSIColor;

sub start_quest {
    my ($adventurer) = @_;  # Receive the Adventurer object

    print "The quest for ", $adventurer->get_name(), " has begun!\n";
    print "Narration: Just as soon as you accepted the quest, you hear the shrieks of the harpies above.\n";
    print "What will you do ", $adventurer->get_name(), "? Your options are as follows:\n";
    print "1: Attack\n";
    print "2: Throw a rock at a harpy\n";

    chomp(my $choice1 = <STDIN>);

    if ($choice1 eq "1") {
        print "A harpy approaches!\n";
        combat($adventurer);
    } else {
        print "You throw a rock.\n";
        print "The harpy screeches and flies away in a fury!\n";
    }
}

# Combat function
sub combat {
    my ($adventurer) = @_;
    my $harpy = Harpy->new(
        name   => 'Stormclaw',
        age    => 5,
        health => 40,
    );

    # Display initial stats
    $adventurer->display();
    print "Harpy Name: ", $harpy->{name}, "\n";
    print "Harpy Health: ", $harpy->{health}, "\n";

    # Combat loop
    while ($adventurer->{health} > 0 && $harpy->{health} > 0) {
        print "\nAdventurer's turn!\n";
        $adventurer->attack($harpy);
        print "Harpy's health: ", $harpy->{health}, "\n";

        if ($harpy->{health} <= 0) {
            print "The harpy has been defeated!\n";
            last;
        }

        print "\nHarpy's turn!\n";
        $harpy->attack($adventurer);
        print "Adventurer's health: ", $adventurer->{health}, "\n";

        if ($adventurer->{health} <= 0) {
            print "The adventurer has been defeated!\n";
            exit 1;
        }
    }

    print "Combat over.\n";
    print "Adventurer's health: " . $adventurer->get_hp() . "\n";

    print "You have won the day! However, ";
    print "you are injured.. will you take refuge in the village tonight?";
    print "Or will you camp in the wilderness for the night?";
    print "Make your choice ", $adventurer->get_name(). " 1: Village || 2: Wilderness";


}



1;  # End of Quest package
