from datetime import datetime, timedelta
from data.scoreboard_config import ScoreboardConfig
from renderers.main import MainRenderer
from renderers.offday import OffdayRenderer
from renderers.standings import StandingsRenderer
from RGBMatrixEmulator import RGBMatrix, RGBMatrixOptions
from utils import args, led_matrix_options
from data.data import Data
import renderers.standings
import mlbgame
import debug

SCRIPT_NAME = "MLB LED Scoreboard Emulated"
SCRIPT_VERSION = "1.1.0"

# Get supplied command line arguments
args = args()

# Check for led configuration arguments
matrixOptions = led_matrix_options(args)

# Initialize the matrix
matrix = RGBMatrix(options = matrixOptions)

# Print some basic info on startup
debug.info("{} - v{} ({}x{})".format(SCRIPT_NAME, SCRIPT_VERSION, matrix.width, matrix.height))

# Read scoreboard options from config.json if it exists
config = ScoreboardConfig("config", matrix.width, matrix.height)
debug.set_debug_status(config)

# Create a new data object to manage the MLB data
# This will fetch initial data from MLB
data = Data(config)

MainRenderer(matrix, data).render()
