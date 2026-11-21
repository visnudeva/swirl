#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include "sway/commands.h"
#include "sway/ipc-server.h"
#include "log.h"

struct cmd_results *bar_cmd_border_radius(int argc, char **argv) {
	struct cmd_results *error = NULL;
	if ((error = checkarg(argc, "border_radius", EXPECTED_EQUAL_TO, 1))) {
		return error;
	}

	char *end;
	int amount = strtol(argv[0], &end, 10);
	if (*end || amount < 0) {
		return cmd_results_new(CMD_INVALID,
				"Expected 'bar [<bar-id>] border_radius <px>'");
	}

	config->current_bar->border_radius = amount;
	sway_log(SWAY_DEBUG, "Setting bar border_radius to %d on bar: %s",
			amount, config->current_bar->id);

	if (!config->reading) {
		ipc_event_barconfig_update(config->current_bar);
	}

	return cmd_results_new(CMD_SUCCESS, NULL);
}
