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
        solo_hunt($adventurer)
    } else {
        say "You see multiple villagers have begun leaving there homes to see the slain harpy.";
        say "You walk up to a Dwarven couple and ask them about a place to stay";
        asking_directions($adventurer)
    }

}
sub solo_hunt{
    my ($adventurer) = @_;  # Receive the Adventurer object

    say "You hear laughter and what sounds like the clanking of mugs...";
    say "So you head toward the sounds and see a large door ahead of you.";
    say "As you push open the heavy oak door, the warmth and noise of The Gilded Tankard envelops you.";
    say "The room is bustling with activity. Patrons sit at rustic tables, some engaged in lively conversation, others lost in their own thoughts.";
    say "A bard in the corner strums a lute, filling the air with a lively tune. The scent of roasting meat and spiced ale fills your nostrils.";
    say "At the bar, a burly bartender with a bushy beard and a hearty laugh is serving drinks, while a pair of young rogues whisper conspiratorially in a shadowy booth.";
    say "You can see a group of adventurers exchanging tales of their latest exploits, their voices rising in excitement.";
    say "You notice a sign above the bar that reads: 'Rumors and Revelries – Ask Old Thom for the latest gossip.'";
    say "What will you do? You can join the adventurers, chat with the barmaid, or seek out Old Thom for some interesting tidbits.";

}

sub asking_directions {
    my ($adventurer) = @_;

    say "The Dwarven couple looks at you with curious eyes. The dwarf male has a braided beard adorned with silver beads, and the female dwarf has intricate braids in her hair.";
    say "They introduce themselves as Thrain and Brynja, blacksmiths who have lived in the village for generations.";
    say "Thrain speaks in a deep, gravelly voice, 'Well met, traveler. What brings you to our village?'";

    say "1: 'I am seeking a place to rest. Can you recommend an inn?'";
    say "2: 'I am new here and would love to know more about the village.'";
    say "3: 'I'm just passing through and could use some directions.'";
    say "Make your choice: 1, 2, or 3";
    chomp(my $choice = <STDIN>);

    if ($choice eq '1') {
        say "Thrain nods and points down the road, 'You’ll want to head to The Enchanted Mug. Best ale in the village and comfortable beds. Just follow this path and you'll see the sign.'";
        say "Brynja adds with a smile, 'Tell the innkeeper Brynja sent you, and you might get a discount on your first night.'";
        enchanted_mug_path($adventurer);
    } elsif ($choice eq '2') {
        say "Thrain’s eyes light up with pride, 'Our village is known for its fine blacksmiths and vibrant marketplace. We supply armor and weapons to adventurers from all over.'";
        say "Brynja chimes in, 'And don't miss the market! Fresh produce, exotic spices, and beautiful crafts. It’s a sight to behold.'";
        market_path($adventurer);
    } elsif ($choice eq '3') {
        say "Thrain gives you a thoughtful look, 'If you're passing through, be wary of the forest to the north. There have been reports of bandits.'";
        say "Brynja nods, 'But if you follow the main road east, you’ll reach the next town by nightfall. Safe travels, adventurer.'";
        moving_on_path($adventurer);
    } else {
        say "The dwarves look at you, puzzled, 'I didn’t quite catch that. Could you repeat your choice?'";
    }
}

sub enchanted_mug_path{
    my ($adventurer) = @_;

    say "You thank Thrain and Brynja for there help and head to the Enchanted Mug as suggested.";

}

sub market_path{
    my ($adventurer) = @_;

    say "You thank Thrain and Brynja for there help and head to the Market as suggested.";
    
}


sub moving_on_path {
    my ($adventurer) = @_;

    say "You thank Thrain and Brynja for there help and head to the Market as suggested.";





}

1;


