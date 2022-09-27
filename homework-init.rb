class_info = {
    class_ID: 'SEIC57',
    IA_github_username: 'Tenzang',
    instructor_name: 'Joel',
    students: 'Alex Nicolaidis
    Brianna Danford
    Gissell Bustos
    Isabel Sousa Cruz
    Jason Luo
    Jikai Ren
    Joshua Luo
    Keshia Wijaya
    Michael A Anderson
    Minqian Xu
    Sophia Pache
    Talal Hamzeh'
}

# break up students string into array
class_info[:students] = class_info[:students].split("\n")
class_info[:students] = class_info[:students].map.with_index{|student, i| (i + 1).to_s.rjust(class_info[:students].size.digits.size, '0') + '-' + student.strip.split(' ').join('-')}

# create root directory
root = class_info[:class_ID] + '-homework'
`mkdir #{root}`
puts 'root directory created'

class_info[:students].each do |student|
    # create student directory
    `mkdir #{root}/#{student}`
    # week directories
    (1..12).each do |num|
        # create week directories
        next if num % 3 == 0 # skip if project week
        week = "wk#{num.to_s.rjust(2, '0')}"
        `mkdir #{root}/#{student}/#{week}`
        # day directories
        'mon tue wed thu fri'.split(' ').each.with_index do |day, i|
            day = "#{(i + 1).to_s}-#{day}"
            `mkdir #{root}/#{student}/#{week}/#{day}`
            `touch #{root}/#{student}/#{week}/#{day}/.gitkeep`
        end
    end
    puts "#{student} directory created"
end

# create README
readme_content = "# #{class_info[:class_ID]}

### Steps to do

1. Set up your repository.
2. Do your homework.
3. Submit your homework.

### Set up your repository

You only need to do this _**once**_, not every time you're submitting homework!

**1. Fork this repository**

_'Forking' creates a personal, 'forked' copy of this repository on your Github account._

- Hit the **Fork** button in the top right-hand corner of this page.

**2. Clone your forked repository to your computer**

_'Cloning' takes your 'forked' repository on GitHub and creates a local copy - or 'clone' - on your computer._

- Make sure you're browser is open to **your** forked version of this repository on Github (eg [http://github.com/{YOUR_USERNAME}/#{class_info[:class_ID]}-homework](http://github.com/{YOUR_USERNAME}/#{class_info[:class_ID]}-homework)).
- Hit the **Clone or Download** button in the top right-hand corner of the page and copy the URL to your clipboard.
- Open your computer's terminal to the directory in which you intend to store your homework.
- `git clone URL_OF_YOUR_FORK_ON_GITHUB` (where `URL_OF_YOUR_FORK_ON_GITHUB` is the URL you copied after hitting 'Clone or Download', above).

**3. Add an upstream remote repository**

_Adding an upstream repository links the local repository on your computer to the original repository on Github (i.e. mine, the one from which you created the fork)_

- `cd #{class_info[:class_ID]}-homework`
- `git remote add upstream https://github.com/#{class_info[:IA_github_username]}/#{class_info[:class_ID]}-homework.git`
- `git pull upstream main`

### Do your homework

You should put each night's homework in a new folder within the appropriate directory of your homework repo. So, for day two, where you have two tasks (\"Calculator\" and \"Strings\"), you might do something like this:

1. Open Terminal/iTerm2/Ubuntu;
2. Go to your local homework repo (eg, `cd ~/Projects/#{class_info[:class_ID]}-homework`);
3. From here, go to the folder matching your name within that repo, and the appropriate week / day (eg, `Taylor Swift/wk01`);
4. Create new folders for each of the day's homework tasks: (eg `mkdir calculator` and `mkdir strings`);
5. Create the files necessary to complete the homework in their respective directories;
6. Get to it!

### Submit your homework

You need to do this every time you're submitting homework.

- **Commit your work to your local repository progressively**
  - Make sure you are in the correct folder containing the homework you want to submit.
  - `git add .`
  - `git commit -m \"YOUR_COMMIT_MESSAGE_GOES_HERE\"`(where `YOUR_COMMIT_MESSAGE_GOES_HERE` is your description of the work you are committing)
- **Push your changes to your forked repository**
  - `git pull upstream main` - merge changes that have been made to this repository into your own local repository (if a weird screen appears on this step, PLEASE SEE THE **IMPORTANT 2** NOTED BELOW).
  - `git push origin main`
- **Once you're finished, submit a pull request for me to accept your homework**
  - Navigate to your forked version of this repository on Github (eg [https://github.com/{YOUR_USERNAME_HERE}/#{class_info[:class_ID]}-homework](https://github.com/{YOUR_USERNAME_HERE}/#{class_info[:class_ID]}-homework)).
  - Hit the **Pull request** button.
  - Make sure the destination for the pull request is set to my repository, not your own or anyone else's.
  * **IMPORTANT:**
    In the pull request comment, tell me the following:
    \"1. How difficult did you find this (out of 10)? (0 being no problems at all, 10 being impossible); 2. Was there anything that you struggled with?; 3. Is there anything that you'd like some further information on?; 4. Roughly how long did it take?\"
    **If you don't mention anything in the Pull Request comments, we will assume you had no problems at all with it, and you will receive no feedback about your homework.**
    If you want to follow up on any issues you had with the homework, the ideal time for that will be during the more unstructured lab time after lunch - come and see #{class_info[:instructor_name]} or myself then and we can go over any outstanding questions.
    **Note:** if I haven't yet merged your Pull Request into my main homework repo before it's time to submit the next day's homework, you won't be able to create a new Pull Request. That's okay - for the new homework just add a new comment to the open (existing) Pull Request, featuring the same four points given above to describe your response to it.
  * **IMPORTANT 2:**
    When you make pull request by `git pull upstream main`, git might generate the auto merge message for you. Don't panic! Just type `:wq` (it will weirdly appear on the bottom left of your screen once you start typing) and hit `return` key on your keyboard to accept the message, then you can move on with you life!"

`touch #{root}/README.md`

File.write "#{root}/README.md", readme_content

puts "README.md created"

# create a .gitignore file
gitignore_content = ".directory

### OSX ###
.DS_Store
.AppleDouble
.LSOverride

# Icon must end with two
Icon

# Thumbnails
._*

# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk

# End of https://www.gitignore.io/api/osx


# Ignore bundler config.
/.bundle

# Ignore the default SQLite database.
/db/*.sqlite3
/db/*.sqlite3-journal

# Ignore all logfiles and tempfiles.
/log/*

# ignore Rails cache files
tmp/
log/

!/log/.keep
!/tmp/.keep

node_modules/
/yarn-error.log

.byebug_history

# Ignore master key for decrypting credentials and more.
**/config/master.key"

`touch #{root}/.gitignore`

File.write "#{root}/.gitignore", gitignore_content

puts ".gitignore created"

# create pull request template file
template_content = "_If you had no problems you can just leave it empty_

- How difficult did you find this (out of 10)? (0 being no problems at all, 10 being impossible)
- Was there anything that you struggled with?
- Is there any particular code you want me to look into?
- Is there anything that you'd like some further information on?
- Roughly how long did it take?"

`touch #{root}/pull_request_template.md`

File.write "#{root}/pull_request_template.md", template_content

puts "pull_request_template.md created"

puts "#{class_info[:class_ID]}-homework repo initialized"
