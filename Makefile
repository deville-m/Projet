TARGET=run.byte
CC=ocamlbuild -use-ocamlfind

all: $(TARGET)

$(TARGET): force 
	ocamlbuild $@ 

clean:
	ocamlbuild -clean

run: $(TARGET)
	./$(TARGET)

force:

.PHONY: all clean run force
