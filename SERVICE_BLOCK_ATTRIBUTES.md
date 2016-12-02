static const struct attribute service_attributes[] =
{
   { "protocol",       A_PROTOCOL,       1,  protocol_parser        },
   { "wait",           A_WAIT,           1,  wait_parser            },
   { "user",           A_USER,           1,  user_parser            },
   { "group",          A_GROUP,          1,  group_parser           },
   { "server",         A_SERVER,         1,  server_parser          },
   { "server_args",    A_SERVER_ARGS,   -1,  server_args_parser     },
   { "instances",      A_INSTANCES,      1,  instances_parser       },
   { "log_on_success", A_LOG_ON_SUCCESS,-2,  log_on_success_parser  },
   { "log_on_failure", A_LOG_ON_FAILURE,-2,  log_on_failure_parser  },
   { "log_type",       A_LOG_TYPE,      -1,  log_type_parser        },
   { "only_from",      A_ONLY_FROM,     -2,  only_from_parser       },
   { "no_access",      A_NO_ACCESS,     -2,  no_access_parser       },
   { "access_times",   A_ACCESS_TIMES,  -1,  access_times_parser    },
   { "type",           A_TYPE,          -1,  type_parser            },
#ifndef NO_RPC
   { "rpc_version",    A_RPC_VERSION,    1,  rpc_version_parser     },
   { "rpc_number",     A_RPC_NUMBER,     1,  rpc_number_parser      },
#endif
   { "id",             A_ID,             1,  id_parser              },
   { "env",            A_ENV,           -2,  env_parser             },
   { "port",           A_PORT,           1,  port_parser            },
   { "passenv",        A_PASSENV,       -2,  passenv_parser         },
   { "flags",          A_FLAGS,         -1,  flags_parser           },
   { "nice",           A_NICE,           1,  nice_parser            },
   { "redirect",       A_REDIR,          2,  redir_parser           },
   { "banner",         A_BANNER,         1,  banner_parser          },
   { "bind",           A_BIND,           1,  bind_parser            },
   { "interface",      A_BIND,           1,  bind_parser            },
   { "per_source",     A_PER_SOURCE,     1,  per_source_parser      },
   { "groups",         A_GROUPS,         1,  groups_parser          },
   { "banner_success", A_BANNER_SUCCESS, 1,  banner_success_parser  },
   { "banner_fail",    A_BANNER_FAIL,    1,  banner_fail_parser     },
   { "cps",            A_CPS,            2,  cps_parser             },
   { "disable",        A_SVCDISABLE,     1,  svcdisable_parser      },
#ifdef HAVE_LOADAVG
   { "max_load",       A_MAX_LOAD,       1,  max_load_parser        },
#endif
#ifdef RLIMIT_AS
   { "rlimit_as",      A_RLIMIT_AS,      1,  rlim_as_parser         },
#endif
#ifdef RLIMIT_CPU
   { "rlimit_cpu",     A_RLIMIT_CPU,     1,  rlim_cpu_parser        },
#endif
#ifdef RLIMIT_DATA
   { "rlimit_data",    A_RLIMIT_DATA,    1,  rlim_data_parser       },
#endif
#ifdef RLIMIT_RSS
   { "rlimit_rss",     A_RLIMIT_RSS,     1,  rlim_rss_parser        },
#endif
#ifdef RLIMIT_STACK
   { "rlimit_stack",   A_RLIMIT_STACK,   1,  rlim_stack_parser      },
#endif
   { "v6only",         A_V6ONLY,         1,  v6only_parser          },
   { "deny_time",      A_DENY_TIME,      1,  deny_time_parser       },
   { "umask",          A_UMASK,          1,  umask_parser           },
#ifdef HAVE_MDNS
   { "mdns",           A_MDNS,           1,  mdns_parser            },
#endif
#ifdef LIBWRAP
   { "libwrap",        A_LIBWRAP,        1, libwrap_parser          },
