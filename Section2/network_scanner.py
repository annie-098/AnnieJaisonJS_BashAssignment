import socket
import time
def scan_port(target, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(1)
    result = sock.connect_ex((target, port))
    sock.close()
    if result == 0:
        return "OPEN"
    else:
        return "CLOSED"

target = input("Enter target IP: ")
ports_input = input("Enter ports (comma-separated, e.g., 21,22,80): ")
ports = [int(p.strip()) for p in ports_input.split(",")]
start_time = time.time()
with open("scan_results.txt", "w") as file:
    file.write(f"Scanning Target: {target}\n")
    file.write("---------------------------------\n")
    for port in ports:
        status = scan_port(target, port)
        result_line = f"Port {port}: {status}"        
        print(result_line)
        file.write(result_line + "\n")
end_time = time.time()
duration = end_time - start_time
print("\nScan completed in {:.2f} seconds".format(duration))
with open("scan_results.txt", "a") as file:
    file.write("---------------------------------\n")
    file.write(f"Scan Duration: {duration:.2f} seconds\n")
