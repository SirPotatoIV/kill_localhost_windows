# Kill Localhost on a Windows Machine

Simple batch file, that can be run using CMD, that uses prompts to kill a port on a windows machine. Created becaues I'm lazy and don't want to remeber the 2 easy commands.


### How to Use

 1. Download the `kill_localhost.bat`.
     - Make sure to save the file in a spot you can easily get to in a terminal.
 2. Open the program cmd.
     - This can be done by going to the search icon in the taskbar and searching for cmd.
 3. Navigate to the folder that contains `kill_localhost.bat`.
 4. When in the folder, run the command `kill_localhost.bat`.
 5. You will be prompted for the port that localhost (or any Port you want to kill) is running on. Enter the number such as `3000`.
     - For a creat-react-app it is often 3000. For an express server it is often 8080.
 6. A table will be displayed of the connections that match this port number. If looking for localhost, it should be 0.0.0.0:3000, where 3000 will be the port number you are looking for.
 7. You will be prompted to enter the PID number for the port you want to kill. This is the furthest right column in the displayed connections. Enter that number such as `02304`. It can be all sorts of numbers.
 8. You should recieve back a success output message confirming the port was killed.


 ### How it Works

 There are 2 main commands used to accomplish this task. If you search for "How to kill a port on Windows, they should come up right away.
 
 1. `netstat -ano | findstr %PORT%`
     - `netstat` is a command that lists "network statistics". It shows all the network connections on your machine. The `-ano` part is a sent of options for the `netstat` command so we can see all the info we want. It is really short hand for 3 separate options, `-a -n -o`. 
     - `|` means we are "piping" or sending in the output of the command on the left into the command on right. The output of `netstat` is piped into `findstr`.
     - `findstr` is a filtering command that looks through your output and filters out what doesn't match your input into `findstr`. In this case we are filtering for `%PORT%`, which is a variable I am using to store your input into the question about what localhost port you want to kill.

  2. `taskkill /PID %PID% /F`
      - `taskkill` is a command that kills a task.
      - `/PID` is an option for `taskkill` that means we are going to pass a process ID to indicate what task we want to kill.
      - `%PID%` is a variable I am using to store your input into the question about what the PID is for the port you want to kill. 
      - `/F` is an option for `taskill`, that means to forcefully kill the task. Don't ask me, just do it.

## Alternative to this file

You could really just do 
```netstat -ano | findstr 3000``` 
(where 3000 is whatever localhost port you want to kill), look for the corresponding PID (the number in the far right column), and do 
```taskkill /PID 34235 /F```.
 
