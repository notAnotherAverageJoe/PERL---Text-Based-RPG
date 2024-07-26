package Village;

use strict;
use warnings;
use Term::ANSIColor;

use feature 'say';

sub village_quest{
    my ($adventurer) = @_;  # Receive the Adventurer object

    say "\t\t", $adventurer->get_name(), " Since you decided to stay in the village you should try to find the local inn";
    say "\t\t\tyou can search for yourself, or of course ask one of the locals where you can rest your weary head";
    say "1: Your a big adventurer, you can find it yourself";
    say "2: You just saved the day, ask for some help!";
    say "Make your choice chose 1 or 2";
    chomp ( my $choice3 = <STDIN>);
    if ($choice3 eq "1"){
        say "You begin walking around the village, taking time to admire the diverse scenery";
    } else {
        say "You see multiple villagers have begun leaving there homes to see the slain harpy.";
        say "You walk up to a Dwarven couple and ask them about a place to stay";
    }
    

}

1;