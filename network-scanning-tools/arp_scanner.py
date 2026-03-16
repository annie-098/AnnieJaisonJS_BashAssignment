# arp_scanner.py
# Program to read ARP table and show IP-MAC mapping

import subprocess
import re


# function to get arp table
def get_arp():

    try:
        # run arp command
        result = subprocess.run(
            ["arp", "-a"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        return result.stdout

    except Exception as e:
        print("Error:", e)
        return ""


# function to parse arp output
def parse_arp(output):

    # regex to find IP and MAC address
    pattern = r"(\d+\.\d+\.\d+\.\d+).*?([a-fA-F0-9:-]{17})"

    matches = re.findall(pattern, output)

    return matches


# function to display results
def display(entries):

    print("\nIP Address\t\tMAC Address")
    print("--------------------------------------")

    for ip, mac in entries:
        print(ip, "\t\t", mac)

    print("\nTotal entries:", len(entries))


# main program
if __name__ == "__main__":

    print("=== ARP Scanner ===")

    output = get_arp()

    entries = parse_arp(output)

    display(entries)

    # option to save results
    save = input("Save results to file? (y/n): ")

    if save.lower() == "y":

        with open("arp_results.txt", "w") as file:
            for ip, mac in entries:
                file.write(ip + " " + mac + "\n")

        print("Results saved to arp_results.txt")