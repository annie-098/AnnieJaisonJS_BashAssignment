# ping_scanner.py
# Simple Ping Scanner using Python

import subprocess
import platform
import re


# function to ping a host
def ping_host(host):

    # detect operating system
    os_name = platform.system()

    # windows uses -n , linux/mac uses -c
    if os_name == "Windows":
        count = "-n"
    else:
        count = "-c"

    try:
        # run ping command
        result = subprocess.run(
            ["ping", count, "4", host],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        output = result.stdout

        # check if ping was successful
        if result.returncode == 0:
            print("\nHost:", host)
            print("Status: Reachable")

            # extract response time using regex
            match = re.search(r"time[=<]\s*(\d+)", output)

            if match:
                print("Response Time:", match.group(1), "ms")
        else:
            print("\nHost:", host)
            print("Status: Unreachable")

    except Exception as e:
        print("Error:", e)


# main program
if __name__ == "__main__":

    print("=== Ping Scanner ===")

    choice = input("Scan single host or multiple hosts? (s/m): ")

    # single host
    if choice == "s":
        host = input("Enter hostname or IP: ")
        ping_host(host)

    # multiple hosts
    else:
        hosts = input("Enter hosts separated by comma: ")

        host_list = hosts.split(",")

        for host in host_list:
            ping_host(host.strip())