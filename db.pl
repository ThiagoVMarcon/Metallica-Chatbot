% DATABASE

% auxiliar functions

is_greeting(X) :- greeting(X).
greeting("hi").
greeting("hello").
greeting("hey").
greeting("heya").
greeting("sup").
greeting("yo").

% esta_no_dicionario(X).

responses(1, X, [X, "is pretty cool! Have you ever heard of", Y]) :- random_between(1,5,R1),random_between(1,7,R2),album(R1,A,_,_,_),music(R2,Y,A,_,_).
responses(2, X, [X, "is pretty bad... Have you ever heard of", Y]) :- random_between(1,5,R1),random_between(1,7,R2),album(R1,A,_,_,_),music(R2,Y,A,_,_).
responses(3, X, [X, "is great! My favorite song from the album is", Y]) :- random_between(1,8,R), music(R,Y,X,_,_).
responses(4, X, [X, "is ok... I would rather listen to", Y, "though"]) :- random_between(1,8,R), album(R,Y,_,_,_).


% patterns

process_pattern(["are","you","called","cliff?"], ["Yep!"]).
process_pattern(["is","your","name","cliff?"], ["Yep!"]).
process_pattern([X, "cliff"],["Hey there!"]) :- is_greeting(X).
process_pattern([X|_],["Hey there!"]) :- is_greeting(X).
process_pattern(["i'm", X, "what","is","your","name"|_],["Hey", X, "My name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_pattern(["i'm","called",X, "what","is","your","name"|_],["Hey", X, "My name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_pattern(["i","am", X, "what","is","your","name"|_],["Hey", X, "My name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_pattern(["i","am","called",X, "what","is","your","name"|_],["Hey", X, "My name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_pattern(["like",X|_],["Do you mean the album or the song? Either case I think they are both pretty great!"]) :- same_name_album_song(X).
process_pattern(["like", "the", X|_],Y) :- compare_music2(X,X2),random_between(1,2,R), responses(R, X2, Y).
process_pattern(["like", X|_],Y) :- compare_music(X,X2),random_between(1,2,R), responses(R, X2, Y).
process_pattern(["like", X|_],Y) :- compare_album(X,X2),random_between(3,4,R), responses(R, X2, Y).
process_pattern(["what","is","your","name"|_], ["My name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_pattern(["what","year",_,"metallica"|_], ["Metallica was created in 1981, in Los Angeles."]).
process_pattern(["what","year",_,"the","band"|_], ["Metallica was formed in 1981, in Los Angeles."]).
process_pattern(["what","is","your","favorite","album"|_],["My favorite album is Master of Puppets but I really like", X, "too"]) :- random_between(1,2,A), album(A,X,_,_,_). % albus favoritos
process_pattern(["what","is","your","favorite", "music"|_], ["My favorite music is Fade to Black but I really like", X , "aswell"]) :- random_between(1,5,R1),random_between(1,7,R2),album(R1,A,_,_,_),music(R2,X,A,_,_).
process_pattern(["how","many", "albums"|_], ["Metallica has released a total of 11 studio albums.","\n", "foi"]). % quantos albuns
process_pattern(["what","year","is",X|_], [Y,"is","from",Z,"!"]) :- compare_album(X,Y), album(_,Y,_,Z,_).% ano de lançamentos do album
process_pattern(["who","is", "the", "vocalist"|_], ["James Hetfield is the current and only vocalist that Metallica has ever had."]). % vocalista
process_pattern(["who","is", "the", "drummer"|_], ["Lars Ulrich is the current and only drummer that Metallica has ever had."]). % baterista
process_pattern(["who","is", "the", "bassist"|_], ["Robert Trujillo is the current bassist of Metallica."]). % baixista
process_pattern(["who","is", "the", "guitarist"|_], ["Metallica has two guitarists, James Hetfield (rhythm) and Kirk Hammett (lead)."]). % guitar
process_pattern(["who","are", "the", "guitarists"|_], ["Metallica has two guitarists, James Hetfield (rhythm) and Kirk Hammett (lead)."]). % guitar
process_pattern(["what","is","the","shortest","album"|_],["It","is","Ride The Lightning","which","has","Trapped Under Eyes","as","its","shortest","song"]). % album mais curto
process_pattern(["what","is","the","shortest","music"|_],["It","is","Motorbreath","which","is","the","third","song","from","Metallicas", "first","album!"]). % musica mais curta
process_pattern(["what","is","the","longest", "music"|_],["It","is","Inamorata","which","is","the","final","song","from","Metallicas", "latest","album!"]).% musicas mais longas
process_pattern(["what","is","the","longest","album"|_],["It","is","Load","which","has","The Outlaw Torn","as","its","longest","song"]).% albuns mais longos
process_pattern(["what","do","you","think","about","metallica", "after","black"|_],["Metallica created a whole genre of music, Thrash Metal, and then walked away from it in 1990 because of greed. Some ppl say to me get over it blah blah blah but music to me is after family and friends. I loath anyone who turns their back on a legion of fans and a genre of music and walk away because of greed. They were not poor when they released the black album, they were just greedy. Sad."]). % voce acha que o metalica se vendeu no black album, oque voce acha do black album
process_pattern([_|Resto],Y) :- process_pattern(Resto,Y).
process_pattern([],["Sorry","couldn't","quite","catch","you","man"]).


same_name_album_song(X) :- album_name(X).
album_name("kill").
album_name("ride").
album_name("master").
album_name("and").
album_name("st").
album_name("72").


% ALBUMS: 

% KILL EM ALL

album(1, "Kill Em All", "first studio album", "1983", "51:20").
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

album(7, "Reload", "seventh album", "1997", "1:15:56").

music(1, "Fuel", "Reload", "Hetfield, Ulrich, Hammett", "4:29").
music(2, "The Memory Remains", "Reload", "Hetfield, Ulrich", "4:39").
music(3, "Devil's Dance", "Reload", "Hetfield, Ulrich", "5:18").
music(4, "The Unforgiven II", "Reload", "Hetfield, Ulrich, Hammett", "6:36").
music(5, "Better than You", "Reload", "Hetfield, Ulrich", "5:21").
music(6, "Slither", "Reload", "Hetfield, Ulrich, Hammett", "5:13").
music(7, "Carpe Diem Baby", "Reload", "Hetfield, Ulrich, Hammett", "6:12").
music(8, "Bad Seed", "Reload", "Hetfield, Ulrich, Hammett", "4:05").
music(9, "Where The Wild Things Are", "Reload", "Hetfield, Ulrich, Newsted", "6:52").
music(10, "Prince Charming", "Reload", "Hetfield, Ulrich", "6:04").
music(11, "Low Man's Lyric", "Reload", "Hetfield, Ulrich", "7:36").
music(12, "Attitude", "Reload", "Hetfield, Ulrich", "5:16").
music(13, "Fixxxer", "Reload", "Hetfield, Ulrich, Hammett", "8:14").

% ST ANGER

album(8, "St Anger", "eighth studio album", "2003", "75:04").
music(1,"Frantic", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "5:50").
music(2,"St. Anger", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "7:21").
music(3,"Some Kind of Monster", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "8:25").
music(4,"Dirty Window", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "5:25").
music(5,"Invisible Kid", "St Anger", "Hetfield, Ulrich, Hammett, Rock",	"8:30").
music(6,"My World", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "5:46").
music(7,"Shoot Me Again", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "7:10").
music(8,"Sweet Amber", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "5:27").
music(9,"The Unnamed Feeling", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "7:08").
music(10,"Purify", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "5:14").
music(11,"All Within My Hands", "St Anger", "Hetfield, Ulrich, Hammett, Rock", "8:48").

% DEATH MAGNETIC

album(9, "Death Magnetic", "ninth studio album", "2008", "74:46").
music(1, "That Was Just Your Life", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "7:08").
music(2, "The End of the Line", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "7:52").
music(3, "Broken, Beat & Scarred", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "6:25").
music(4, "The Day That Never Comes", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "7:56").
music(5, "All Nightmare Long", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "7:58").
music(6, "Cyanide", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "6:40").
music(7, "The Unforgiven III", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "7:47").
music(8, "The Judas Kiss", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "8:01").
music(9, "Suicide & Redemption", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "9:58").
music(10, "My Apocalypse", "Death Magnetic", "Hetfield, Ulrich, Hammett, Trujillo", "5:01").

% HARDWIRED... TO SELF-DESTRUCT 

album(10, "Hardwired to Self-Destruct", "tenth studio album", "2016", "77:42").
music(1, "Atlas, Rise!", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "6:28").
music(2, "Now That We're Dead", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "6:59").
music(3, "Hardwired", "Hardwired to Self-Destruct", "Hetfield, Ulrich","3:09").
music(4, "Moth into Flame", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "5:50").
music(5, "Dream No More", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "6:29").
music(6, "Halo on Fire", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "8:15").
music(7, "Confusion", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "6:43").
music(8, "ManUNkind", "Hardwired to Self-Destruct", "Hetfield, Ulrich, Trujillo", "6:55").
music(9, "Here Comes Revenge", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "7:17").
music(10, "Am I Savage?", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "6:30").    
music(11, "Murder One", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "5:45").
music(12, "Spit Out the Bone", "Hardwired to Self-Destruct", "Hetfield, Ulrich", "7:09").

% 72 SEASONS

album(11, "72 seasons", "eleventh studio album", "2023", "77:10").
music(1, "72 Seasons", "72 Seasons", "Hetfield, Ulrich, Hammett", "7:39").
music(2, "Shadows Follow", "72 Seasons", "Hetfield, Ulrich", "6:12").
music(3, "Screaming Suicide", "72 Seasons", "Hetfield, Ulrich, Trujillo", "5:30").
music(4, "Sleepwalk My Life Away", "72 Seasons", "Hetfield, Ulrich, Trujillo", "6:56").
music(5, "You Must Burn!", "72 Seasons", "Hetfield, Ulrich, Trujillo", "7:03").
music(6, "Lux AEterna", "72 Seasons", "Hetfield, Ulrich", "3:22").
music(7, "Crown of Barbed Wire", "72 Seasons", "Hetfield, Ulrich, Hammett", "5:49").
music(8, "Chasing Light", "72 Seasons", "Hetfield, Ulrich, Hammett", "6:45").
music(9, "If Darkness Had a Son", "72 Seasons", "Hetfield, Ulrich, Hammett", "6:36").
music(10, "Too Far Gone?", "72 Seasons", "Hetfield, Ulrich", "4:34").
music(11, "Room of Mirrors", "72 Seasons", "Hetfield, Ulrich", "5:34").
music(12, "Inamorata", "72 Seasons", "Hetfield, Ulrich", "11:10").


% ideas

% linha de bateria
% ||  || guitarra
% ||  || baixo
% vocalista  
% quem eh Dave Mustaine 
% oque voce acha dos ultimos albuns do metalica 
% opiniao sobre sobre todos os membro
% adicionar idades dos integrantes
% quais são todos os albuns
% tamanho de todos os albuns
% ano de todos os albuns
% % % % quem sao os membros atuais
% musicas instrumentais