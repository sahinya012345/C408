What is Vim?
Vim, short for Vi IMproved, is a highly configurable text editor built to enable efficient text editing. It’s an enhanced version of the Vi editor, which was developed back in the 1970s. Vim is widely used by programmers, system administrators, and anyone who spends a significant amount of time working in the terminal

Vim Editor in Linux

Installation and Configure Vim in Our Linux System
Modes in Vim:
Basic Commands in Vim:
Navigating in Vim:
Deletion Commands in Vim:
Search in Vim Editor
Search and Replace in Vim Editor
Pratical Implementation of Command in Vim Editor
Installation and Configure Vim in Our Linux System
Most Linux distributions come with Vim pre-installed. However, if it’s not available on your system, you can install it using your package manager. For instance, on Ubuntu or Debian, you can use:

sudo apt-get install vim
To install vim on an arch-based distro run the following command:

sudo pacman -S vim
Now vim will be installed on your system. 

Modes in Vim:
One of the unique features of Vim is its modes. Vim has several modes, each serving a different purpose:

Normal Mode: This is the default mode when you first open Vim. In this mode, you can navigate the file, delete text, copy text, and perform other commands.
Insert Mode: This mode allows you to insert and edit text. To enter Insert Mode from Normal Mode, press `i`.
Visual Mode: In this mode, you can visually select blocks of text. To enter Visual Mode from Normal Mode, press `v`.
Command-Line Mode: This mode lets you enter Vim commands. To enter Command-Line Mode from Normal Mode, press `:`.
Basic Commands in Vim:
Here are some basic commands to get you started:

Saving a File: In Normal Mode, type `:w` and press Enter to save the file.
Exiting Vim: In Normal Mode, type `:q` and press Enter to quit Vim. If you have unsaved changes, you’ll need to use `:q!` to force quit.
Saving and Quitting: To save and quit in one command, type `:wq` and press Enter.
Navigating in Vim:
Moving the Cursor: Use the arrow keys or `h`, `j`, `k`, `l` keys to move left, down, up, and right respectively.
Jumping to the Beginning or End of a Line: Press `0` to jump to the beginning of a line and $ to jump to the end.
Jumping to a Specific Line: Type `:<line_number>` and press Enter to jump to a specific line.
Deletion Commands in Vim:
Always use the Esc key to go into normal mode and use the insertion, deletion keys, and other keys. 

To delete the word move the cursor to the beginning of the word and use dw command in normal mode. The word under the cursor will be deleted.

dw
To delete more than one word in a single line use the following command.

To delete 2 words use the command

d2w
To delete the line move cursor to the beginning of the line and use d$ command in normal mode. The line under the cursor will be deleted.

d$
Undo and Redo:

As we are programmers most time we are using undo and redo .vim to provide these to both features in it. To undo press u key in normal mode

u
To redo use the ctrl+r key in normal mode in vim

ctrl+r
Search in Vim Editor
To search the word After the cursor uses the backslash key and then write the word and press enter.

:/word
Use n to move on next matching word

:n
Use N to move on previous matching word

:N
Search and Replace in Vim Editor
To replace the word in file use s/ command in vim like

:s/searchword/replaceword/
To do replace all occurrence of word use g 

:s/searchword/replaceword/g
This command will replace the word globally.

To confirm before replacements of words use gc.

:s/searchword/replaceword/gc
To use this command in the whole file use % before the command.

:%s/searchword/replaceword/gc
Pratical Implementation of Command in Vim Editor
You can open vim by running vim command on the terminal.

vim 
vim window

There are some commands given to use the vim editor. You can see all commands, and it’s documentation by help command as follows:

:help
Now to exit type this command 

:q!

vim help

Now, Let’s Start to use Vim

To open a file in vim editor just write the file name after the vim command in the terminal as follows:

vim filename.txt
Then the file will be opened.

Write into file 
In the previous step we have opened the file now, Let’s write some content in to write data we need to go in insert mode. To go into write mode type i.  As follows:

i
After going into insert mode you will see INSERT in the status bar. After that, we can write any data in it.

vim window

Save and Exit:
We have written the data into a file now the task is to save and exit the file to do that first exit from insert mode by pressing the Esc key. To write a command first type semicolon  (  :  )  and then type the command wq!  or x! (both do the same thing) And then hit ENTER.

:wq!

vim window for save and exit

Exit without saving the file:
To exit from the file without saving the file just use the command q! As follows

:q!

Vim also comes with its own tutorial. You can see this tutorial by command vimtutor into the terminal .

vimtutor

vim window for save and exit

Now vim tutorial will be opened as follows:

vim window for save and exit

Text Editing: Insertion
We have edited some text files before by using the i key. There are Four keys used for the insertion of text. Just type the key into the normal mode in vim.

 i    ->   This key is used to put the cursor before the current position.
 a    ->   This key is used to put the cursor after the current position.
 o    ->   This key is used to put the cursor below the line.
 O    ->   This key is used to puts the cursor above the line.
Motion: Motions provide context to your Operators. These execute the action in a particular way.

Here is a list of some motions

w - until the start of the next word, EXCLUDING its first character.
e - to the end of the current word, INCLUDING the last character.
$ - to the end of the line, INCLUDING the last character.
We can use motion with the d key and with many more keys

Count: Count is the number for which replete the motion for count number. Here is a demonstration of the use of count and motion

To move courser 2 words forward use the following command

2w
Here 2 is the number of counts and w is used for word

To move the cursor 4 lines forward use the following command

4$
