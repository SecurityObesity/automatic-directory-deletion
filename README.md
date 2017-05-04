What is Automatic Local Directory Deletion Script?
==================================================

This script is developed for Mac OS X in Shell Script and meant to be working in Linux based systems. It is developed with focus on cleaning
removing temporary files and subdirectory for a every given directory path in the local filesystem. You need to run this script with root privileges.

What is the functionality?
--------------------------

1. Running the script manuelly by passing --run argument parameter and follow the instructions. Run as Root.
2. Automatic running the script by passing --clean and enable deletion verbosity with --verbose as second argument. Run as Root.
3. Delete every single directory and every single file in the directory path.
4. Using cronjob as scheduled tasks to run automatic clean up

Getting Started
---------------

No dependencies and no setup needed. Just run the script on a given system after manual configuration in the script.

Security Alert Awareness
========================

You need to be absolute sure which directory paths you specify in the configuration. The script is powerful.


