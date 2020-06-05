INC = -I /usr/include/ 
LIB = -L/lib/ -ltk -ltcl 

p4.exe: p4.o main.o
	gcc -o p4.exe p4.o main.o  $(LIB)

p4.o: p4.cpp
	g++ -c p4.cpp 
main.o: main.cpp
	g++ -c main.cpp 

clean:
	rm p4 p4.o
