default: all

# Initialize compiler and linker flags
LDFLAGS=$(shell pkg-config fuse --libs)
CXXFLAGS=$(shell pkg-config fuse --cflags)
CCFLAGS=$(shell pkg-config fuse --cflags)

all: nullfs nul1fs nulnfs

nullfs: nullfs.o
	${CXX} -o ${@F} $^ ${LDFLAGS} 

nul1fs: nul1fs.o
	${CC} -o ${@F} $^ ${LDFLAGS} 

nulnfs: nulnfs.o
	${CC} -o ${@F} $^ ${LDFLAGS} 

%.o:%.c++
	${CXX} -c -o $@ ${CXXFLAGS} $<

%.o:%.c
	${CC} -c -o $@ ${CCFLAGS} $<

clean:
	${RM} -f *.o nullfs nul1fs nulnfs

