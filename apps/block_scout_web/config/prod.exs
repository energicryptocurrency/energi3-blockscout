use Mix.Config

# For production, we often load configuration from external
# sources, such as your system environment. For this reason,
# you won't find the :http configuration below, but set inside
# BlockScoutWeb.Endpoint.init/2 when load_from_system_env is
# true. Any dynamic configuration should be done there.
#
# Don't forget to configure the url host to something meaningful,
# Phoenix uses this information when generating URLs.
#
# Finally, we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the mix phx.digest task
# which you typically run after static files are built.
config :block_scout_web, BlockScoutWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  force_ssl: false,
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  check_origin: System.get_env("CHECK_ORIGIN") == "true" || System.get_env("CHECK_ORIGIN") || false,
  http: [port: System.get_env("PORT")],
  url: [
    scheme: System.get_env("BLOCKSCOUT_PROTOCOL") || "https",
    port: System.get_env("PORT"),
    host: System.get_env("BLOCKSCOUT_HOST") || "localhost",
    path: System.get_env("NETWORK_PATH") || "/",
    api_path: System.get_env("API_PATH") || "/"
  ]

config :block_scout_web, BlockScoutWeb.Tracer, env: "production", disabled?: true

config :logger, :block_scout_web,
  level: :info,
  path: Path.absname("logs/prod/block_scout_web.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19}
