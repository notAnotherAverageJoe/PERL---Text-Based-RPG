package Inventory;

use strict;
use warnings;
use feature 'say';


sub backpack_management{
    my ($adventurer) = @_;  # Receive the Adventurer object
    say "Would you like to check your inventory?";
    say "Type 'yes' or 'no'";
    chomp (my $choice = <STDIN>);
    $choice = lc $choice; 

    if ($choice eq 'yes' || $choice eq 'y' ){
        say "Would you like to  delete an item ? or use an item?";
        say "1. Delete item, 2. Use Item -- choose (1 or 2)";
        chomp (my $choice2 = <STDIN>);
        if ($choice2 eq "1"){
            $adventurer->backpack();
            $adventurer->use_item();

    }


    } else {
        say "nogood."
    }


}

1;