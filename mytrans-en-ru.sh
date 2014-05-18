echo $1 | lt-proc en-ru.automorf.bin | apertium-tagger -g en-ru.prob | apertium-pretransfer |  apertium-transfer -t apertium-ru-en.en-ru.t1x en-ru.t1x.bin en-ru.autobil.bin | lt-proc -g en-ru.autogen.bin

