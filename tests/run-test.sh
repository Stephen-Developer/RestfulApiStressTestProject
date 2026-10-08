if [ $# -lt 3 ]; then
  echo "Usage: $0 <threads> <rampup> <loops> [slow|veryslow|normal]"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

JMX_FILE="$PROJECT_DIR/RestfulApiTesting.jmx"

THREADS=$1
RAMPUP=$2
LOOPS=$3
SPEED_PROFILE=${4:-normal}

case "$SPEED_PROFILE" in
  slow)
    CPS=7168 # 56kbs dial up equilivant.
    ;;
  veryslow)
    CPS=2048 # I don't even know how slow.
    ;;
  normal)
    CPS="" # No limit
    ;;
  *)
    echo "Unknown speed profile: $SPEED_PROFILE"
    exit 1
    ;;
esac

echo "Running test:"
echo " Threads: $THREADS"
echo " RampUp : $RAMPUP"
echo " Loops : $LOOPS"

RESULT_DIR="${PROJECT_DIR}/results/threads${THREADS}_rampup${RAMPUP}_loops${LOOPS}_${SPEED_PROFILE}"

mkdir -p "$RESULT_DIR"

JMETER_ARGS=(
  -n
  -t "$JMX_FILE"
  -Jthreads="$THREADS"
  -Jrampup="$RAMPUP"
  -Jloops="$LOOPS"
  -l "$RESULT_DIR/results.jtl"
  -e
  -o "$RESULT_DIR/dashboard"
  -Jjmeter.reportgenerator.overall_granularity=1000
)

if [ -n "$CPS" ]; then
  JMETER_ARGS+=(
    -Jhttpclient.socket.http.cps=${CPS}
    -Jhttpclient.socket.https.cps=${CPS}
  )
fi

jmeter "${JMETER_ARGS[@]}"

cat > "$RESULT_DIR/test.properties" << EOF
threads=$THREADS
rampup=$RAMPUP
loops=$LOOPS
speed=$SPEED_PROFILE
cps=$CPS
date=$(date)
EOF
