CC=g++ #using C++ compiler
FLAGS= -g -Wall  #-g includes debuggin information, -Wall enables all compiler warning

all: server # when make is run without target, server is build as target by default

server: proxy_server_with_cache.c #target depends on this file 
#using compiler to use C++ compiler and flags, lpthread link pthread library
	$(CC) $(FLAGS) -o proxy_parse.o -c proxy_parse.c -lpthread
	$(CC) $(FLAGS) -o server.o -c proxy_server_with_cache.c -lpthread
	$(CC) $(FLAGS) -o server proxy_parse.o server.o -lpthread

clean:
#force removing object files
	rm -f server*.o

tar:
#created compressed file of the selected files of project
	tar -cvzf MultithreadedProxyServer.tgz proxy_server_with_cache.c README.md Makefile proxy_parse.c proxy_parse.h
