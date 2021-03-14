## INSTALLATION

Clone the [repository.](https://github.com/jokocide/microscripts.git) Review the files and remove the directories that are not relevant to you. (ie 'pwsh' on unix systems)

the bash and pwsh directories include a .bashrc and profile.ps1 respectively, but the functions have been split off in to individual files because I sometimes like to keep them in a separate directory and add it to my [path](https://linuxize.com/post/how-to-add-directory-to-path-in-linux/) rather than pollute my configuration file with a ton of functions.

```sh
git clone https://github.com/jokocide/microscripts.git
```

I focus on developing the scripts in Powershell and BASH. They should all perform exactly the same barring any bugs, so you should delete the directories that are not relevant to you. Keeping everything together in one repository is easier for me, so I apologize for any inconvenience that might cause you.

## USAGE

If you are keeping the functions in a directory rather than adding them directly to your profile, you should be able to start typing the name of the function you are after to get some nice tab completion. This is assuming you didn't forget to add the directory to your path as described above, and you might also need to log out/in to get this working.

If you've added some of the functionality directly to your profile, don't forget to source the file.
