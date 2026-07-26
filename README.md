# Description
This is a blueprint for you to create your own docker image for your modded minecraft java server. The current dockerfile supports auto boot up, initialize, and save upon stopping container.
# Details
The compose file will give you two volumes, one for the world (`minecraft-world`), one for the mods (`minecraft-mods`). These allow you to modify them later. Modify Server.Properties as you want if you want to enable PWD or `wcrcon` or anything else.
# How to use
1. Download/clone this repo, and set it as work-directory.
2. Put the server-side mods into the mods/ folder.
3. Put the mod-loader-installer.jar directly into the work-directory.
4. Build the dockerfile and then export the image.
5. Transfer the image.tar and compose.yml to your server with docker installed.
6. Create the container on your server.
7. Run the container.
8. Enjoy the game.
