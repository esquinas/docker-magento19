#!/usr/bin/env bash
hold_on() {
    # call with a prompt string or use a default
    read -n 1 -r -s -p "${1:-Press any key to continue...}"
}
hold_on "Press any key to start streaming containers' logs to this console, press Ctrl+C to exit" && docker-compose logs -tf
