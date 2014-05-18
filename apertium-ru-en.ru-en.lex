DELIMITERS = "<.>" "<!>" "<?>" ;
SOFT-DELIMITERS = "<,>" ;

LIST BOS = (>>>) ; # Beginning of sentence
LIST EOS = (<<<) ; # End of sentence

LIST Nom = (nom);
LIST Acc = (acc);
LIST Prp = (prp); 

LIST A-LANG = ("финский") ;
LIST CARDINAL-POINT = ("север") ("запад") ("восток") ("юг") ;

SECTION


SUBSTITUTE ("в") ("в:3") ("в" pr) (1C Acc) ;
	## Он идёт в театр.

SUBSTITUTE ("на") ("на:5") ("на" pr) (1C A-LANG LINK 1 ("язык")) ;
	## Большинство населения говорит на финском языке.

SUBSTITUTE ("на") ("на:5") ("на" pr) (1C CARDINAL-POINT) (1C Prp) ;
