#ifndef _GOLDY_H_
#define _GOLDY_H_

#define GOLDY_VERSION "0.3"
#define GOLDY_DAEMON_USER "goldy"

#define DEFAULT_SESSION_TIMEOUT 1000

struct instance {
  char *listen_host;
  char *listen_port;
  char *backend_host;
  char *backend_port;
  char *cert_file;
  char *private_key_file;
  char *root_ca_file;
  int daemonize;
  int session_timeout;          /* in seconds */
};

#endif
