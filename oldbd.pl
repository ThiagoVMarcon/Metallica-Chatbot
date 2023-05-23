% DATABASE OF RESPONSES

is_greeting(X) :- 
    greeting(X).
greeting("hey").
greeting("ola").
greeting("oi").
greeting("hello").
greeting("heya").
greeting("sup").
greeting("hi").

is_same_name_of_album(X) :-
    album_name(X).
album_name("kill").
album_name("ride").
album_name("master").
album_name("and").
album_name("st").


% esta_no_dicionario(X).

responses(1, X, [X, "is pretty cool! Have you ever heard of", Y]) :- random_between(1,5,R1),random_between(3,8,R2),album(R1,A,_,_,_),music(R2,Y,A,_,_).
responses(2, X, [X, "is pretty bad... Have you ever heard of", Y]) :- random_between(1,5,R1),random_between(3,8,R2),album(R1,A,_,_,_),music(R2,Y,A,_,_).
responses(3, X, [X, "is great! My favorite song from the album is", Y]) :- random_between(1,8,R), music(R,Y,X,_,_).
responses(4, X, [X, "is ok... I would rather listen to", Y, "though"]) :- random_between(1,8,R), album(R,Y,_,_,_).


% DATABASE OF FACTS 

% Albums: 

% KILL EM ALL

album(1, "Kill 'Em All", "first studio album", "1983", "51:20").
music(1, "Hit the Lights", "Kill 'Em All", "Hetfield, Ulrich", "4:15").
music(2, "The Four Horsemen", "Kill 'Em All", "Hetfield, Ulrich, Mustaine", "7:12").
music(3, "Motorbreath", "Kill 'Em All",	"Hetfield",	"3:07").
music(4, "Jump in the Fire", "Kill 'Em All", "Hetfield, Ulrich, Mustaine", "4:41").
music(5, "(Anesthesia) Pulling Teeth", "Kill 'Em All", "Burton", "4:14").
music(6, "Whiplash", "Kill 'Em All", "Hetfield, Ulrich", "4:08").
music(7, "Phantom Lord", "Kill 'Em All", "Hetfield, Ulrich, Mustaine", "5:01").
music(8, "No Remorse", "Kill 'Em All", "Hetfield, Ulrich", "6:26").
music(9, "Seek & Destroy", "Kill 'Em All", "Hetfield, Ulrich", "6:54").
music(10, "Metal Militia", "Kill 'Em All", "Hetfield, Ulrich, Mustaine", "5:11").

% RIDE THE LIGHTNING

album(2, "Ride the Lightning", "second studio album", "1984", "47:25").
music(1, "Fight Fire with Fire", "Ride the Lightning", "Hetfield, Ulrich, Burton", "4:44").
music(2, "Ride the Lightning", "Ride the Lightning", "Hetfield, Ulrich, Burton, Mustaine", "6:36").
music(3, "For Whom the Bell Tolls", "Ride the Lightning", "Hetfield, Ulrich, Burton", "5:09").
music(4, "Fade to Black", "Ride the Lightning", "Hetfield, Ulrich, Burton, Hammett", "6:57").
music(5, "Trapped Under Ice", "Ride the Lightning", "Hetfield, Ulrich, Hammett", "4:04").
music(6, "Escape", "Ride the Lightning", "Hetfield, Ulrich, Hammett", "4:24").
music(7, "Creeping Death", "Ride the Lightning", "Hetfield, Ulrich, Burton, Hammett", "6:36").
music(8, "The Call of Ktulu", "Ride the Lightning", "Hetfield, Ulrich, Burton, Mustaine", "8:53").

% MASTER OF PUPPETS

album(3, "Master of Puppets", "third album", "1986", "54:47").
music(1, "Battery", "Master of Puppets", "Hetfield, Ulrich", "5:12").
music(2, "Master of Puppets", "Master of Puppets", "Hetfield, Ulrich, Burton, Hammett",	"8:36").
music(3, "The Thing That Should Not Be", "Master of Puppets","Hetfield, Ulrich, Hammett", "6:37").
music(4, "Welcome Home (Sanitarium)", "Master of Puppets", "Hetfield, Ulrich, Hammett", "6:27").
music(5, "Disposable Heroes", "Master of Puppets", "Hetfield, Ulrich, Hammett", "8:17").
music(6, "Leper Messiah", "Master of Puppets", "Hetfield, Ulrich", "5:40").
music(7, "Orion", "Master of Puppets", "Burton, Hetfield, Ulrich", "8:28").
music(8, "Damage, Inc.", "Master of Puppets", "Hetfield, Ulrich, Burton, Hammett", "5:29").

$ ...AND JUSTICE FOR ALL

album(4, "And Justice For All", "fourth album", "1988", "65:33").
music(1, "Blackened", "And Justice For All", "Hetfield, Ulrich, Newsted", "6:41").
music(2, "And Justice for All", "And Justice For All", "Hetfield, Ulrich, Hammett", "9:47"). 
music(3, "Eye of the Beholder", "And Justice For All", "Hetfield, Ulrich, Hammett", "6:30").
music(4, "One", "And Justice For All", "Hetfield, Ulrich", "7:26").
music(5, "The Shortest Straw", "And Justice For All", "Hetfield, Ulrich", "6:36").
music(6, "Harvester of Sorrow", "And Justice For All", "Hetfield, Ulrich", "5:46"). 
music(7, "The Frayed Ends of Sanity", "And Justice For All", "Hetfield, Ulrich, Hammett", "7:44"). 
music(8, "To Live Is to Die", "And Justice For All", "Hetfield, Ulrich, Burton", "9:49").  
music(9, "Dyers Eve", "And Justice For All", "Hetfield, Ulrich, Hammett", "5:13").		

% METALLICA (THE BLACK ALBUM)

album(5, "Metallica", "fifth studio album", "1991", "62:31").
music(1, "Enter Sandman", "Metallica", "Hetfield, Ulrich, Hammett", "5:31").
music(2, "Sad but True", "Metallica", "Hetfield, Ulrich", "5:23").
music(3, "Holier Than Thou", "Metallica", "Hetfield, Ulrich", "3:48").
music(4, "The Unforgiven", "Metallica", "Hetfield, Ulrich, Hammett", "6:27").
music(5, "Wherever I May Roam", "Metallica", "Hetfield, Ulrich", "6:46").
music(6, "Don't Tread on Me", "Metallica", "Hetfield, Ulrich", "4:01").
music(7, "Through the Never", "Metallica", "Hetfield, Ulrich, Hammett", "4:03").
music(8, "Nothing Else Matters", "Metallica", "Hetfield, Ulrich", "6:29").
music(9, "Of Wolf and Man", "Metallica", "Hetfield, Ulrich, Hammett", "4:17").
music(10, "The God That Failed", "Metallica", "Hetfield, Ulrich", "5:05").
music(11, "My Friend of Misery", "Metallica", "Newsted, Hetfield, Ulrich", "6:50").
music(12, "The Struggle Within", "Metallica", "Hetfield, Ulrich", "3:54").

% LOAD

album(6, "Load", "sixth studio album", "1996", "1:17:56").
music(1, "Ain't My Bitch", "Load", "Hetfield, Ulrich", "5:04").
music(1, "2 X 4", "Load", "Hetfield, Ulrich, Hammet", "5:28").
music(1, "The House Jack Built", "Load", "Hetfield, Ulrich, Hammet", "6:39").
music(1, "Until It Sleeps", "Load", "Hetfield, Ulrich", "4:30").
music(1, "King Nothing", "Load",  "Hetfield, Ulrich, Hammet", "5:28").
music(1, "Hero of the Day", "Load", "Hetfield, Ulrich, Hammet", "4:22").
music(1, "Bleeding Me", "Load", "Hetfield, Ulrich, Hammet", "8:18").
music(1, "Cure", "Load", "Hetfield, Ulrich", "4:54").
music(1, "Poor Twisted Me", "Load", "Hetfield, Ulrich", "4:00").
music(1, "Wasting My Hate", "Load", "Hetfield, Ulrich, Hammet", "3:57").
music(1, "Mama Said", "Load", "Hetfield, Ulrich", "5:19").
music(1, "Thorn Within", "Load", "Hetfield, Ulrich, Hammet", "5:51").
music(1, "Ronnie", "Load", "Hetfield, Ulrich", "5:17").
music(1, "The Outlaw Torn", "Load",  "Hetfield, Ulrich", "9:52").

% RELOAD

album(7, "ReLoad", "seventh album", "1997", "1:15:56").

music(1, "Fuel", "Hetfield, Ulrich, Hammett", "4:29").
music(2, "The Memory Remains", "Hetfield, Ulrich", "4:39").
music(3, "Devil's Dance", "Hetfield, Ulrich", "5:18").
music(4, "The Unforgiven II", "Hetfield, Ulrich, Hammett", "6:36").
music(5, "Better than You",  "Hetfield, Ulrich", "5:21").
music(6, "Slither", "Hetfield, Ulrich, Hammett", "5:13").
music(7, "Carpe Diem Baby", "Hetfield, Ulrich, Hammett", "6:12").
music(8, "Bad Seed", "Hetfield, Ulrich, Hammett", "4:05").
music(9, "Where The Wild Things Are", "Hetfield, Ulrich, Newsted", "6:52").
music(10, "Prince Charming", "Hetfield, Ulrich", "6:04").
music(11, "Low Man's Lyric", "Hetfield, Ulrich", "7:36").
music(12, "Attitude", "Hetfield, Ulrich", "5:16").
music(13, "Fixxxer", "Hetfield, Ulrich, Hammett", "8:14").

% ST ANGER

album(8, "St Anger", "eighth studio album", "2003", "75:04").
music(1,"Frantic", "Hetfield, Ulrich, Hammett, Rock", "5:50").
music(2,"St. Anger", "Hetfield, Ulrich, Hammett, Rock", "7:21").
music(3,"Some Kind of Monster", "Hetfield, Ulrich, Hammett, Rock", "8:25").
music(4,"Dirty Window", "Hetfield, Ulrich, Hammett, Rock", "5:25").
music(5,"Invisible Kid", "Hetfield, Ulrich, Hammett, Rock",	"8:30").
music(6,"My World", "Hetfield, Ulrich, Hammett, Rock", "5:46").
music(7,"Shoot Me Again", "Hetfield, Ulrich, Hammett, Rock", "7:10").
music(8,"Sweet Amber", "Hetfield, Ulrich, Hammett, Rock", "5:27").
music(9,"The Unnamed Feeling", "Hetfield, Ulrich, Hammett, Rock", "7:08").
music(10,"Purify", "Hetfield, Ulrich, Hammett, Rock", "5:14").
music(11,"All Within My Hands", "Hetfield, Ulrich, Hammett, Rock", "8:48").

# Death Magnetic, ninth studio album, 2008

# All lyrics are written by James Hetfield; all music were composed by James Hetfield, Lars Ulrich, Kirk Hammett and Robert Trujillo.

# 1.	"That Was Just Your Life"	                                         7:08
# 2.	"The End of the Line"	                                             7:52
# 3.	"Broken, Beat & Scarred"	                                         6:25
# 4.	"The Day That Never Comes"	                                         7:56
# 5.	"All Nightmare Long"	                                             7:58
# 6.	"Cyanide"	                                                         6:40
# 7.	"The Unforgiven III"	                                             7:47
# 8.	"The Judas Kiss"	                                                 8:01
# 9.	"Suicide & Redemption" (instrumental)	                             9:58
# 10.	"My Apocalypse"	5:01
# Total length:	74:46

# ------------------------------------------------------------------------------

# Hardwired... to Self-Destruct, tenth studio album, 2016

# All tracks are written by James Hetfield and Lars Ulrich, except "ManUNkind", written by Hetfield, Ulrich and Robert Trujillo.

# Disc one
# 1.	"Hardwired"	                                                          3:09
# 2.	"Atlas, Rise!"	                                                      6:28
# 3.	"Now That We're Dead"	                                              6:59
# 4.	"Moth into Flame"	                                                  5:50
# 5.	"Dream No More"	                                                      6:29
# 6.	"Halo on Fire"              	                                      8:15
# Disc two
# 7.	"Confusion"	                                                          6:43
# 8.	"ManUNkind"	                                                          6:55
# 9.	"Here Comes Revenge"	                                              7:17
# 10.	"Am I Savage?"	                                                      6:30    
# 11.	"Murder One"	                                                      5:45
# 12.	"Spit Out the Bone"	                                                  7:09
# Total length:	77:42

# ------------------------------------------------------------------------------

# 72 seasons, eleventh studio album, 2023

# 1.	"72 Seasons" 	            James HetfieldLars, UlrichKirk Hammett 	  7:39
# 2.	"Shadows Follow"            Hetfield, Ulrich 	                      6:12
# 3.	"Screaming Suicide"         Hetfield, Ulrich, Robert Trujillo	      5:30
# 4.	"Sleepwalk My Life Away"    Hetfield, Ulrich, Trujillo	              6:56
# 5.	"You Must Burn!"            Hetfield, Ulrich, Trujillo	              7:03
# 6.	"Lux Æterna"                Hetfield, Ulrich	                      3:22
# 7.	"Crown of Barbed Wire"      Hetfield, Ulrich, Hammett	              5:49
# 8.	"Chasing Light"             Hetfield, Ulrich, Hammett	              6:45
# 9.	"If Darkness Had a Son"     Hetfield, Ulrich, Hammett	              6:36
# 10.	"Too Far Gone?"             Hetfield, Ulrich	                      4:34
# 11.	"Room of Mirrors"           Hetfield, Ulrich	                      5:34
# 12.	"Inamorata"                 Hetfield, Ulrich	                      11:10
# Total length: 77:10



