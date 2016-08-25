
CC = g++ -O3
CFLAGS = -g -Wall  -I.
LDFLAGS = -lpthread -L. -lrobotlib

all: 
	@mkdir -p bin
	@echo "Linking all objects to ./bin/example_vrep"
	@$(CC) $(CFLAGS) example_vrep.cpp -o ./bin/vrep $(LDFLAGS)	
	@echo "Linking all objects to ./bin/example_dynamixel"
	@$(CC) $(CFLAGS) example_dynamixel.cpp -o ./bin/dynamixel $(LDFLAGS)

dynamixel: 
	./bin/dynamixel

vrep:
	./bin/vrep

clean:
	@rm -f *.o
	@rm -f -R ./bin
	@rm -f -R ./error_files
