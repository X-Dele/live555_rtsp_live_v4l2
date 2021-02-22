INCLUDES 	 = -I/usr/local/include/liveMedia -I/usr/local/include/UsageEnvironment -I/usr/local/include/groupsock -I/usr/local/include/BasicUsageEnvironment -I/usr/local/include -I./include/encoder
LIVE555_LIBS =  -lliveMedia -lgroupsock -lBasicUsageEnvironment -lUsageEnvironment -lssl -lcrypto
X264_LIBS 	 =  -lx264 /usr/local/lib/libx264.so.161
LIBS         =  $(LIVE555_LIBS) $(X264_LIBS)

COMPILE_OPTS =      $(INCLUDES) -I. -O2 -DSOCKLEN_T=socklen_t -D_LARGEFILE_SOURCE=1 -D_FILE_OFFSET_BITS=64 -g
C 			 =         c
C_COMPILER   =        cc
C_FLAGS 	 =       $(COMPILE_OPTS) $(CPPFLAGS) $(CFLAGS)
CPP 		 =           cpp
CPLUSPLUS_COMPILER =    c++
CPLUSPLUS_FLAGS =   $(COMPILE_OPTS) -Wall -DBSD=1 $(CPPFLAGS) $(CXXFLAGS)
OBJ 		 =           o
LINK 		 =  c++ -o
LINK_OPTS    =  -ldl  -lm -lpthread -ldl -g
CONSOLE_LINK_OPTS = $(LINK_OPTS)
LINK_OBJ	 = H264FramedLiveSource.o H264VideoStreamer.o

APP = H264VideoStreamer

.$(C).$(OBJ):
	$(C_COMPILER) -c $(C_FLAGS) $<
.$(CPP).$(OBJ):
	$(CPLUSPLUS_COMPILER) -c $(CPLUSPLUS_FLAGS) $<

$(APP): $(LINK_OBJ)
	$(LINK)$@  $(LINK_OBJ)  $(LIBS) $(CONSOLE_LINK_OPTS)
	
clean:
	-rm -rf *.$(OBJ) $(APP) core *.core *~ include/*~

