1. Password Strength Checker - create a script named "pass_strength.sh" that accepts user input and tells users if the password meets a minimum requirement of 8 characters, capital, lowercase, and numeric.Make sure to return the proper exit code. Below is an example of the script
```
./pass_strength.sh hello
echo $? # prints 1
./pass_strength.sh HELLOworld12
echo $? # prints 0
```
2. Using the data.txt file, obtain a value from each line the value of the key `39=`. Save it to a file symbols.txt.
```
cat << EOF > data.txt
34=0;22=10;39=GOOG;33=77;29=21;
34=0;22=10;44=883920;39=AAPL
39=X;27=2020;33=90009;
34=0;22=10;44=883920;39=SPY;41=40004;
EOF

# Desired output
# cat symbols.txt
# GOOG
# AAPL
# X
# SPY
```
3. Create a script called "mytest" that echos "hello world". Place it in your ~/scripts and add ~/scripts to your PATH variable in your .bashrc. Source the .bashrc file and make sure you can execute the mytest script in any working directory. Make sure your new path is the last entry in PATH variable.
4. Replace the word "variable1" with "ageVariable" in all files and sub-files in the /code dir. (This may require find or xargs command, since there are multiple files)
5. Consider the file below, and count how many lines contain the word GOOG or AAPL. Save it to count.txt
```
cat << EOF > data.txt
34=0;22=10;39=GOOG;33=77;29=21;
34=0;22=10;44=883920;39=AAPL
39=X;27=2020;33=90009;
34=0;22=10;44=883920;39=SPY;41=40004;
....
EOF
```
6. Using the ps command (and manual for it), save every process to a file. Only include the CPU usage, PID in the output. Save it to processes.txt. 
7. Fix the script below so that it loops over every array item, and prints the value of the key. EG. It should print Smith, not John.
   ```

    #!/bin/bash
    
    # Sample script with intentional errors
    
    # Error in creating an associative array of names
    NAMES=(John=Smith Alice=Johnson Bob=Williams)
    
    # Looping over the array with an error
    for $NAME in "${!NAMES[@]}"
    do
        echo "$NAME " # should print last name
    done

   
   ```
