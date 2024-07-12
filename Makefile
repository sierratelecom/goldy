
CFLAGS ?= -g
WARNING_CFLAGS ?= -Wall -W -Wdeclaration-after-statement
LDFLAGS ?=

LOCAL_CFLAGS = $(WARNING_CFLAGS) -D_FILE_OFFSET_BITS=64
LOCAL_LDFLAGS = -lm

LOCAL_LDFLAGS += -lmbedtls
LOCAL_LDFLAGS += -lmbedx509
LOCAL_LDFLAGS += -lmbedcrypto
LOCAL_LDFLAGS += -lev

ifdef DEBUG
LOCAL_CFLAGS += -g3
endif
LOCAL_CFLAGS += -DMBEDTLS_ALLOW_PRIVATE_ACCESS

COMPILE=$(QUIET_CC) $(CC) $(LOCAL_CFLAGS) $(CFLAGS)
LINK=$(QUIET_LINK) $(CC)

ifndef V
QUIET_CC   = @echo "  CC    $@" 1>&2;
QUIET_LINK = @echo "  LINK  $@" 1>&2;
endif

APP = goldy
OBJS = goldy.o daemonize.o log.o

.PHONY: all clean

all: $(APP)

$(APP): $(OBJS)
	$(LINK) -o $@ $^ $(LOCAL_LDFLAGS) $(LDFLAGS)

%.o: %.c
	$(COMPILE) -o $@ -c $<

clean:
	rm -f $(APP) $(OBJS) $(TEST_APPS) $(TEST_OBJS)

