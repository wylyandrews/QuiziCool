Hiya,

To make setting up the database on other computers easier, I've created a setup_database.sql file that will automatic run all the other necessary sql files in the directory. 
Just run the contents of the setup_database.sql file in the postgres database you are using, and make sure the directory matches the one the files are in.


Note:
Unfortunately, I have not made it automatically detect which directory it is in, so you'll have to manually change the directory for your computer. 
I'm looking into maybe setting up a batch file for it, but I have very little experience in batch that I don't think I'd be able to set one up anytime soon.
If you have some free time, maybe check that out, I might create an issue for it.

Thanks,

Wyly Andrews
