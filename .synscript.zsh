# Synergy server wrapper.
#
# Usage:
#   synserver up
#       Start a new synergy server instance using my default config.
#   synserver up path/to/alt/config/file.conf
#       Start a new synergy server instance using a custom config.
#   synserver kill
#       Kill all synergy server processes owned by me.
#   synserver
#       Return all synergy server process ids owned by me.

synserver () {
  case $1 in
    up)
      # Use supplied config file path, falling back on default.
      SYNERGY_SERVER_CONFIG="${2:-$HOME/.synergy.conf}"

      # Kill existing synergy servers, if any.
      synserver kill

      # Start synergy server and point it at config.
      echo "Starting synergy server with $SYNERGY_SERVER_CONFIG."
      ~/projects/synergy-core/build/bin/synergys -c $SYNERGY_SERVER_CONFIG
      ;;

    kill)
      pkill -u $(whoami) synergys
      ;;

    *)
      pgrep -u $(whoami) synergys
      ;;
  esac
}

# Synergy client wrapper.
#
# Usage:
#   synclient up
#       Start a new synergy client instance using my default server (SYNERGY_SERVER).
#   synclient up server
#       Start a new synergy client instance using a custom server address.
#   synclient kill
#       Kill all synergy client processes owned by me.
#   synclient
#       Return all synergy client process ids owned by me.

synclient () {
  case $1 in
    up)
      # Kill existing synergy clients, if any.
      synclient kill

      # Use supplied server, falling back on default set in .zshrc file.
      local SUPPLIED_SERVER_ID="${2:-$SYNERGY_SERVER}"
      local SUPPLIED_SERVER_ID_SUFFIX=""

      # Calculate server IP (sending stderr to /dev/null, so if an IP is
      # provided, then this var will be empty).
      local CALCULATED_SERVER_IP="$(resolveip -s $SUPPLIED_SERVER_ID 2> /dev/null)"

      # Define suffix for message if calculated IP is not empty.
      if [[ ! -z "$CALCULATED_SERVER_IP" ]];
      then
        SUPPLIED_SERVER_ID_SUFFIX=" ($CALCULATED_SERVER_IP)"
      fi

      # Start synergy client and point it at server IP, falling back to
      # supplied server (which may be an IP or hostname).
      echo "Starting synergy client pointed at $SUPPLIED_SERVER_ID$SUPPLIED_SERVER_ID_SUFFIX."
      ~/projects/synergy-core/build/bin/synergyc "${CALCULATED_SERVER_IP:-$SUPPLIED_SERVER_ID}"
      ;;

    kill)
      # Kill synergy client.
      pkill -u $(whoami) synergyc
      ;;

    *)
      # Return synergy client process id.
      pgrep -u $(whoami) synergyc
      ;;
  esac
}

# Basic utility for both synergy server and synergy client.
#
# Usage:
#   synall kill
#       Kill all synergy processes owned by me (server & client).
#   synall
#       Return all synergy (server & client) process ids owned by me.

synall () {
  case $1 in
    kill)
      # Kill all synergy processes.
      pkill -u $(whoami) synergy
      ;;

    *)
      # Return all synergy process ids.
      pgrep -u $(whoami) -l synergy
      ;;
  esac
}
