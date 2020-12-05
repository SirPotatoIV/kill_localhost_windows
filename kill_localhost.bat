ECHO OFF
SET /P PORT="What port is localhost on?: "
netstat -ano | findstr %PORT%
SET /P PID="What is the PID of the port (far right column)?: "
taskkill /PID %PID% -F 