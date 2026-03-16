# nmap_scanner.py
# Simple Nmap automation using Python

import subprocess


# check if nmap is installed
def check_nmap():

    try:
        subprocess.run(["nmap", "-V"], stdout=subprocess.PIPE)
        print("Nmap is installed\n")
        return True

    except:
        print("Nmap is not installed")
        return False


# run selected scan
def run_scan(target, choice):

    if choice == "1":
        command = ["nmap", "-sn", target]

    elif choice == "2":
        command = ["nmap", target]

    elif choice == "3":
        command = ["nmap", "-sV", target]

    elif choice == "4":
        command = ["nmap", "-O", target]

    else:
        print("Invalid option")
        return

    try:
        result = subprocess.run(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            timeout=60
        )

        return result.stdout

    except subprocess.TimeoutExpired:
        print("Scan timed out")


# main program
if __name__ == "__main__":

    print("=== Nmap Scanner ===")

    if not check_nmap():
        exit()

    target = input("Enter target IP or network: ")

    print("\nSelect scan type")
    print("1. Host Discovery")
    print("2. Port Scan (1-1000)")
    print("3. Service Version Detection")
    print("4. OS Detection")

    choice = input("Enter choice: ")

    print("\nScanning...\n")

    output = run_scan(target, choice)

    if output:
        print(output)

        save = input("Save results to file? (y/n): ")

        if save.lower() == "y":

            with open("nmap_results.txt", "w") as file:
                file.write(output)

            print("Results saved to nmap_results.txt")