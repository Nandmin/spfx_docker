Docker spfx development:

1. get dockerfile
2. run 'docker build . -t spfx-dev-env' in the dockerfile's folder
3. cd to the project conatiner dir
4. run 'docker run -itd --name spfx-dev-env -v ${PWD}:/usr/app/spfx -p 5432:5432 -p 4321:4321 -p 35729:35729 spfx-dev-env'
5. connect to the conatiner from vscode
6. add ' "hostname": "0.0.0.0",' to the config/serve.json below https
7. copy /home/spfx/.gcb-serve-data/gcb-serve.cer to /usr/app/spfx/gcb-serve.cer
8. in windows explorer go to the project container folder and install the .cer to the trusted root authoritites

+1: if there is an Error – ‘copy-static-assets’ after gulp serve, delete the lib or dist folder based on the error and rerun gulp serve