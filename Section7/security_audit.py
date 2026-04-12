import socket,time
ports=[21,22,80,443]
services={21:"FTP",22:"SSH",80:"HTTP",443:"HTTPS"}

# Simple vulnerability database
vulns={
21:"Anonymous login possible",
22:"Weak SSH credentials",
80:"Unsecured HTTP",
443:"SSL/TLS issues"
}
target=input("Enter target IP: ")
start=time.time()
results=[]
print("\nScanning...\n")
for port in ports:
    sock=socket.socket()
    sock.settimeout(1)
    res=sock.connect_ex((target,port))
    status="OPEN" if res==0 else "CLOSED"
    print(f"Port {port}: {status}")
    service=services.get(port,"Unknown")
    vuln=vulns.get(port,"None") if status=="OPEN" else "-"
    results.append((port,status,service,vuln))
    sock.close()
end=time.time()

# HTML report
f=open("report.html","w")
f.write("<html><body>")
f.write(f"<h2>Report for {target}</h2>")
f.write("<table border='1'>")
f.write("<tr><th>Port</th><th>Status</th><th>Service</th><th>Vulnerability</th></tr>")
for r in results:
    f.write(f"<tr><td>{r[0]}</td><td>{r[1]}</td><td>{r[2]}</td><td>{r[3]}</td></tr>")
f.write("</table>")
f.write(f"<p>Scan Time: {end-start:.2f}s</p>")
f.write("</body></html>")
f.close()
print("\nReport saved as report.html")
