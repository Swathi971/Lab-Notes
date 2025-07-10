### Shell Script Arguments Explanation
1. **Creating the Script**
```commandline
#!/bin/bash

name=$1
sub=$2

echo "hello $name & I like $sub"
```
* $1 → The first argument passed to the script
* $2 → The second argument
* name=$1 → Assigns the first argument to the variable name
* sub=$2 → Assigns the second argument to the variable sub
* echo prints a message using those variables

2. **Running the Script Without Arguments**
```commandline
./script.sh
```
##### Output:
```commandline
hello  & I like 
```
* You did not pass any arguments
* So $1 and $2 were empty
* Result: the script printed the sentence with empty variables

3. **Running the Script With Arguments**
```commandline
./script.sh swathi k8
```
##### Output:
```
hello swathi & I like k8
```
* swathi becomes $1 → assigned to name
* k8 becomes $2 → assigned to sub
* So the message prints correctly using the values you passed

##### Important concepts:
| Concept                 | Explanation                                                         |
| ----------------------- | ------------------------------------------------------------------- |
| `$1`, `$2`, `$3`...     | Positional parameters — arguments passed to a script                |
| `./script.sh swathi k8` | Passes `swathi` as `$1`, and `k8` as `$2`                           |
| Variables               | You stored `$1` in `name`, and `$2` in `sub` for better readability |

You created a shell script that uses positional arguments $1 and $2. When you don’t pass them, the values are empty. When you do pass them (swathi k8), they’re correctly used in the output.
Positional parameters ($1, $2, $3, etc.) allow you to make your scripts dynamic and reusable, accepting different inputs at runtime.
___
#### What are Positional Parameters in Shell Scripts?
Positional parameters are special variables like $1, $2, $3, etc., used to access arguments passed to a shell script or function.

##### Common Positional parameters:
| Parameter       | Description                              |
| --------------- | ---------------------------------------- |
| `$0`            | Name of the script itself (`./greet.sh`) |
| `$1`            | First argument passed (`Swathi`)         |
| `$2`            | Second argument (`Blue`)                 |
| `$3` and onward | Third, fourth, etc. arguments            |
| `$@`            | All arguments, as a list                 |
| `$*`            | All arguments, as a single string        |
| `$#`            | Number of arguments passed               |
| `$$`            | Process ID of the script                 |
| `$?`            | Exit status of the last command          |
##### Why They're Called “Positional”?
Because their value depends on their position when you run the script:
````
./script.sh arg1 arg2 arg3
          ↑    ↑    ↑
         $1   $2   $3

````
Positional parameters let you pass input into a script. They make your script flexible, reusable, and dynamic.






