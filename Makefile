# INCLUDE = -Icpp/ -Icpp/lib

# all: build

# build:
# 	em++ --bind bindings/SampleBindings.cpp ${INCLUDE} cpp/*.cpp cpp/lib/*.cpp -s WASM=1 -s MODULARIZE=1 -o Sample.js

# CONFIGURANDO FLAGS COMPILADOR
CXX           = em++
CC            = emcc

INCLUDE       = -Icpp -Icpp/lib
DECLARE       = 

CFLAGS	      = -O0 -g -Wall ${INCLUDE} ${DECLARE}
CXXFLAGS	  = -O0 -g -Wall ${INCLUDE} ${DECLARE} 
LDFLAGS 	  = 

# DEFININDO NOME LIB 'python' E 'exe'
app           = Sample.js

# LENDO ARQUIVOS
src           = $(wildcard cpp/*.c*)
lib           = $(wildcard cpp/lib/*.c*)
bind          = $(wildcard bindings/*.c*)

# AJUSTANDO 'src' E 'obj'
obj           = $(addsuffix .o,$(basename $(src:cpp/%=obj/%)))
obj          += $(addsuffix .o,$(basename $(lib:cpp/lib/%=obj/%)))
obj          += $(addsuffix .o,$(basename $(bind:bindings/%=obj/%)))

# LEIS DE COMPILACAO
all: ${app}

r: run

p: 
	@echo -----------------------------
	@echo ${src}
	@echo -----------------------------
	@echo ${obj}
	@echo -----------------------------

# COMPILACAO 'app {exe}'
${app}: ${obj}
	$(CXX) --bind ${obj} -s WASM=1 -s MODULARIZE=1 -o Sample.js

# ESCREVENDO '*.o' EM 'obj'
obj/%.o : cpp/%.cpp
	$(CXX) ${CXXFLAGS} -o $@ -c $<

obj/%.o : cpp/lib/%.cpp
	$(CXX) ${CXXFLAGS} -o $@ -c $<

obj/%.o : bindings/%.cpp
	$(CXX) ${CXXFLAGS} -o $@ -c $<

# MONITORANDO ALTERACOES '.h' IMPORTANTES
# obj/teste.o : src/teste.h

# INICIALIZANDO PASTAS
clean:
	del obj/*