#!/usr/bin/bash

# Detecting open relays

echo "[!] Detecting Open Relays: "
echo ""
#echo -e "[!] Skip this step ? (y/N): "
#sleep 0.5

sudo nmap -sV --script smtp-open-relay -v 74.118.139.186


echo "[!] Enumerating users in an SMTP server: "


#E-mail accounts used as usernames are very common in web applications, 
#and finding them is a necessary task when auditing mail servers. 
#Enumerating users via SMTP commands can obtain excellent results, 
#and thanks to the Nmap Scripting Engine we can automate this task.

sudo nmap -p25 –script smtp-enum-users 74.118.139.186


echo "[!] Detecting backdoor SMTP servers: "
#Compromised servers might have rogue SMTP servers installed and abused by spammers. 
#System administrators can use Nmap to help them monitor mail servers in their network.
#This recipe shows how to detect rogue SMTP servers by using Nmap.



sudo nmap -sV --script smtp-strangeport 74.118.139.186


echo "[!] Brute forcing SMTP passwords: "
#Mail servers often store very sensitive information, 
#and penetration testers need to perform brute force password auditing against them to check for weak passwords.
#This recipe will show you how to launch dictionary attacks against SMTP servers by using Nmap.

sudo nmap -p 25 --script smtp-brute 74.118.139.186



echo "Retrieving the capabilities of a POP3 mail server"
#POP3 mail servers may support different capabilities defined in RFC 2449. 
#By using a POP3 command we can list them, and thanks to Nmap, 
#we can automate this task and include this service information in our scan results.

sudo nmap -p110 --script pop3-capabilities 74.118.139.186

echo "[!] Brute forcing POP3 passwords: "
#E-mail accounts store sensitive information. 
#Penetration testers auditing mail servers must test for weak passwords that could help attackers compromise important accounts.
#This recipe shows you how to perform brute force password auditing against POP3 mail servers by using Nmap.

sudo nmap -p 110 --script pop3-brute 74.118.139.186


echo "[!] Retrieving the capabilities of an IMAP mail server: "

#IMAP servers may support different capabilities. There is a command named CAPABILITY that allows clients to list these supported 
#mail server capabilities, and we can use Nmap to automate this task.


sudo nmap -p143,993 --script imap-capabilities 74.118.139.186


echo "[!] Brute forcing IMAP passwords: "
#E-mail accounts store very sensitive information and penetration testers auditing a mail server must 
#detect weak passwords that could compromise e-mail accounts and the information accessible through them.

sudo nmap -p 143 --script imap-brute 74.118.186



#echo "[!] Detecting vulnerable Exim SMTP servers version 4.70 through 4.75: "
#Exim SMTP servers 4.70 through 4.75 with DKIM enabled are vulnerable to a format string bug that allows remote attackers to execute code. 
#Nmap NSE can help penetration testers to detect this vulnerability remotely.

#sudo nmap --script smtp-vuln-cve2011-1764 --script-args mailfrom=<Source address>,mailto=<Destination address>,domain=<domain> -p25,465,587 <target>
