# Homework Repo Initializer

This is a ruby script that generates homework directories.

## Instructions:
1. Run the following command in the directory where you'd like to create a homework directory:
`curl https://raw.githubusercontent.com/Tenzang/homework-repo-initializer/main/homework-init.rb >> homework-init.rb`
2. Open `homework-init.rb` in a text editor and update the values of the `class_info` hash. *NOTE: For the students value simply go to your class' class-tracker spreadsheet, drag over all of the student names then copy & paste them into the `students` value. The script will handle the strange format of the pasted string.*
3. Run the script with `ruby homework-init.rb`.
4. Optionally run the following command to delete the script once you're done:
`rm homework-init.rb`

This will generate a homework directory in the directory that the `homework-init.rb` file is located.