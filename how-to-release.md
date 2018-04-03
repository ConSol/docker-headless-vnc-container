# How to release

* Check if `changelog.md` is correct
* Check if all features are merged in dev and pushed
* Pull the latest `dev` images
    
      .build/tag_image.sh dev 1.x.x --save
    
* Test if the latest `dev` build is usable
  * Change the the `FROM` statement in Sakuli `Dockerfile` to `dev` tag (in separate branch) and run (after build on dockerhub) [`docker/.build/tag_image.sh --save`](https://github.com/ConSol/sakuli/blob/master/docker/.build/tag_image.sh)  

* On success - push the tested `dev` images to dockerhub
    
      .build/tag_image.sh dev 1.x.x
      .build/tag_image.sh dev latest
      
* Merge `dev` branch to `master`

* Create a release on [github.com/ConSol/docker-headless-vnc-container/releases/new](https://github.com/ConSol/docker-headless-vnc-container/releases/new)
* Write a blog post for [labs.consol.de](https://labs.consol.de/)